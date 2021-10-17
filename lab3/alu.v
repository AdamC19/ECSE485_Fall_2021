module alu (
    result, cout, vout, a, b, cin, coe, alu_code
);
    output result[15:0];
    output cout, vout;
    input a[15:0];
    input b[15:0];
    input alu_code[4:0];
    input cin, coe;
    
endmodule