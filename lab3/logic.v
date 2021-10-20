
///////////////////////////////////////////////////////////////////////////////
// 
// BASIC LOGIC OPERATIONS
//
///////////////////////////////////////////////////////////////////////////////
module logic_operations (
    out, a, b, opcode
);
parameter N = 16;
output [N-1:0] out;
reg [N-1:0] out_reg;
input [N-1:0] a;
input [N-1:0] b;
input [2:0] opcode;

assign out = out_reg;

always @(a or b or opcode) begin
    case (opcode)
        3'b000: begin
            // AND
            out_reg = a & b;
        end
        3'b001: begin
            // OR
            out_reg = a | b;
        end
        3'b010: begin
            // XOR
            out_reg = a ^ b;
        end
        3'b100: 
        begin
            // NOT A
            out_reg = ~a;
        end
        default: 
        begin
            out_reg = 0;
        end
    endcase
end

endmodule