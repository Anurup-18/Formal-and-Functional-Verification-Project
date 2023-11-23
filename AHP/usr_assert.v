module usr_assert;

  // Parameters
  parameter N = 8;

  // Signals
  reg clock;
  reg reset;
  reg [1:0] ctrl;
  reg [N-1:0] d;
  wire [N-1:0] q;

  // Instantiate the DUT (Design Under Test)
  usr #(N) uut (
    .clock(clock),
    .reset(reset),
    .ctrl(ctrl),
    .d(d),
    .q(q)
  );

  // Clock generation
  initial begin
    clock = 0;
    forever #5 clock = ~clock;
  end

  // Reset generation
  initial begin
    reset = 1;
    #10 reset = 0;
  end

  // Random stimulus generation
  initial begin
    #20;
    repeat (100) begin
      // Randomize inputs
      ctrl = $urandom_range(0, 3);
      d = $urandom;

      #10;
    end
    $finish;
  end

  // Assertions
  initial begin
    // Assert reset
    assert (reset) else $fatal("Testbench failed: Reset assertion failed");

    // Assert ctrl values
    for (int i = 0; i < 4; i++) begin
      ctrl = i;
      #10;
      case (i)
        2'b00: assert (q == d) else $fatal("Testbench failed: Assertion for ctrl=2'b00 failed");
        2'b01: assert (q == {r_reg[N-2:0], d[0]}) else $fatal("Testbench failed: Assertion for ctrl=2'b01 failed");
        2'b10: assert (q == {d[N-1], r_reg[N-1:1]}) else $fatal("Testbench failed: Assertion for ctrl=2'b10 failed");
        default: assert (q == d) else $fatal("Testbench failed: Default assertion failed");
      endcase
    end
  end

endmodule
