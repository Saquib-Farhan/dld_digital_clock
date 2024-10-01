module digitalclock(
    input wire clk,        // 50 MHz input clock
    input wire reset,      // Reset signal
    output wire [6:0] sec_ones_seg,
    output wire [6:0] sec_tens_seg,
    output wire [6:0] min_ones_seg,
    output wire [6:0] min_tens_seg,
    output wire [6:0] hr_ones_seg,
    output wire [6:0] hr_tens_seg
);
    wire clk_1Hz;
    wire [3:0] sec_ones, sec_tens, min_ones, min_tens, hr_ones, hr_tens;

    // Generate 1 Hz clock
    clock_divider clk_div(
        .clk_in(clk),
        .clk_out(clk_1Hz)
    );

    // BCD Counter for timekeeping
    bcd_counter counter(
        .clk(clk_1Hz),
        .reset(reset),
        .sec_ones(sec_ones),
        .sec_tens(sec_tens),
        .min_ones(min_ones),
        .min_tens(min_tens),
        .hr_ones(hr_ones),
        .hr_tens(hr_tens)
    );

    // 7-segment decoders for each digit
    seven_segment_decoder sec_ones_decoder(
        .digit(sec_ones),
        .seg(sec_ones_seg)
    );

    seven_segment_decoder sec_tens_decoder(
        .digit(sec_tens),
        .seg(sec_tens_seg)
    );

    seven_segment_decoder min_ones_decoder(
        .digit(min_ones),
        .seg(min_ones_seg)
    );

    seven_segment_decoder min_tens_decoder(
        .digit(min_tens),
        .seg(min_tens_seg)
    );

    seven_segment_decoder hr_ones_decoder(
        .digit(hr_ones),
        .seg(hr_ones_seg)
    );

    seven_segment_decoder hr_tens_decoder(
        .digit(hr_tens),
        .seg(hr_tens_seg)
    );
endmodule
