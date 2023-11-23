class generator;
	rand transaction trans;
	mailbox gen2drive;
	int repeat_count;
	event ended;
	
	function new(mailbox gen2drive, event ended);
		this.gen2drive=gen2drive;
		this.ended=ended;
	endfunction
	
	task main;
		repeat(repeat_count) begin
		trans=new();
		if(!trans.randomize()) $fatal("Randomization failed");
			gen2drive.put(trans);
		end
		-> ended;
	endtask
endclass
