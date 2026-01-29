/*
module mux_2 #(parameter INPUT_WIRES = 32, OUTPUT_WIRES = 32) (out,select, in0, in1);
    input select;
    input [31:0] in0, in1;
    output [31:0] out;
    assign out = select ? in1: in0
endmodule
*/

module mux_2 #(parameter WIDTH = 32) (out,select, in0, in1);
    input select;
    input [WIDTH-1:0] in0, in1;
    output [WIDTH-1:0] out;
    assign out = select ? in1: in0;
endmodule
