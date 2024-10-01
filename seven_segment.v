module seven_segment_decoder(
    input wire [3:0] digit,
    output reg [6:0] seg  // 7-segment output
);
    always @(*) begin
        case (digit)
            4'd0: seg = 7'b1000000;  // Display 0
            4'd1: seg = 7'b1111001;  // Display 1
            4'd2: seg = 7'b0100100;  // Display 2
            4'd3: seg = 7'b0110000;  // Display 3
            4'd4: seg = 7'b0011001;  // Display 4
            4'd5: seg = 7'b0010010;  // Display 5
            4'd6: seg = 7'b0000010;  // Display 6
            4'd7: seg = 7'b1111000;  // Display 7
            4'd8: seg = 7'b0000000;  // Display 8
            4'd9: seg = 7'b0010000;  // Display 9
            default: seg = 7'b1111111;  // Blank display (default)
        endcase
    end
endmodule
