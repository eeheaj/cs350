module onebit_ripple_adder(A,B,Cin,S,Cout); //module name cannot start with number
    input A,B,Cin;
    output S,Cout;
    wire w1,w2,w3;

    xor AxorB(w1,A,B); //why do we have to name the gate?
    xor w1xorCin(S,w1,Cin);

    and w1andCin(w2,w1,Cin);
    and AandB(w3,A,B);
    or w2orw3(Cout,w2,w3);

endmodule