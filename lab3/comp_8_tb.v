module comp_8_tb;
    //what is reg vs wire?
    //inputs
    wire [7:0] A;
    wire [7:0] B;
    wire prevEQ, prevGT;

    //outputs
    wire EQ,GT;         

    //instantiate the 2-bit adder module
    comp_8 comparator(prevEQ, prevGT, A, B, EQ, GT);

    integer i,j; 

    assign {A, B} = i[7:0];
    assign {prevEQ, prevGT} = j[1:0];

    initial begin
        for (j = 0; j<4; j = j+1) begin
            for (i = 0; i<256; i = i+1) begin
                #20;
                $display("prevEQ=%b, prevGT=%b, A=%b, B=%b => EQ=%b, GT=%b", prevEQ, prevGT, A, B, EQ, GT);
            end
        end

        $finish; //what does this do>
    end

    initial begin
        $dumpfile("comp_8_tb.vcd"); //output file name
        $dumpvars(0, comp_8_tb); 
    end
endmodule
