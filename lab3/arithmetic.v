
///////////////////////////////////////////////////////////////////////////////
// 
// ARITHMETIC UNIT
//
///////////////////////////////////////////////////////////////////////////////
module arithmetic(result, cout, vout, opcode, a, b, cin, coe);
    parameter N = 16;
    output [N-1:0] result;
    output cout;
    output vout;
    input [2:0] opcode;
    input [N-1:0] a;
    input [N-1:0] b;
    input cin, coe;

    reg [N-1:0] adder_a;
    reg [N-1:0] adder_b;
    reg adder_cin;
    reg vout_reg;
    wire adder_cout;

    adder #(N) ADD(result, adder_cout, adder_a, adder_b, adder_cin);
    
    assign vout = vout_reg;
    assign cout = !coe ? adder_cout : 0;

    always @(a or b or cin or opcode) begin
        case (opcode)
            3'b000: 
            begin
                // signed addition
                adder_a = a;
                adder_b = b;
                adder_cin = cin;
                vout_reg = (result[N-1] != b[N-1]) && (a[N-1] != b[N-1]);
            end
            3'b001:
            begin
                // unsigned addition
                adder_a = a;
                adder_b = b;
                adder_cin = cin;
                vout_reg  = adder_cout;
            end
            3'b010:
            begin
                // subtraction
                // a + (-b) -> c
                adder_a = a;

                // take the bitwise negation of b and add 1
                adder_b = ~b;
                adder_cin = 1'b1;
                // check for carry into, but not out of, the most significant bit
                vout_reg = (result[N-1] != b[N-1]) && (a[N-1] != b[N-1]);
            end  
            3'b011:
            begin
                // unsigned subtraction
                // a + (-b) -> c
                adder_a = a;

                // take the bitwise negation of b and add 1
                adder_b = ~b;
                adder_cin = 1'b1;
                // result = adder_out;
                vout_reg = adder_cout == 1;
            end
            3'b100:
            begin
                // increment
                // a + 1 -> c
                adder_cin = 1'b0;
                adder_a = a;
                adder_b = 16'h0001;
                // result = adder_out;
                vout_reg = (result[N-1] != b[N-1]) && (a[N-1] != b[N-1]);
            end
            3'b101:
            begin
                // decrement
                // a + (-1) -> c
                adder_cin = 1'b0;
                adder_a = a;
                adder_b = 16'b1111111111111111;
                // result = adder_out;
                vout_reg = (result[N-1] != b[N-1]) && (a[N-1] != b[N-1]);
            end
            default: 
            begin
                adder_cin = 0;
                adder_a = 0;
                adder_b = 0;
                vout_reg = 0;
            end
        endcase
    end
endmodule