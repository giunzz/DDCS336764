`timescale 1ns/1ns // define timescale

module HoangNgocDung_tb_up_down_FFT();

reg clk;
reg up;
wire [7:0] count;

initial begin
  clk = 0;
  up = 0; 
end


always forever #20 clk = ~clk;
always forever #50 up = 1;

up_down_counter_8bit counter (
  .clk(clk),
  .up(up),
  .count(count)
);

endmodule

