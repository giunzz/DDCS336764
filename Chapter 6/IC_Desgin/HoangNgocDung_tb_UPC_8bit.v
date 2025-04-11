`timescale 1ns/1ns  
module HoangNgocDung_tb_UPC_8bit;
wire [7:0] out;    
reg ud, clk, reset; 
initial begin
    ud = 1;        
    clk = 0;        // Xung đồng hồ bắt đầu ở mức thấp (0)
    reset = 1;      // Đặt lại bộ đếm (reset = 1)
    #20 reset = 0;  // Sau 20ns, tắt reset để bộ đếm bắt đầu hoạt động
end

always forever #20 clk = ~clk;   
always forever #250 ud = ~ud;    
always forever #800 reset = ~reset; 

CounterUD m0(
    .clk(clk),     
    .reset(reset), 
    .ud(ud),       
    .out(out)      
);

endmodule
