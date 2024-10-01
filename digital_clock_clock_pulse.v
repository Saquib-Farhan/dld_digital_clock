module digital_clock(
    input wire clk_in,  // Input clock (e.g., 50 MHz)
    output reg clk_out  // Output 1 Hz clock
);
    reg [25:0] counter = 0;  // 26-bit counter to divide the clock

    always @(posedge clk_in) begin
        if (counter == 50000000 - 1) begin  // When counter reaches 50 million, toggle clk_out
            counter <= 0;  // Reset counter
            clk_out <= ~clk_out;  // Toggle output clock signal
        end else begin
            counter <= counter + 1;  // Increment counter
        end
    end
endmodule
