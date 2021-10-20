

////////////////////////////////////////////////////////////////////////////////
// 
// N-BIT DEMUX
//
////////////////////////////////////////////////////////////////////////////////
module demux (
    bits_out, sel, bit_in
);
    parameter SEL_BITS = 1;
    output [2**SEL_BITS - 1: 0] bits_out;
    input [SEL_BITS-1:0] sel;
    input bit_in;
    
    assign bits_out = (bit_in << sel);
endmodule

////////////////////////////////////////////////////////////////////////////////
// 
// N-BIT MUX
//
////////////////////////////////////////////////////////////////////////////////
module mux (
    out, sel, bits_in
);
    parameter SEL_BITS = 1;
    output out;
    input [SEL_BITS-1:0] sel;
    input [2**SEL_BITS - 1: 0] bits_in;

    assign out = bits_in[sel];
endmodule


////////////////////////////////////////////////////////////////////////////////
// 
// ALU INPUT DE-MUX
//
////////////////////////////////////////////////////////////////////////////////
module alu_input_demux(out_a0, out_a1, out_a2, out_a3, out_b0, out_b1, out_b2, out_b3, a_in, b_in, sel);

    output [15:0] out_a0;
    output [15:0] out_a1;
    output [15:0] out_a2;
    output [15:0] out_a3;
    output [15:0] out_b0;
    output [15:0] out_b1;
    output [15:0] out_b2;
    output [15:0] out_b3;
    input [15:0] a_in;
    input [15:0] b_in;
    input [1:0] sel;

    genvar i;

    // (x16) 4-BIT DEMUXES FOR A
    generate
        for(i=0; i<16; i++) begin
            demux #(2) DEMUX({out_a0[i], out_a1[i], out_a2[i], out_a3[i]}, sel, a_in[i]);
        end
    endgenerate

    // (x16) 4-BIT DEMUXES FOR B
    generate
        for(i=0; i<16; i++) begin
            demux #(2) DEMUX({out_b0[i], out_b1[i], out_b2[i], out_b3[i]}, sel, b_in[i]);
        end
    endgenerate
endmodule