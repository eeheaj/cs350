`timescale 1 ns / 100 ps

module full_adder_tb;
    //inputs to module (reg)
    reg A;
    reg B;
    reg Cin;

    //outputs to module (wire)
    wire S;         
    wire Cout;

    //instantiate the full adder module
    full_adder adder(.S(S), .Cout(Cout), .A(A), .B(B), .Cin(Cin));
    // for the dot notation it is indicating .S in the fulladder module, 

    //testbench
    initial begin
        A =0; B=0; Cin=0;
        #80; //wait 80 time units
        $finish;
    end

    always 
        #10 A = ~A; //~ toggles the value
    always 
        #20 B = ~B;
    always 
        #40 Cin = ~Cin;

    always @(A,B,Cin) begin
        #1
        $display("A=%b, B=%b, Cin=%b => S=%b, Cout=%b", A, B, Cin, S, Cout);
    end

    initial begin
        $dumpfile("full_adder_tb.vcd"); //output file name
        $dumpvars(0, full_adder_tb); //module to capture what level, 0 means all wire
    end
    
endmodule