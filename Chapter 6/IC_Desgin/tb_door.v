module HoangNgocDung_tb_DoorSystem();

reg clk, reset;
reg [3:0] btn;
wire y, green, red;
    
initial begin
btn = 4'b0001;
reset = 0;
clk = 0;
reset = 1;
#10 reset = 0;
#10 btn = 4'b0101;
#10 btn = 4'b0111;
#10 btn = 4'b1111;

#100 btn = 4;
#40 btn = 1;
#10 btn = 3;
#10 btn = 2;
#10 btn = 4;
end

always forever #5 clk = ~clk; 
Door_System uut (btn , clk, reset, y, green, red);

endmodule

