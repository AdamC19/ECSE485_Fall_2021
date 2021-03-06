
///////////////////////////////////////////////////////////////////////////////
// 
// SHIFTER
//
///////////////////////////////////////////////////////////////////////////////
module shifter (
    result, a, b, opcode
);
    parameter BITS = 16;
    
    output [BITS-1:0] result;
    input [BITS-1:0] a;
    input [BITS-1:0] b;
    input [2:0] opcode;

    reg [BITS-1:0] result_reg;

    assign result = result_reg;

    always @(a or b) begin
        case (opcode)
            3'b000: begin
                // left-shift A by B
                // LSB of output needs to point to 0
                result_reg = a << b;
            end
            3'b001: begin
                // right-shift A by B
                result_reg = a >> b;
            end
            3'b010: begin
                // arithmetic left shift of A by B
                // same as logical left shift
                result_reg = a << b;
            end
            3'b011: begin
                // arithmetic right shift of A by B
                // pad MSB with sign bit
                if (a[BITS-1] == 1) begin
                    result_reg = (a >> b) | (32'hFF00 >> b);
                end else begin
                    result_reg = (a >> b);
                end
            end
            default: begin
                result_reg = 0;
            end
        endcase
    end

endmodule