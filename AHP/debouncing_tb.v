module debouncing_tb;

reg clk,reset;
reg sw;
wire db_tick,db_level;

debounce_fsmd dut(clk, reset, sw, db_tick, db_level);

always begin
clk=1'b0;
#10 
clk = 1'b1;
#10;
end

initial begin 
reset=1;
sw=0;
#10 sw=1'b1;

#10 reset=0;
#10 sw=1;
#100 sw=0;
#100 sw=1;
#2500 sw=0;
#10 sw=1;
#100 sw=0;
#2500;
$finish;
end

endmodule
