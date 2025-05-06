module door_lock(
    input clk,          // Clock input
    input reset,        // Reset signal
    input [3:0] key,    // Input for the 4 keys (1,2,3,4)
    output reg green_led,  // Green LED to show success
    output reg red_led,    // Red LED to show failure
    output reg [1:0] state // Current state
);

parameter PASSWORD = 4'b1324; // Correct password
parameter TIMEOUT = 10;  // Timeout in seconds

reg [3:0] password_input; // Stores user input
reg [3:0] input_count;    // Counter for input digits
reg [4:0] timer;          // Timeout counter

// States
parameter WAIT = 2'b00;
parameter CHECK = 2'b01;
parameter SUCCESS = 2'b10;
parameter FAILURE = 2'b11;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= WAIT;
        password_input <= 4'b0000;
        input_count <= 4'b0000;
        timer <= 5'b00000;
        green_led <= 0;
        red_led <= 0;
    end else begin
        case(state)
            WAIT: begin
                green_led <= 0;
                red_led <= 0;
                if (key != 4'b0000) begin
                    password_input[input_count] <= key;
                    input_count <= input_count + 1;
                    if (input_count == 4) begin
                        state <= CHECK;
                        input_count <= 0;
                    end
                end else if (timer == TIMEOUT) begin
                    state <= WAIT;
                    timer <= 0;
                end else begin
                    timer <= timer + 1;
                end
            end
            CHECK: begin
                if (password_input == PASSWORD) begin
                    green_led <= 1;
                    state <= SUCCESS;
                end else begin
                    red_led <= 1;
                    state <= FAILURE;
                end
            end
            SUCCESS: begin
                #300000000; // 3 seconds delay for green LED
                green_led <= 0;
                state <= WAIT;
            end
            FAILURE: begin
                #50000000; // Delay for red LED blinking
                red_led <= ~red_led;
                if (timer == 3) begin
                    red_led <= 0;
                    state <= WAIT;
                end
            end
        endcase
    end
end

endmodule
