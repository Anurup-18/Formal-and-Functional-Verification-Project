module usr_tb;
  // parameters
  parameter n = 8;

  // signals
  reg clock;
  reg reset;
  reg [1:0] ctrl;
  reg [n-1:0] d;
  wire [n-1:0] q;

  // instantiate the universal shift register module
  usr #(n) u1 (
    .clock(clock),
    .reset(reset),
    .ctrl(ctrl),
    .d(d),
    .q(q)
  );

  // clock generation
  always begin
    #5 clock = ~clock;
  end

  // initialize signals
  initial begin
    clock = 0;
    reset = 0;
    ctrl = 2'b00;
    d = 8'b00000000;

    // apply reset
    reset = 1;
    #10 reset = 0;

    // perform some shift operations
    ctrl = 2'b01; // right shift
    d = 8'b11011011;
    #10;

    ctrl = 2'b10; // left shift
    #10;

    ctrl = 2'b11; // load from input
    d = 8'b10101010;
    #10;

    // additional test cases
    ctrl = 2'b00; // no shift
    #10;

    ctrl = 2'b01; // right shift
    d = 8'b10101010;
    #10;

    ctrl = 2'b10; // left shift
    d = 8'b01010101;
    #10;

    ctrl = 2'b11; // load from input
    d = 8'b11110000;
    #10;

    $finish; // finish the simulation
  end
endmodule
