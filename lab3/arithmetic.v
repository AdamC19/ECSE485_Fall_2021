
////////////////////////////////////////////////////////////////////////////////
// 
// ARITHMETIC UNIT
//
////////////////////////////////////////////////////////////////////////////////
module arithmetic(result, cout, vout, opcode, a, b, cin, coe);
    parameter N = 16;
    output [N-1:0] result;
    output cout;
    output vout;
    input [N-1:0] a;
    input [N-1:0] b;
    input [2:0] opcode;
    input cin, coe;

    reg [N-1:0] adder_a = 0;
    reg [N-1:0] adder_b = 0;
    reg adder_cin = 1'b0;
    reg cout_reg;
    reg vout_reg;
    wire [N-1:0] adder_out;
    wire adder_cout;

    adder #(N) ADD(adder_out, adder_cout, adder_a, adder_b, adder_cin);
    assign result = adder_out;
    assign cout = cout_reg;
    assign vout = vout_reg;

    always @(a or b or cin) begin
        case (opcode)
            3'b000: 
            begin
                // signed addition
                adder_a = a;
                adder_b = b;
                adder_cin = cin;
                if(coe == 1'b0) cout_reg = adder_cout;
                else cout_reg = 1'bz;
            end
            3'b001:
            begin
                // unsigned addition
            end
            3'b010:
            begin
                // subtraction
                // a + (-b) -> c
                adder_a = a;

                // take the bitwise negation of b and add 1
                adder_b = ~b;
                adder_cin = 1'b1;
                // result = adder_out;
            end  
            3'b011:
            begin
                // unsigned subtraction
            end
            3'b100:
            begin
                // increment
                // a + 1 -> c
                adder_a = a;
                adder_b = 16'h01;
                // result = adder_out;
            end
            3'b101:
            begin
                // decrement
                // a + 1 -> c
                adder_a = a;
                adder_b = 16'b1111111111111101;
                // result = adder_out;
            end
            default: 
            begin
                
            end
        endcase
    end
endmodule