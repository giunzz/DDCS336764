module mux4to1(
input wire [3:0] w, 
input wire [1:0] s, 
output reg y);

always @(w,s)
case(s)
0: y = w[0];
1: y = w[1];
2: y = w[2];
default: y = w[3];
endcase
endmodule
