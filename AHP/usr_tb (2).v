

module usr_tb;

  // Parameters
  parameter N = 8;

  // Signals
  reg clk;
  reg rst;
  reg [1:0] ctrl;
  reg [N-1:0] d;
  wire [N-1:0] q;

  // Instantiate the Universal Shift Register module
  usr #(N) u1 (
    .clk(clk),
    .rst(rst),
    .ctrl(ctrl),
    .d(d),
    .q(q)
  );

  // Clock generation
  always begin
  #10  clk = 0;
  #10 clk = ~clk;
  end

//always #2   ctrl <= $random;

  // Initialize signals
  initial begin

   #10 rst = 1;
	#10 rst = 0;
  
    d = 8'b11111111;

    // Apply reset
    rst = 1;
    #10 rst = 0;

    // Perform some shift operations
    ctrl = 2'b01; // Right shift
    //d = 8'b11011011;
    #10;

    ctrl = 2'b10; // Left shift
    #10;

    ctrl = 2'b11; // Load from input
    //d = 8'b10101010;
    #10;

    // Add more test cases as needed

     // Finish the simulation
  end


endmodule








