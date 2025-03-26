`timescale 1ns/1ns // define timescale
module HoangNgocDung_tb_FFD_SR_8bit();

reg in;
reg clk;
wire [7:0] out;


initial begin 
clk = 0; 
in = 0;
end

always #10 clk = ~clk;
always #10 in = 1;   

SR_8bit m0 (in,clk,out);

endmodule 

