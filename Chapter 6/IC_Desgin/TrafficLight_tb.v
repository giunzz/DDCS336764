`timescale 1ns/1ns 
module tb_trafficlight;
reg clk, reset;
wire [2:0] out1,out2;  

initial begin 
clk = 0;
reset = 1;
#10 reset = 0;
end

always forever #20 clk = ~clk; 
traffic_light uut(clk, reset, out1, out2 );

endmodule 
