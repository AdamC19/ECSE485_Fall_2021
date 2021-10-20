///////////////////////////////////////////////////////////////////////////////
// 
// N-BIT ADDER
//
///////////////////////////////////////////////////////////////////////////////
module adder(sum, cout, a, b, cin);

parameter BITS = 16;

output [BITS-1:0] sum;
output cout;

input [BITS-1:0] a;
input [BITS-1:0] b;
input cin;

wire [BITS:0] tmp;

assign tmp = a + b + cin;
assign sum = tmp[BITS-1:0];
assign cout = tmp[BITS];


endmodule