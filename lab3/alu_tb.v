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

    initial begin
        $display($time, " << TESTING THE ARITHMETIC BLOCK >>");

        a = 16'h00;
        b = 16'h00;
        alu_code = 5'b00000;
        coe = 1'b0;
        cin = 1'b0;
        #10;
        
        $display($time, " A=%b | B=%b | COE=%b | ALU_code=%b | OUT=%b | COUT=%b | VOUT=%b", 
                          a,      b,     coe,     alu_code,    result,   cout,     vout);

        #10 b = 16'h01;
        #10;

        $display($time, " A=%b | B=%b | COE=%b | ALU_code=%b | OUT=%b | COUT=%b | VOUT=%b", 
                          a,      b,     coe,     alu_code,    result,   cout,     vout);
        
        // #10;
        #10 a = 16'h05; b = 16'h05;

        // wait(result == 16'h0A);
        #10;
        $display($time, " A=%b | B=%b | COE=%b | ALU_code=%b | OUT=%b | COUT=%b | VOUT=%b", 
                          a,      b,     coe,     alu_code,    result,   cout,     vout);
        

        $display($time, " << DONE >>");

        // $monitor($time, "A=%b | B=%b | COE=%b | ALU_code=%b | OUT=%b | COUT=%b | VOUT=%b", 
        //                  a,      b,     coe,     alu_code,    result,   cout,     vout);
        
    end

endmodule