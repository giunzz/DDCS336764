module HoangNgocDung_t_password();

    reg en;
    reg [11:0] password; // input 3 digit 

    wire [6:0] out_7seg_0;
    wire [6:0] out_7seg_1;
    wire [6:0] out_7seg_2;

    pass_decoder UUT(
        .i_en(en),
        .i_password(password),
        .o_7seg_0(out_7seg_0),
        .o_7seg_1(out_7seg_1),
        .o_7seg_2(out_7seg_2)
    );

   
    integer i;

    initial begin
        password = 12'h666; // assume
        en = 0;
        #10 en = 1;
        for (i = 0; i < 16; i = i + 1) begin
            #20 password = $random;
        end
    end

endmodule
