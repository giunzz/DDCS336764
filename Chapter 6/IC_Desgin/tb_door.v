module HoangNgocDung_tb_DoorSystem();

reg clk, reset;
reg [3:0] btn;
wire y, green, red;
    
initial begin
     btn = 1;
        reset = 0;
	clk = 0;
        // Apply reset
        #10 reset = 1;
        #10 reset = 0;

        // Test Case 1: Correct password (1, 3, 2, 4)
        #10 btn = 3;
        #20 btn = 2;
        #10 btn = 4;
       

        // Test Case 2: Incorrect password
        #20 btn  = 1;
        #10 btn = 2;
        #20 btn = 3;
        #10 btn = 4;

        // Test Case 3: Timeout scenario (no button pressed for 10 cycles)
        #20 btn = 0 ;

        // Test Case 4: Reset system again
        #30 reset = 1;  
        #10 reset = 0;
end

always forever #5 clk = ~clk; 
always forever #200 reset = ~ reset;


Door_System uut (btn , clk, reset, y, green, red);

endmodule

