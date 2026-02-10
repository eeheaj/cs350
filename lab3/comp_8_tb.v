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

    assign {A, B} = i[15:0];
    assign {prevEQ, prevGT} = j[1:0];

    initial begin
        for (j = 0; j<4; j = j+1) begin
            case (j)
                2'b00: begin
                    #20;
                    $display("prevEQ=%b, prevGT=%b, A=%b, B=%b => EQ=%b, GT=%b", prevEQ, prevGT, A, B, EQ, GT);
                end
                2'b01: begin
                    #20;
                    $display("prevEQ=%b, prevGT=%b, A=%b, B=%b => EQ=%b, GT=%b", prevEQ, prevGT, A, B, EQ, GT);
                end
                2'b10: begin
                    for (i = 0; i<65536; i = i+1) begin
                        #20;
                        $display("prevEQ=%b, prevGT=%b, A=%b, B=%b => EQ=%b, GT=%b", prevEQ, prevGT, A, B, EQ, GT);
                    end
                end
                2'b11: begin
                    #20;
                    $display("prevEQ=%b, prevGT=%b, A=%b, B=%b => EQ=%b, GT=%b", prevEQ, prevGT, A, B, EQ, GT);
                end
            endcase
        end

        $finish; //what does this do>
    end

    initial begin
        $dumpfile("comp_8_tb.vcd"); //output file name
        $dumpvars(0, comp_8_tb); 
    end
endmodule
