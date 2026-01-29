module two_bit_adder_tb;
    //what is reg vs wire?
    //inputs
    wire [1:0] A;
    wire [1:0] B;
    wire Cin;

    //outputs
    wire [1:0] S;         
    wire Cout;

    //instantiate the 2-bit adder module
    twobit_adder adder(.S(S), .Cout(Cout), .A(A), .B(B), .Cin(Cin));

    integer i; //32 bit integer for forloop varoiable

    assign {Cin, A, B} = i[4:0];

    initial begin
        for (i = 0; i<32; i = i+1) begin
            #20;
            $display("A=%b, B=%b, Cin=%b => S=%b, Cout=%b", A, B, Cin, S, Cout);
        end

        $finish; //what does this do>
    end
endmodule
   
    // initial begin
    //     $dumpfile("2bit_adder_tb.vcd"); //output file name
    //     $dumpvars(0, two_bit_adder_tb); //module to capture what level, 0 means all wire
    // end