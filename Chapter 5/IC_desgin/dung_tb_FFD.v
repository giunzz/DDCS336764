`timescale 1ns/1ns // define timescale
module dung_tb_FFD();

reg D;
reg clk;
wire q;

// initialize w and s to 000 and 00, respectively
initial begin 
clk = 1; 
D = 0;
//q  = 3'b101;
end

always forever #10 clk = ~clk;
always forever #20 D = ~D;
always forever #40 D = ~D;

FF_D m0(D,clk,q);

endmodule 

