module dung_tb_adder_4bit();

reg [3:0] A;
reg [3:0] B;
wire [4:0] R;


initial begin
    A = 4'b0101; B = 4'b0011;
end

always forever #5 A = ~A;
always forever #5 B = ~B;
always forever #10 A = ~A;

adder_4bit uut (A,B,R);
endmodule

