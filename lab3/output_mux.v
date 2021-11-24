module output_mux(c, cout, vout, arith_route, cout_gate, vout_gate, logic_route, shifter_route, conditional_route, op_select, coe);

parameter N = 16;

output [N-1:0] c;
output cout, vout;

input [N-1:0] arith_route;
input cout_gate, vout_gate;
input [N-1:0] logic_route;
input [N-1:0] shifter_route;
input [N-1:0] conditional_route;
input [1:0] op_select;
input coe;

assign c =  (op_select == 2'b00 ? arith_route : 
            (op_select == 2'b01 ? logic_route : 
            (op_select == 2'b10 ? shifter_route : 
            (op_select == 2'b11 ? conditional_route : 
            16'h00
            ) ) ) );

assign cout = (!coe && (op_select == 2'b00)) ? cout_gate : 0;
assign vout = (!coe && (op_select == 2'b00)) ? vout_gate : 0;

endmodule