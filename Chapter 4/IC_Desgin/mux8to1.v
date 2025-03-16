module mux8to1(
input wire [7:0] w, 
input wire [2:0] s, 
output reg y);

always @(w,s)
case(s)
0: y = w[0];
1: y = w[1];
2: y = w[2];
3: y = w[3];
4: y = w[4];
5: y = w[5];
6: y = w[6];
default: y = w[7];
endcase
endmodule
