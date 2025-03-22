`timescale 1ns/1ns // define timescale
module dung_tb_FFD_SR_8bit();

reg in;
reg clk;
wire [7:0] out;


initial begin 
clk = 0; 
in = 0;
end

always #10 clk = ~clk;
always #20 in = in + 1;   

SR_8bit m0 (in,clk,out);

endmodule 

