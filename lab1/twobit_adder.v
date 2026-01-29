module twobit_adder(A,B,Cin,S,Cout);
    input Cin;
    input [1:0] A, B;
    output Cout;
    output [1:0] S;
    wire C0out;

    full_adder FA0 (.A(A[0]), .B(B[0]), .Cin(Cin), .S(S[0]), .Cout(C0out));
    full_adder FA1 (.A(A[1]), .B(B[1]), .Cin(C0out), .S(S[1]), .Cout(Cout));

endmodule
