module Door_System(
input wire [3:0] btn,
input wire clk, reset,
output reg y,
output reg green_led,  
output reg red_led  
);

reg [2:0] state, next_state; 
reg [11:0] seq; // input seq 

reg [3:0] timer; // 10 time count 
reg [3:0] led_timer; // 3s 

parameter S0 = 0 , S1 = 1 , S2 = 2 , S3 = 3, S4 = 4, error = 5;

parameter TIME_OUT  = 10, led_on = 3, led_blink = 1;

// reset 
always @(posedge reset)
if (reset) 
begin 
	state <= S0;
	seq <= 0; 
	y <= 0;
	timer <= 0;
	green_led <= 0;
	red_led <= 0;
	led_timer <= 0;
end

// time count
always @(posedge clk)
if (timer == TIME_OUT) 
begin 
	state <= S0;
	seq <= 0; 
	y <= 0;
	timer = 0;
	green_led <= 0;
    red_led <= 0;
end
else if (btn != 0) 
	timer <= 0;
else 
	timer <= timer + 1;

    
// change state
always @(posedge clk) 
case(state)
S0: if (btn[0] == 1) 
begin 
	seq[2:0] = 1;
	next_state <= S1;
end else 
	next_state <= S0;
S1: if (btn[2] == 1)
begin 
	seq[5:3] = 3;
	next_state <= S2;
end
else if (btn[1] || btn[3] || btn[0])  
	next_state <= error;
S2: if (btn[1] == 1) 
begin 
	seq[8:6] = 2;
	next_state <= S3;
end
else if (btn[2] || btn[3] || btn[0])  
	next_state <= error;
S3: if (btn[3] == 1) 
begin 
	seq[11:9] = 4;
	next_state <= S3; 
end
else if (btn[1] || btn[2] || btn[0])  
	next_state <= error;
error: next_state  <= S0;

default: next_state  <= S0; 

endcase


always @(posedge clk) 
    state <= next_state;

// output

always @(state) begin
if (state == S3) begin // correct pass -> green light
	y = 1;                             
	green_led = 1;         
        led_timer <= 0;        
end else begin
	y = 0;
	green_led = 0;
	led_timer <= 0; 
end

if (green_led == 1) begin
    if (led_timer < led_on) 
                led_timer <= led_timer + 1;   
    else begin
                green_led = 0;  
                led_timer <= 0;  
            end
end
if (state == error) begin
            if (led_timer < led_blink) begin
                red_led = (led_timer % 2 == 0) ? 1 : 0;  
                led_timer <= led_timer + 1;   
            end else begin
                red_led = 0;      
                led_timer <= 0;    
            end
        end else begin
            red_led = 0;
            led_timer <= 0;      
        end
    end
endmodule