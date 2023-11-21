class driver;
	mailbox gen2drive;
	virtual intf vif;
	int no_transactions;
	
	function new(virtual intf vif, mailbox gen2drive);
		this.vif=vif;
		this.gen2drive=gen2drive;
	endfunction
	
	task rst;
		wait(vif.rst);
		$display("Reset started");
		vif.ctrl <= 0;
		vif.d <= 0;
		wait(!vif.rst);
		$display("Reset ended");
	endtask
	
	task main;
		forever begin
			transaction trans;
			gen2drive.get(trans);
			$display("Transaction no = %0h", no_transactions);
			vif.ctrl <= trans.ctrl;
			vif.d <= trans.d;
			@(posedge vif.clk);
			trans.q=vif.q;
			trans.display("OUTPUT");
			@(posedge vif.clk);
			no_transactions++;
		end
	endtask
endclass
