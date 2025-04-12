module seq4_detect_moore(x, clk, y);
input x, clk;
output y;
reg [2:0] state, nstate; // nstate = next state
parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4;

// State register
always@(posedge clk)
	state <= nstate;

// Next state Logic
always@(state or x)
	case(state)
	  S0:nstate = x? S1: S0;
	  S1:nstate = x? S2: S0;
	  S2:nstate = x? S3: S0;
	  S3:nstate = x? S4: S0;
	  S4:nstate = x? S4: S0;
	  default: nstate = S0; 
	endcase

// Output Logic 
      assign y = (state == S4);
endmodule

