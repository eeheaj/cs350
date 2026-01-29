module comp_2 (prevEQ, prevGT, A, B, EQ, GT);
    input prevEQ, prevGT;
    input [1:0] A,B;
    output EQ,GT;
    
    /* 
    //combinatorial logic implementation
    wire A0_B0, A1_B1;
    wire gt1,gt0;

    xnor bit0_equal (A0_B0, A[0], B[0]);
    xnor bit1_equal (A1_B1, A[1], B[1]);
    and (EQ,prevEQ, A0_B0, A1_B1); //3 input AND gate (output, input1, input2, input3)
    */

    //mux implementation
    wire [2:0] select;
    assign select[2:1] = A;
    assign select[0] = B[1];

    wire mux_eq_out, mux_gt_out;

    mux_8 #(1) eq_mux(mux_eq_out,select,~B[0],1'b0,B[0],1'b0,1'b0,~B[0],1'b0,B[0]);
    mux_8 #(1) gt_mux(mux_gt_out,select,1'b0,1'b0,~B[0],1'b0,1'b1,1'b0,1'b1,~B[0]);

    and (EQ, prevEQ, ~prevGT, mux_eq_out);
    wire w1, w2;
    and (w1, prevGT, ~prevEQ);
    and (w2, prevEQ, ~prevGT, mux_gt_out);
    or (GT, w1, w2);

endmodule

module comp_4 (EQ1, GT1, A, B, EQ0, GT0);
    input EQ1, GT1;
    input [3:0] A,B;
    output EQ0, GT0;

    wire midEQ, midGT;
    comp_2 higher_bits (EQ1, GT1, A[3:2], B[3:2], midEQ, midGT);
    comp_2 lower_bits (midEQ, midGT, A[1:0], B[1:0], EQ0, GT0);

endmodule

module comp_8 (EQ1, GT1, A, B, EQ0, GT0);
    input EQ1, GT1;
    input [7:0] A,B;
    output EQ0, GT0;

    wire midEQ, midGT;
    comp_4 higher_bits (EQ1, GT1, A[7:4], B[7:4], midEQ, midGT);
    comp_4 lower_bits (midEQ, midGT, A[3:0], B[3:0], EQ0, GT0);

endmodule