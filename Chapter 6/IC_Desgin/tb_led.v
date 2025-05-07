module HoangNgocDung_led7_decoder();

    reg en;
    reg [3:0] binary;

    wire [6:0] out_7seg;

    led7_decoder UUT(
        .i_en(en),
        .i_binary(binary),
        .o_7seg(out_7seg)
    );

   
    integer i;

    initial begin
        binary = 4'h7;
        en = 0;
        #10 en = 1;
        for (i = 0; i < 16; i = i + 1) begin
            #20 binary = i;
        end
    end
endmodule
