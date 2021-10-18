module alu_tb;

    // INPUTS TO ALU
    reg [15:0] a;
    reg [15:0] b;
    reg cin;
    reg [4:0] alu_code;
    wire [2:0] opcode = alu_code[2:0];
    reg coe;

    // OUTPUTS FROM ALU
    wire [15:0] result;
    wire cout;
    wire vout;

    //adder #(16) DUT_ADDER(result, cout, a, b, cin);
    arithmetic #(16) DUT_ARITHMETIC(result, cout, vout, opcode, a, b, cin, coe);

    // LOGIC DUT
    wire [15:0] logic_out;
    logic_operations #(16) DUT_LOGIC(logic_out, a, b, opcode);

    initial begin
        $display($time, " === TESTING ARITHMETIC BLOCK ===");

        a = 16'h00;
        b = 16'h00;
        alu_code = 5'b00000;
        coe = 1'b0;
        cin = 1'b0;
        #10;

        $display($time, " A=%b | B=%b | COE=%b | OUT=%b | COUT=%b | VOUT=%b", 
                          a,      b,     coe,    result,   cout,     vout);

        #5 b = 16'h01;
        #5;

        $display($time, " ");
        $display($time, " SIGNED ADDITION (ALU_code=%b)", alu_code);
        $display($time, " A=%b | B=%b | COE=%b | OUT=%b | COUT=%b | VOUT=%b", 
                          a,      b,     coe,    result,   cout,     vout);
        #5 a = 16'h05; b = 16'h05;
        #5;
        $display($time, " A=%b | B=%b | COE=%b | OUT=%b | COUT=%b | VOUT=%b", 
                          a,      b,     coe,    result,   cout,     vout);
        
        $display($time, " ");
        alu_code = 5'b00010;
        $display($time, " SIGNED SUBTRACTION (ALU_code=%b)", alu_code);

        #5 a = 16'h08; b = 16'h04; 
        #5;
        
        $display($time, " A=%b | B=%b | COE=%b | OUT=%b | COUT=%b | VOUT=%b", 
                          a,      b,     coe,    result,   cout,     vout);

        #5 a = 16'h0A; b = 16'h04;
        #5;
        $display($time, " A=%b | B=%b | COE=%b | OUT=%b | COUT=%b | VOUT=%b", 
                          a,      b,     coe,     result,   cout,     vout);


        $display($time, " ");
        $display($time, " ");
        $display($time, " === TESTING LOGIC BLOCK ===");

        $display($time, " ");
        alu_code = 5'b01000;
        $display($time, " AND (ALU_code=%b)", alu_code);
        #5 a = 16'b1111111100000000; b = 16'b1111000011110000;
        #5;
        $display($time, " %b & %b = %b", a, b, logic_out);

        $display($time, " ");
        alu_code = 5'b01001;
        $display($time, " OR (ALU_code=%b)", alu_code);
        #5 a = 16'b1111111100000000; b = 16'b1111000011110000;
        #5;
        $display($time, " %b | %b = %b", a, b, logic_out);


        $display($time, " ");
        alu_code = 5'b01010;
        $display($time, " XOR (ALU_code=%b)", alu_code);
        #5 a = 16'b1111111100000000; b = 16'b1111000011110000;
        #5;
        $display($time, " %b XOR %b = %b", a, b, logic_out);


        $display($time, " ");
        alu_code = 5'b01100;
        $display($time, " NOT (ALU_code=%b)", alu_code);
        #5 a = 16'b1111111100000000; b = 16'b1111000011110000;
        #5;
        $display($time, " ~%b = %b", a, logic_out);

        $display($time, " << DONE >>");

        // $monitor($time, "A=%b | B=%b | COE=%b | ALU_code=%b | OUT=%b | COUT=%b | VOUT=%b", 
        //                  a,      b,     coe,     alu_code,    result,   cout,     vout);
        
    end

endmodule