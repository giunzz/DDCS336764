module Counter
#(parameter N = 8)
( input wire clk, reset,
output wire [N-1:0] q );

// signal declaration
reg [N-1:0] r_reg;
wire [N-1:0] r_next;
// body, register
always @(posedge clk, posedge reset)
if (reset)

r_reg <= 0;

else

r_reg<=r_next; // <= is non-blocking statement

// next state logic
assign r_next = r_reg + 1;
// output logic
assign q=r_reg;

endmodule
