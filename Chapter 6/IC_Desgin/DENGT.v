module traffic_light(
    input clk,          // Clock input
    input reset,        // Reset signal
    output reg [2:0] out1,  //  1: [Red, Yellow, Green]
    output reg [2:0] out2 //  2: [Red, Yellow, Green]
);

parameter S1 = 2'b00, S2 = 2'b01, S3 = 2'b10, S4 = 2'b11;
reg [1:0] state, next_state;
reg [4:0] timer;

parameter S1_TIME = 15, // Xanh 15s
          S2_TIME = 5,  // Vàng 5s
          S3_TIME = 15, // Xanh 15s
          S4_TIME = 5;  // Vàng 5s

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= S1;
        timer <= S1_TIME; 
    end
    else begin
        timer <= timer - 1;        
        if (timer == 0) begin
            case(state)
                S1: begin
                    next_state <= S2;
                    timer <= S2_TIME;
                end
                S2: begin
                    next_state <= S3;
                    timer <= S3_TIME;
                end
                S3: begin
                    next_state <= S4;
                    timer <= S4_TIME;
                end
                S4: begin
                    next_state <= S1;
                    timer <= S1_TIME;
                end
            endcase
            state <= next_state;
        end
    end
end

always @(state) begin
    case(state)
        S1: begin
            out1 = 3'b100;  
            out2 = 3'b001;
        end
        S2: begin
            out1 = 3'b010;  
            out2 = 3'b001;
        end
        S3: begin
            out1 = 3'b001;  
            out2 = 3'b100;
        end
        S4: begin
            out1 = 3'b001;  
            out2 = 3'b010;
        end
        default: begin
            out1 = 3'b001;  
            out2 = 3'b001;
        end
    endcase
end

endmodule
