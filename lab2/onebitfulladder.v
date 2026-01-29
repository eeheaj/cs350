module onebitfulladder(A,B,Cin,S,Cout); //module name cannot start with number
    input A,B,Cin; //organge out is cin
    output S,Cout;
    wire w1,w2,w3,w4,w5,w6,w7;

    nand n1(w1,A,B);  //red w1
    nand n2(w2,A,w1); //black w2    
    nand n3(w3,B,w1); //w3:26
    nand n4(w4,w2,w3);                                                     
    nand n5(w5,Cin,w4); 
    nand n6(w6,w5,w4); //w4 is blue, black pointing out is w6
    nand n7(w7,Cin,w5); //w7 green pointing out
    nand n8(Cout,w5,w1);
    nand n9(S,w6,w7); //on line 50

endmodule