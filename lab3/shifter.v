
////////////////////////////////////////////////////////////////////////////////
// 
// N-BIT MUX
//
////////////////////////////////////////////////////////////////////////////////
module demux (
    out, sel, bits_in
);
    parameter SEL_BITS = 1;
    output out;
    input sel[SEL_BITS-1:0];
    input bits_in[2**SEL_BITS - 1: 0];

    assign out = bits_in[sel];
endmodule


////////////////////////////////////////////////////////////////////////////////
// 
// SHIFTER
//
////////////////////////////////////////////////////////////////////////////////