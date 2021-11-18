module alu (
    result, cout, vout, a, b, cin, coe, alu_code
);
    output [15:0] result;
    output cout, vout;
    input [15:0] a;
    input [15:0] b;
    input cin, coe;
    input [4:0] alu_code;
    
    wire [1:0] operation = alu_code[4:3];
    wire [2:0] opcode = alu_code[2:0];

    wire [15:0] arith_out;
    wire [15:0] logic_out;
    wire [15:0] shift_out;
    wire [15:0] cond_out;
    wire cout_gate, vout_gate;

    arithmetic          #(16) ARITHMETIC    (arith_out, cout_gate, vout_gate, opcode, a, b, cin, coe);
    logic_operations    #(16) LOGIC         (logic_out, a, b, opcode);
    shifter             #(16) SHIFTER       (shift_out, a, b, opcode);
    conditional         #(16) CONDITIONAL   (cond_out, a, b, opcode);

    output_mux          #(16) OUTPUT_MUX    (result, cout, vout, arith_out, cout_gate, vout_gate, logic_out, shift_out, cond_out, operation, coe);

endmodule