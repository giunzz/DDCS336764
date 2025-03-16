`timescale 1ns/1ns // define timescale
module dung_tb_mux8to1();

reg [7:0] w;
reg [2:0] s;
wire y;

// initialize w and s to 000 and 00, respectively
initial begin 
w = 0 ; 
s = 0;
end

// generate w0- w3
always forever #10 w[0] = ~w[0];
always forever #20 w[1] = ~w[1];
always forever #40 w[2] = ~w[2];
always forever #80 w[3] = ~w[3];
always forever #100 w[4] = ~w[4];
always forever #200 w[5] = ~w[5];
always forever #400 w[6] = ~w[6];
always forever #800 w[7] = ~w[7];

//generate 4 state of s by increasing s by 1
always forever #500 s = s + 1;
// conect w,s,y to moduke mux41
mux8to1 m0(w,s,y);

endmodule 