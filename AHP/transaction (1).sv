class transaction;
	rand bit [1:0]ctrl;
	rand bit [7:0]d;
	rand bit [7:0]q;
	
function void display (string name);
$display("------------------------------------------------");
$display("INPUTS");
$display("\t ctrl=%0h, \t d=%0h", ctrl,d);
$display("OUTPUTS");
$display("\t q=%0h, \t", q);
$display("------------------------------------------------");
endfunction
endclass
