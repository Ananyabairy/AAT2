
//-------------------------------------Design-------------------------------


`timescale 1ns/1ps

module digital_clock (
  input  logic clk,
  input  logic reset,
  output logic [5:0] seconds,
  output logic [5:0] minutes
);

always_ff @(posedge clk) begin

  // Reset condition
  if (reset) begin
    seconds <= 6'd0;
    minutes <= 6'd0;
  end

  else begin

    // When seconds reaches 59
    if (seconds == 6'd59) begin
      seconds <= 6'd0;

      // Increment minutes
      if (minutes == 6'd59)
        minutes <= 6'd0;     // minute rollover
      else
        minutes <= minutes + 1;

    end

    // Otherwise increment seconds
    else begin
      seconds <= seconds + 1;
    end

  end

end

endmodule
