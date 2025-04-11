`timescale 1ns/1ns 
module dung_tb_SC8bit;

wire [7:0] out;
reg in, clk, reset;

initial begin 
in = 0;
clk = 0;
reset = 0;
end

always forever #10 clk = ~clk; 
always forever #500 reset = ~reset;

Counter m0(clk, reset, out );

endmodule 
