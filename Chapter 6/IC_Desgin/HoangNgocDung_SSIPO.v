`timescale 1ns/1ns  
module HoangNgocDung_tb_SSIPO;

reg clk, s_in;
wire [7:0] out;     

initial begin
clk = 0;
s_in = 1;    
end

always forever #20 clk = ~clk;   // T?o xung ??ng h? v?i chu k? 40ns
always forever #20 s_in = ~s_in;
always forever #40 s_in = ~s_in;
always forever #80 s_in = ~s_in;
always forever #120 s_in = ~s_in;

ShiftSIPO uut(clk,s_in,out);

endmodule
