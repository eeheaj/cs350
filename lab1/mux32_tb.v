module mux32_tb;
    //what is reg vs wire?
        //reg is for the value that is not bound for other variable
        //if im setting a value in the initial begin then i need to use reg; always (toggle)
        //assign statement i need to use wire
    //inputs
    reg [31:0] in0, in1, in2, in3, in4, in5, in6, in7,
               in8, in9, in10, in11, in12, in13, in14, in15,
               in16, in17, in18, in19, in20, in21, in22, in23,
               in24, in25, in26, in27, in28, in29, in30, in31;
    wire [4:0] select;

    //outputs
    wire [31:0] out; //for wire it is default for 1 bit.

   
    //instantiate the 2-bit adder module
    mux32 select1(out, select, in0, in1, in2, in3, in4, in5, in6, in7,
                  in8, in9, in10, in11, in12, in13, in14, in15,
                  in16, in17, in18, in19, in20, in21, in22, in23,
                  in24, in25, in26, in27, in28, in29, in30, in31);

    integer i; //32 bit integer for forloop varoiable

    assign select = i[4:0]; //5 bit needed to select 32 inputs

    initial begin
        in0 = 0;
        in1 = 1;
        in2 = 2;
        in3 = 3;
        in4 = 4;
        in5 = 5;
        in6 = 6;
        in7 = 7;
        in8 = 8;
        in9 = 9;
        in10 = 10;
        in11 = 11;
        in12 = 12;
        in13 = 13;
        in14 = 14;
        in15 = 15;
        in16 = 16;
        in17 = 17;
        in18 = 18;
        in19 = 19;
        in20 = 20;
        in21 = 21;
        in22 = 22;
        in23 = 23;
        in24 = 24;
        in25 = 25;
        in26 = 26;
        in27 = 27;
        in28 = 28;
        in29 = 29;
        in30 = 30;
        in31 = 31;

        for (i = 0; i<32; i = i+1) begin
            #20;//20 ns
            $display("Select Bit=%d => out=%d",select, out);
            
        end

        $finish; //what does this do; end of the test ebench
    end
endmodule