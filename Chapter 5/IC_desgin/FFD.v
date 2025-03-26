module FF_D(input wire d,clk, output reg q);
always @(posedge clk) // positive edge 
begin
q <= d; // Non-Blocking Assignment
end
endmodule
		