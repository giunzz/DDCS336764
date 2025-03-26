module t_flip_flop (
  input t, clk,
  output reg q,qb
);
initial 
begin 
q = 0;
qb = 1;
end

always @(posedge clk)
    if (t) begin
      q = ~q;
      qb = !qb;
    end
endmodule

module up_down_counter_8bit (
  input clk, up,
  output [7:0] count
);
  wire t0, t1, t2, t3, t4, t5, t6, t7;
  wire q0, q1, q2, q3, q4, q5, q6, q7;  

  // T flip-flop logic for the counter
  assign t0 = 1;  
  assign t1 = (up) ? q0 : ~q0; 
  assign t2 = (up) ? (q0 & q1) : (~q0 & ~q1);  
  assign t3 = (up) ? (q0 & q1 & q2) : (~q0 & ~q1 & ~q2);  
  assign t4 = (up) ? (q3 & q2 & q1 & q0) : (~q0 & ~q1 & ~q2 & ~q3);  
  assign t5 = (up) ? (q4 & q3 & q2 & q1 & q0) : (~q0 & ~q1 & ~q2 & ~q3 & ~q4);   
  assign t6 = (up) ? (q5& q4 & q3 & q2 & q1 & q0) : (~q0 & ~q1 & ~q2 & ~q3 & ~q4 & ~q5);
  assign t7 = (up) ? (q6 & q5& q4 & q3 & q2 & q1 & q0) : (~q0 & ~q1 & ~q2 & ~q3 & ~q4 & ~q5 & ~q6);

  t_flip_flop ff0  (t0, clk, q0);
  t_flip_flop ff1  (t1, clk, q1);
  t_flip_flop ff2  (t2, clk, q2);
  t_flip_flop ff3  (t3, clk, q3); 
  t_flip_flop ff4  (t4, clk, q4);
  t_flip_flop ff5  (t5, clk, q5);
  t_flip_flop ff6  (t6, clk, q6);
  t_flip_flop ff7  (t7, clk, q7);

  assign count = {q7, q6, q5, q4, q3, q2, q1, q0};
endmodule

