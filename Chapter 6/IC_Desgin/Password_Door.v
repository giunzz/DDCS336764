module Door_System (
    input wire [3:0] btn, // btn[0]=1, btn[1]=2, btn[2]=3, btn[3]=4
    input wire clk,
    input wire reset,
    output reg y,
    output reg green_led,
    output reg red_led
);

parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S_ERROR = 5;
parameter TIME_OUT_VALUE = 10;
parameter GREEN_ON_TIME = 3;      
parameter RED_BLINK_TIME = 6;  

reg [3:0] state, next_state;
reg [3:0] timeout_timer;
reg [2:0] green_timer; 
reg [2:0] red_blink_timer; 

// Control Signals (Initiate timers or transitions)
reg start_green, start_red, reset_timeout_timer;

// next state (FSM)
always @* begin

next_state = state;
start_green = 1'b0;
start_red = 1'b0;
reset_timeout_timer = 1'b0;

if (btn) reset_timeout_timer = 1'b1;

case (state)
            S0: begin 
                if (timeout_timer >= TIME_OUT_VALUE) begin
                    next_state = S0; 
                end else if (btn[0])
                    next_state = S1;
                end else if (btn & ~btn[0]) begin 
                    next_state = S_ERROR;
                    start_red = 1'b1;
                end
            end

            S1: begin // Waiting for button 3 (btn[2]) after 1
                 if (timeout_timer >= TIME_OUT_VALUE) begin
                    next_state = S0; // Timeout returns to S0
                end else if (btn[2]) begin // Button 3 pressed
                    next_state = S2;
                end else if (|btn & ~btn[2]) begin // Any other button pressed
                    next_state = S_ERROR;
                    start_red = 1'b1;
                end
            end

            S2: begin // Waiting for button 2 (btn[1]) after 1, 3
                 if (timeout_timer >= TIME_OUT_VALUE) begin
                    next_state = S0; // Timeout returns to S0
                end else if (btn[1]) begin // Button 2 pressed
                    next_state = S3;
                end else if (|btn & ~btn[1]) begin // Any other button pressed
                    next_state = S_ERROR;
                    start_red = 1'b1;
                end
            end

            S3: begin // Waiting for button 4 (btn[3]) after 1, 3, 2
                 if (timeout_timer >= TIME_OUT_VALUE) begin
                    next_state = S0; // Timeout returns to S0
                end else if (btn[3]) begin // Button 4 pressed - Success!
                    next_state = S_SUCCESS;
                    start_green = 1'b1;
                end else if (|btn & ~btn[3]) begin // Any other button pressed
                    next_state = S_ERROR;
                    start_red = 1'b1;
                end
            end

            S_SUCCESS: begin // Door Open, Green LED on for 3 seconds
                if (green_timer == 1) begin // When timer is about to reach 0
                    next_state = S0; // Return to Idle
                end else begin
                    next_state = S_SUCCESS; // Stay in success state
                end
            end

            S_ERROR: begin // Red LED blinking for 3 times/duration
                 if (red_blink_timer == 1) begin // When timer is about to reach 0
                    next_state = S0; // Return to Idle
                end else begin
                    next_state = S_ERROR; // Stay in error state
                end
            end

            default: begin
                next_state = S0; // Should not happen, but default to S0
            end
        endcase
    end

    // Sequential Logic (State updates, Timers, Output Registers)
    always @(posedge clk) begin
        if (reset) begin
            state <= S0;
            timeout_timer <= 4'd0;
            green_timer <= 3'd0;
            red_blink_timer <= 3'd0;
            y <= 1'b0;
            green_led <= 1'b0;
            red_led <= 1'b0;
        end else begin
            // Update State Register
            state <= next_state;

            // Update Timeout Timer
            if (reset_timeout_timer) begin
                timeout_timer <= 4'd0; // Reset timer on any button press
            end else begin
                 if (timeout_timer < TIME_OUT_VALUE) // Prevent overflow
                    timeout_timer <= timeout_timer + 1;
            end

            // Update Green Timer
            if (start_green) begin
                green_timer <= GREEN_ON_TIME; // Start timer
            end else if (green_timer > 0) begin
                green_timer <= green_timer - 1; // Decrement timer
            end

            // Update Red Blink Timer
            if (start_red) begin
                red_blink_timer <= RED_BLINK_TIME; // Start timer
            end else if (red_blink_timer > 0) begin
                red_blink_timer <= red_blink_timer - 1; // Decrement timer
            end

            // Update Outputs
            // Door open (y) and Green LED are active during S_SUCCESS while timer runs
            y <= (state == S_SUCCESS);
            green_led <= (state == S_SUCCESS); // LED is simply on while in this state

            // Red LED blinks during S_ERROR while timer runs
            // A simple blink pattern: toggle red_led based on a timer bit
            // If red_blink_timer is 6, counts down 6,5,4,3,2,1. LSB is 0,1,0,1,0,1.
            // This gives 3 pulses.
            if (state == S_ERROR) begin
                red_led <= red_blink_timer[0]; // Blink based on the LSB of the timer
            end else begin
                red_led <= 1'b0; // Turn off red LED otherwise
            end

        end // else (reset)
    end // always @(posedge clk)

endmodule