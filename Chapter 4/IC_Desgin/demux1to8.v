module demux1to8(
input wire in,
input wire [2:0] sel,
output reg [7:0]out);

always @(in or sel)
	case (sel)
	0: out[0] = in;
	1: out[1] = in;
	2: out[2] = in;
	3: out[3] = in;
	4: out[4] = in;
	5: out[5] = in;
	6: out[6] = in;
	default: out[7] = in;
	endcase

endmodule
