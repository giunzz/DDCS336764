`timescale 1ns/1ns // define timescale
module dung_tb_decoder3to8_en0();

reg [2:0] in;
reg en;
wire [7:0] out;

// initialize w and s to 000 and 00, respectively
initial begin 
en = 1; 
in = 0;
end

always forever #10 in[0] = ~in[0];
always forever #20 in[1] = ~in[1];
always forever #40 in[2] = ~in[2];
always forever #50 en = 0;

decoder3to8_en0 m3(in,en,out);

endmodule 
