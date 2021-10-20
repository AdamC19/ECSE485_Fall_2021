module alu (
    result, cout, vout, a, b, cin, coe, alu_code
);
    output [15:0] result;
    output cout, vout;
    input [15:0] a;
    input [15:0] b;
    input [4:0] alu_code;
    input cin, coe;
    
    wire [1:0] operation = alu_code[4:3];
    wire [2:0] opcode = alu_code[2:0];

    wire [15:0] arith_out;
    wire [15:0] logic_out;
    wire [15:0] shift_out;
    wire [15:0] cond_out;
    wire cout_gate, vout_gate;

    arithmetic #(16) ARITHMETIC(arith_out, cout_gate, vout_gate, opcode, a, b, cin, coe);
    logic_operations #(16) LOGIC(logic_out, a, b, opcode);
    shifter #(16) SHIFTER(shift_out, a, b, opcode);
    conditional #(16) CONDITIONAL(cond_out, a, b, opcode);

    assign result = (operation == 2'b00 ? arith_out : 
                    (operation == 2'b01 ? logic_out : 
                    (operation == 2'b10 ? shift_out : 
                    (operation == 2'b11 ? cond_out : 
                    16'h00
                    ) ) ) );
    assign cout = (!coe && (operation == 2'b00)) ? cout_gate : 0;
    assign vout = (!coe && (operation == 2'b00)) ? vout_gate : 0;


endmodule