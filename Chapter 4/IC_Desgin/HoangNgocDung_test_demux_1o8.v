`timescale 1ns/1ns // define timescale
module dung_tb_demux1to8();

reg in;
reg [2:0] sel;
wire [7:0] out;

// initialize w and s to 000 and 00, respectively
initial begin 
in = 1; 
sel = 0;
end

// generate s0- w2
always forever #10 sel[0] = ~sel[0];
always forever #20 sel[1] = ~sel[1];
always forever #40 sel[2] = ~sel[2];
always forever #80 in = in + 1;

// conect w,s,y to module demux8to1
demux1to8 m1(in,sel,out);

endmodule 
