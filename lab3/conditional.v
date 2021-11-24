
///////////////////////////////////////////////////////////////////////////////
// 
// CONDITIONAL OPERATIONS
//
///////////////////////////////////////////////////////////////////////////////
module conditional(result, a, b, opcode);
    parameter BITS = 16;
    output [BITS-1:0] result;
    input [BITS-1:0] a;
    input [BITS-1:0] b;
    input [2:0] opcode;

    reg [BITS-1:0] result_reg;

    assign result = result_reg;

    wire [1:0] ab_msbs;
    assign ab_msbs = {a[BITS-1], b[BITS-1]};

    always @(a or b or opcode) begin
        case(opcode)
            3'b000: begin
                case(ab_msbs)
                    2'b11:begin // both negative, take greater-than-or-equal-to
                        result_reg = a >= b;
                    end
                    2'b10:begin // a must be less than b
                        result_reg = 1;
                    end
                    2'b01: begin // a must be not less than b
                        result_reg = 0;
                    end
                    2'b00: begin
                        result_reg = a <= b;
                    end
                endcase
            end
            3'b001: begin
                case(ab_msbs)
                    2'b11:begin // both negative, take whichever is greater
                        result_reg = a > b;
                    end
                    2'b10:begin // a must be less than b
                        result_reg = 1;
                    end
                    2'b01: begin // a must be not less than b
                        result_reg = 0;
                    end
                    2'b00: begin
                        result_reg = a < b;
                    end
                endcase
            end
            3'b010: begin
                case(ab_msbs)
                    2'b11:begin // both negative, take whichever is less-than-or-equal-to
                        result_reg = a <= b;
                    end
                    2'b10:begin // a must be less than b
                        result_reg = 0;
                    end
                    2'b01: begin // a must be not less than b
                        result_reg = 1;
                    end
                    2'b00: begin
                        result_reg = a >= b;
                    end
                endcase
            end
            3'b011: begin
                case(ab_msbs)
                    2'b11:begin // both negative, take whichever is less-than-or-equal-to
                        result_reg = a < b;
                    end
                    2'b10:begin // a must be less than b
                        result_reg = 0;
                    end
                    2'b01: begin // a must be not less than b
                        result_reg = 1;
                    end
                    2'b00: begin
                        result_reg = a > b;
                    end
                endcase
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
            default: begin
                result_reg = 0;
            end
        endcase
    end

endmodule