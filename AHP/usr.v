module usr
#(parameter N=8)
(input wire clk, rst,
input wire [1:0] ctrl,
input wire [N-1:0] d,
output wire [N-1:0] q);

reg [N-1:0]temp;
always@*
	if(clk & (~rst))
	begin
		case(ctrl)
			2'b00:temp<=d;
			2'b01:temp<={d[N-2:0],1'b0};
			2'b10: temp<={1'b0,d[N-1:1]};		
		endcase
	end
assign q=temp;
endmodule


