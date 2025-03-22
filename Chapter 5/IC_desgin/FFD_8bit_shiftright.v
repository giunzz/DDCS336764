module FF_D(input wire d, clk, output reg q);
  always @(posedge clk)
    q <= d;  
endmodule

module SR_8bit(input wire in, clk, output wire[7:0] out);
  wire q1, q2, q3, q4, q5, q6, q7, q8;

  FF_D F0 (in, clk, out[0]);
  FF_D F1 (out[0], clk, out[1]);
  FF_D F2 (out[1], clk, out[2]);
  FF_D F3 (out[2], clk, out[3]);
  FF_D F4 (out[3], clk, out[4]);
  FF_D F5 (out[4], clk, out[5]);
  FF_D F6 (out[5], clk, out[6]);
  FF_D F7 (out[6], clk, out[7]);

endmodule

