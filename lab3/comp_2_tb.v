module comp_2_tb;
    //what is reg vs wire?
    //inputs
    wire [1:0] A;
    wire [1:0] B;
    wire prevEQ, prevGT;

    //outputs
    wire EQ,GT;         

    //instantiate the 2-bit adder module
    comp_2 comparator(prevEQ, prevGT, A, B, EQ, GT);

    integer i,j; 

    assign {A, B} = i[3:0];
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
                    for (i = 0; i<16; i = i+1) begin
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
endmodule
