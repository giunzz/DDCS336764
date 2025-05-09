module Door_System(
    input wire [3:0] btn,
    input wire clk, reset,
    output reg y,
    output reg green_led,  
    output reg red_led  
);

    reg [2:0] state, next_state; 
    reg [11:0] seq; 

    reg [3:0] timer; 
    reg [3:0] time_green, time_red; 

    parameter S0 = 0 , S1 = 1 , S2 = 2 , S3 = 3, S4 = 4, error = 5, success = 6;

    parameter TIME_OUT  = 10;  

    // reset 
    always @(posedge clk) begin
        if (reset) begin
            state <= S0;
            seq <= 12'b0;
            y <= 0;
            timer <= 0;  // Reset timer
            green_led <= 0;
            red_led <= 0;
        end else begin
            state <= next_state;
            if (timer > 0)  
                timer <= timer - 1;  
        end
    end

    // State change (FSM)
    always @(btn, state) begin
        case(state)
            S0: if (btn == 4'b0001) begin
                    seq[2:0] <= 3'b001;  
                    next_state = S1;
                    timer <= TIME_OUT;  
                end else next_state = S0;

            S1: if (btn == 4'b0101) begin
                    seq[5:3] <= 3'b011;  
                    next_state = S2;
                    timer <= TIME_OUT;  
                end else next_state = error;

            S2: if (btn == 4'b0111) begin 
                    seq[8:6] <= 3'b010;  
                    next_state = S3;
                    timer <= TIME_OUT;  
                end else next_state = error;

            S3: if (btn == 4'b1111) begin 
                    seq[11:9] <= 3'b100;  
                    next_state = success;
                    timer <= TIME_OUT;  
                end else next_state = error;

            error: begin
                next_state = S0;
                seq <= 12'b0;  
                timer <= 0;  // Reset timer
            end

            success: begin
                next_state = (timer == 0) ? S0 : success;  
                seq <= 12'b0;  
            end

            default: next_state = S0;
        endcase
    end

    // Output Logic
    always @(state) begin
        y = (state == success) ? 1 : 0;
        green_led = (state == success) ? 1 : 0;  
        red_led = (state == error) ? 1 : 0;  
    end

endmodule  
