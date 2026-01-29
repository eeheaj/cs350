/*
module modulename(out1, out2, in1,in2,cin);
    //stuffstuffstuff instructions
endmodule
*/

module full_adder(S, Cout, A, B, Cin); 
    //order and # of arguments doesn't matter since you are going to assign them
    input A,B,Cin;
    output S, Cout;
    wire w1, w2, w3;

    xor Sresult(S,A,B,Cin);
    
    //Cout = AB + BCin + ACin
    and A_and_B (w1,A,B);
    and B_and_Cin (w2,B,Cin);
    and A_and_Cin (w3,A,Cin);
    or Cout_result (Cout,w1,w2,w3);

endmodule