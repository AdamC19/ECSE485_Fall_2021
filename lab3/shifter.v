
////////////////////////////////////////////////////////////////////////////////
// 
// SHIFTER
//
////////////////////////////////////////////////////////////////////////////////
module shifter_16bit (
    result, a, b, opcode
);
    parameter BITS = 16;
    
    output [BITS-1:0] result;
    input [BITS-1:0] a;
    input [BITS-1:0] b;
    input [2:0] opcode;

    reg [BITS-1:0] result_reg;

    assign result = result_reg;


    // get the data ready
    reg [3:0] mux_sel_word;
    reg [3:0] mux_sel_words [0:BITS-1];   // registers for the select inputs to the muxes
    reg [BITS-1:0] mux_inputs [0:BITS-1]; // registers for inputting data to each mux


    wire [18:0] mux_wires; // 16 + (4-1) = 19, wires between first stage of muxes to final stage of muxes


    // SOURCE GENERATOR 
    reg [1:0] source_ctl_word;
    wire [2*BITS - 2:0] source_bits;

    genvar i;
    generate
        for(i = 0; i < (2*BITS - 1); i = i+1) begin
            if (i < BITS-1) begin
                
            end
            mux #(2) MUX();
        end
    endgenerate

    // GENERATE THE MUXES
    genvar i;

    generate
        for (i=0; i<BITS; i=i+1) begin
            mux #(4) MUX(result[i], mux_sel_word, mux_inputs[i]);
        end
    endgenerate

    always @(a or b) begin
        case (opcode)
            3'b000: begin
                // left-shift A by B
                // LSB of output needs to point to 0
            end
            3'b001: begin
                // right-shift A by B
            end
            3'b010: begin
                // arithmetic left shift of A by B
                // same as logical left shift
            end
            3'b011: begin
                // arithmetic right shift of A by B
                // pad MSB with sign bit
            end
        endcase
    end

endmodule