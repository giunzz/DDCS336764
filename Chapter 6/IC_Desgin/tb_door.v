module HoangNgocDung_tb_DoorSystem();

reg clk, reset;
reg [3:0] btn;
wire y, green, red;
    
initial begin

clk = 0;
btn = 0;
reset = 1;
#10 reset = 0;

#10 btn = 1;
#10 btn = 3; 
#10 btn = 2; 
#10 btn = 4; 

#10 btn = 1; 
#10 btn = 3; 
#10 btn = 2; 
#10 btn = 4;  

#10 btn = 1; 
#10 btn = 2; 
#10 btn = 2; 
#10 btn = 4;  
end

always forever #5 clk = ~clk; 
always forever #200 reset = ~ reset;


Door_System uut (btn , clk, reset, y, green, red);

endmodule

