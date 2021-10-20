
// ////////////////////////////////////////////////////////////////////////////////
// // 
// // HALF ADDER
// //
// ////////////////////////////////////////////////////////////////////////////////
// module half_adder (
//     sum, cout, a, b
// );

// output sum, cout;

// input a, b;

// assign cout = a & b;
// assign sum = a ^ b;

// endmodule


// ////////////////////////////////////////////////////////////////////////////////
// // 
// // 1-BIT FULL ADDER
// //
// ////////////////////////////////////////////////////////////////////////////////
// module full_adder(sum, cout, a, b, cin);

// output sum, cout;
// input a, b, cin;

// wire sum1, cout1, cout2;

// half_adder HA1(sum1, cout1, a, b);
// half_adder HA2(sum, cout2, sum1, cin);

// assign cout = cout1 | cout2;

// endmodule

////////////////////////////////////////////////////////////////////////////////
// 
// N-BIT ADDER
//
////////////////////////////////////////////////////////////////////////////////
module adder(sum, cout, a, b, cin);

parameter BITS = 16;

output [BITS-1:0] sum;
output cout;

input [BITS-1:0] a;
input [BITS-1:0] b;
input cin;

wire [BITS:0] tmp;

// assign sum = sum_reg[BITS-1:0];
// assign cout = sum_reg[BITS];
assign tmp = a + b + cin;
assign sum = tmp[BITS-1:0];
assign cout = tmp[BITS];

// wire [BITS-1:0] carry_bits;

// assign cout = carry_bits[BITS - 1];

// genvar i;

// generate 

//     for(i = 0; i=0; i < BITS; i=i+1) begin : genloop
//         if (i == 0) begin
//             full_adder FAi(sum[i], carry_bits[i], a[i], b[i], cin);
//         end else begin
//             full_adder FAi(sum[i], carry_bits[i], a[i], b[i], carry_bits[i-1]);
//         end
//     end
// endgenerate


endmodule