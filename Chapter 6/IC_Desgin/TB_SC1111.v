`timescale 1ns/1ns 
module tb_SC1111;
reg w, clk;
wire  y;

initial begin 
clk = 0;
w = 1;
end
always forever #20 clk = ~clk; 
//always forever #40 w = ~w;
always forever #220 w = ~w;
seq4_detect_moore  uut(w,clk, y );

endmodule 
