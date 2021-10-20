`timescale 1ns/100ps

module alu_tb;
    
    // INPUTS TO ALU
    reg signed [15:0] a;
    reg signed [15:0] b;
    reg cin;
    reg [4:0] alu_code;
    reg coe;

    // OUTPUTS FROM ALU
    wire cout;
    wire vout;
    wire [15:0] result;

    alu ALU_DUT(result, cout, vout, a, b, cin, coe, alu_code);

    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, alu_tb);

        $display($time, " === TESTING ARITHMETIC BLOCK ===");

        a = 16'h00;
        b = 16'h00;
        alu_code = 5'b00000;
        coe = 1'b0;
        cin = 1'b0;
        #10;

        $display($time, " A=%h | B=%h | COE=%b | OUT=%h | COUT=%b | VOUT=%b", 
                          a,      b,     coe,    result,   cout,     vout);

        b = 16'h01; alu_code = 5'b00000;
        #10;

        $display($time, " ");
        $display($time, " SIGNED ADDITION (ALU_code=%b)", alu_code);
        $display($time, " A=%h | B=%h | COE=%b | OUT=%h | COUT=%b | VOUT=%b", 
                          a,      b,     coe,    result,   cout,     vout);
        a = 16'h05; b = 16'h05;
        #10;
        $display($time, " A=%h | B=%h | COE=%b | OUT=%h | COUT=%b | VOUT=%b", 
                          a,      b,     coe,    result,   cout,     vout);
        
        a = 16'b1111111111111111; b = 16'b1111111111111111; cin = 1;
        #10;
        $display($time, " A=%h | B=%h | COE=%b | OUT=%h | COUT=%b | VOUT=%b", 
                          a,      b,     coe,    result,   cout,     vout);

        cin = 0; b = 16'h01; a = 16'h01; alu_code = 5'b00001;
        #10;
        $display($time, " ");
        $display($time, " UNSIGNED ADDITION (ALU_code=%b)", alu_code);
        $display($time, " A=%h | B=%h | COE=%b | OUT=%h | COUT=%b | VOUT=%b", 
                          a,      b,     coe,    result,   cout,     vout);

        a = 16'h55; b = 16'hA5A5; 
        #10;
        $display($time, " A=%h | B=%h | COE=%b | OUT=%h | COUT=%b | VOUT=%b", 
                          a,      b,     coe,    result,   cout,     vout);

        $display($time, " ");
        #10 alu_code = 5'b00010;
        $display($time, " SIGNED SUBTRACTION (ALU_code=%b)", alu_code);

        a = 16'h08; b = 16'h04; 
        #10;
        
        $display($time, " A=%h | B=%h | COE=%b | OUT=%h | COUT=%b | VOUT=%b", 
                          a,      b,     coe,    result,   cout,     vout);

        a = 16'h0A; b = 16'h04;
        #10;
        $display($time, " A=%h | B=%h | COE=%b | OUT=%h | COUT=%b | VOUT=%b", 
                          a,      b,     coe,    result,   cout,     vout);

        $display($time, " ");
        #10 alu_code = 5'b00011;
        $display($time, " UNSIGNED SUBTRACTION (ALU_code=%b)", alu_code);

        a = 16'hFFFF; b = 16'hA5A5; 
        #10;
        
        $display($time, " A=%h | B=%h | COE=%b | OUT=%h | COUT=%b | VOUT=%b", 
                          a,      b,     coe,    result,   cout,     vout);

        a = 16'h0A; b = 16'h04;
        #10;
        $display($time, " A=%h | B=%h | COE=%b | OUT=%h | COUT=%b | VOUT=%b", 
                          a,      b,     coe,    result,   cout,     vout);

        $display($time, " ");
        #10 alu_code = 5'b00100;
        $display($time, " INCREMENT (ALU_code=%b)", alu_code);

        a = 16'h0001; b = 16'h0000; 
        #10;
        
        $display($time, " A=%h | B=%h | COE=%b | OUT=%h | COUT=%b | VOUT=%b", 
                          a,      b,     coe,    result,   cout,     vout);

        a = 16'h000F; b = 16'h0000;
        #10;
        $display($time, " A=%h | B=%h | COE=%b | OUT=%h | COUT=%b | VOUT=%b", 
                          a,      b,     coe,    result,   cout,     vout);
        
        $display($time, " ");
        #10 alu_code = 5'b00101;
        $display($time, " DECREMENT (ALU_code=%b)", alu_code);

        a = 16'h0002; b = 16'h0000; 
        #10;
        
        $display($time, " A=%h | B=%h | COE=%b | OUT=%h | COUT=%b | VOUT=%b", 
                          a,      b,     coe,    result,   cout,     vout);

        a = 16'h0010; b = 16'h0000;
        #10;
        $display($time, " A=%h | B=%h | COE=%b | OUT=%h | COUT=%b | VOUT=%b", 
                          a,      b,     coe,    result,   cout,     vout);


        $display($time, " ");
        $display($time, " ");
        $display($time, " === TESTING LOGIC BLOCK ===");

        alu_code = 5'b01000;
        #10;
        $display($time, " ");
        $display($time, " AND (ALU_code=%b)", alu_code);
        a = 16'b1111111100000000; b = 16'b1111000011110000;
        #10;
        $display($time, " %b & %b = %b", a, b, result);

        alu_code = 5'b01001;
        #10;
        $display($time, " ");
        $display($time, " OR (ALU_code=%b)", alu_code);
        #5 a = 16'b1111111100000000; b = 16'b1111000011110000;
        #5;
        $display($time, " %b | %b = %b", a, b, result);


        alu_code = 5'b01010;
        #10;
        $display($time, " ");
        $display($time, " XOR (ALU_code=%b)", alu_code);
        a = 16'b1111111100000000; b = 16'b1111000011110000;
        #10;
        $display($time, " %b XOR %b = %b", a, b, result);


        alu_code = 5'b01100;
        #10;
        $display($time, " ");
        $display($time, " NOT (ALU_code=%b)", alu_code);
        a = 16'b1111111100000000; b = 16'b1111000011110000;
        #10;
        $display($time, " ~%b = %b", a, result);


        $display($time, " ");
        $display($time, " ");
        $display($time, " === TESTING SHIFTER BLOCK ===");

        alu_code = 5'b10000;
        #10;
        $display($time, " ");
        $display($time, " LOGIC LEFT SHIFT (ALU_code=%b)", alu_code);
        a = 16'b0000000001010101; b = 16'b0000000000001000;
        #10;
        $display($time, " %b << %d = %b", a, b, result);


        alu_code = 5'b10001;
        #10;
        $display($time, " ");
        $display($time, " LOGIC RIGHT SHIFT (ALU_code=%b)", alu_code);
        a = 16'b1010101000000000; b = 16'b0000000000001000;
        #10;
        $display($time, " %b >>> %d = %b", a, b, result);

        alu_code = 5'b10010;
        #10;
        $display($time, " ");
        $display($time, " ARITHMETIC LEFT SHIFT (ALU_code=%b)", alu_code);
        a = 16'b0000000001010101; b = 16'b0000000000001000;
        #10;
        $display($time, " %b << %d = %b", a, b, result);

        alu_code = 5'b10011;
        #10;
        $display($time, " ");
        $display($time, " ARITHMETIC RIGHT SHIFT (ALU_code=%b)", alu_code);
        a = 16'b1010101000000000; b = 16'b0000000000001000;
        #10;
        $display($time, " %b >> %d = %b", a, b, result);




        $display($time, " ");
        $display($time, " ");
        $display($time, " === TESTING CONIDTIONAL BLOCK ===");
        alu_code = 5'b11000;
        $display($time, " ");
        $display($time, " ALU_CODE |  A  |  B  |  RESULT");
        a = 16'h01; b = 16'h02; #5;
        $display($time, " %8b | %3d | %3d | %3d", alu_code, a, b, result);
        a = 16'h01; b = 16'h00; #5;
        $display($time, " %8b | %3d | %3d | %3d", alu_code, a, b, result);
        alu_code = 5'b11001;
        a = 16'h02; b = 16'h01; #5;
        $display($time, " %8b | %3d | %3d | %3d", alu_code, a, b, result);
        a = -1; b = 16'h01; #5;
        $display($time, " %8b | %3d | %3d | %3d", alu_code, a, b, result);
        alu_code = 5'b11010;
        a = 16'h01; b = 16'h01; #5;
        $display($time, " %8b | %3d | %3d | %3d", alu_code, a, b, result);
        a = -1; b = 16'h01; #5;
        $display($time, " %8b | %3d | %3d | %3d", alu_code, a, b, result);
        alu_code = 5'b11011;
        a = 16'h02; b = 16'h01; #5;
        $display($time, " %8b | %3d | %3d | %3d", alu_code, a, b, result);
        a = -1; b = 16'h01; #5;
        $display($time, " %8b | %3d | %3d | %3d", alu_code, a, b, result);
        alu_code = 5'b11100;
        a = 16'h01; b = 16'h01; #5;
        $display($time, " %8b | %3d | %3d | %3d", alu_code, a, b, result);
        a = -1; b = 16'h01; #5;
        $display($time, " %8b | %3d | %3d | %3d", alu_code, a, b, result);
        alu_code = 5'b11101;
        a = 16'h01; b = 16'h01; #5;
        $display($time, " %8b | %3d | %3d | %3d", alu_code, a, b, result);
        a = -1; b = 16'h01; #5;
        $display($time, " %8b | %3d | %3d | %3d", alu_code, a, b, result);

        $display($time, " << DONE >>");

        // $monitor($time, "A=%b | B=%b | COE=%b | ALU_code=%b | OUT=%b | COUT=%b | VOUT=%b", 
        //                  a,      b,     coe,     alu_code,    result,   cout,     vout);
        
    end

endmodule