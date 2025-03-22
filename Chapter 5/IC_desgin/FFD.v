module FF_D(input wire d,clk, output reg q);
always @(posedge clk)
	if (d) begin
		q=1;
	end
	else
	begin
		q=0;
	end
endmodule
		