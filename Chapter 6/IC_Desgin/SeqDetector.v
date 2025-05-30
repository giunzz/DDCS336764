module seq4_detect_moore(x, clk, y);
  input x, clk;
  output reg y;
  reg [2:0] state, nstate; // nstate = next state
  
  // Define states
  parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011;

  // State register (flip-flop)
  always @(posedge clk) begin
    state <= nstate;
  end

  // Next state logic (state transitions)
  always @(state or x) begin
    case(state)
      S0: nstate = (x) ? S1 : S0;  // Looking for '1'
      S1: nstate = (x) ? S1 : S2;  // Looking for '10'
      S2: nstate = (x) ? S0 : S3;  // Looking for '100'
      S3: nstate = (x) ? S1 : S0;  // Looking for '1001'
      default: nstate = S0;  // Default case (reset to S0)
    endcase
  end

  // Output logic (Only assert y when the sequence 1001 is detected)
  always @(state) begin
    if(state == S3)
      y = 1;
    else
      y = 0;
  end
endmodule

