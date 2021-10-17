
////////////////////////////////////////////////////////////////////////////////
// 
// BASIC LOGIC OPERATIONS
//
////////////////////////////////////////////////////////////////////////////////
module logic_operations (
    out, a, b, opcode
);
parameter N = 16;
output out[N-1:0];
input a[N-1:0];
input b[N-1:0];
input opcode[2:0];

begin
    case (opcode)
        3'b000: 
            // AND
            out = a & b;
        3'b001: 
            // OR
            out = a | b;
        3'b010: 
            // XOR
            out = a ^ b;
        3'b100: 
            // NOT A
            out = ~a;
        default: 
    endcase
end

endmodule