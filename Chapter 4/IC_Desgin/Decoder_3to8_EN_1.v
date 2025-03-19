module decoder3to8_en1(
input wire [2:0] in, 
input wire  en, 
output reg [7:0] out);

always @(in or en)
	if (en == 1) 
		out = (8'b00000001 << in);
	else 
            out = 8'b00000000;
endmodule
