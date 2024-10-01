module bcd_counter(
    input wire clk,
    input wire reset,
    output reg [3:0] sec_ones, sec_tens, min_ones, min_tens, hr_ones, hr_tens
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            sec_ones <= 0; sec_tens <= 0;  // Reset seconds
            min_ones <= 0; min_tens <= 0;  // Reset minutes
            hr_ones <= 0; hr_tens <= 0;    // Reset hours
        end else begin
            // Increment seconds ones place
            if (sec_ones == 9) begin
                sec_ones <= 0;  // Reset ones and increment tens place
                if (sec_tens == 5) begin
                    sec_tens <= 0;  // Reset seconds to 00 and increment minutes ones place
                    if (min_ones == 9) begin
                        min_ones <= 0;
                        if (min_tens == 5) begin
                            min_tens <= 0;  // Reset minutes to 00 and increment hour ones place
                            if (hr_ones == 9) begin
                                hr_ones <= 0;
                                hr_tens <= hr_tens + 1;  // Increment hour tens place
                            end else begin
                                hr_ones <= hr_ones + 1;
                            end
                        end else begin
                            min_tens <= min_tens + 1;
                        end
                    end else begin
                        min_ones <= min_ones + 1;
                    end
                end else begin
                    sec_tens <= sec_tens + 1;
                end
            end else begin
                sec_ones <= sec_ones + 1;  // Increment seconds ones place
            end
        end
    end
endmodule
