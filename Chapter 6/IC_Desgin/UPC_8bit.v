module CounterUD ( input wire clk,reset,ud,
output wire [7:0] q );
// signal declaration
reg [7:0] r_reg;
wire [7:0] r_next;
// body, register
always @(posedge clk, posedge reset)
if (reset)
r_reg<=0;
else
r_reg<=r_next;
// next state logic
assign r_next = (ud==1)?r_reg + 1:r_reg - 1;
// output logic
assign q=r_reg;

endmodule