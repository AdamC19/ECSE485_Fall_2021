
////////////////////////////////////////////////////////////////////////////////
// 
// CONDITIONAL OPERATIONS
//
////////////////////////////////////////////////////////////////////////////////
module conditional(result, a, b, opcode);
    parameter BITS = 16;
    output [BITS-1:0] result;
    input signed [BITS-1:0] a;
    input signed [BITS-1:0] b;
    input [2:0] opcode;

    reg [BITS-1:0] result_reg;

    assign result = result_reg;

    always @(a, b, opcode) begin
        case(opcode)
            3'b000: begin
                if(a <= b) begin
                    result_reg = 1;
                end else begin
                    result_reg = 0;
                end
            end
            3'b001: begin
                if(a < b) begin
                    result_reg = 1;
                end else begin
                    result_reg = 0;
                end
            end
            3'b010: begin
                if(a >= b) begin
                    result_reg = 1;
                end else begin
                    result_reg = 0;
                end
            end
            3'b011: begin
                if(a > b) begin
                    result_reg = 1;
                end else begin
                    result_reg = 0;
                end
            end
            3'b100: begin
                if(a == b) begin
                    result_reg = 1;
                end else begin
                    result_reg = 0;
                end
            end
            3'b101: begin
                if(a != b) begin
                    result_reg = 1;
                end else begin
                    result_reg = 0;
                end
            end
        endcase
    end

endmodule