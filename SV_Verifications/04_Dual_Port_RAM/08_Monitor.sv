
//========================
//       MONITOR 
//========================
class Monitor;

  virtual RAM_INTERFACE inf;
  mailbox #(Transaction) mon2scr;

  function new(virtual RAM_INTERFACE inf,
               mailbox #(Transaction) mon2scr);

    this.inf=inf;
    this.mon2scr=mon2scr;

  endfunction

  task main();

    forever begin
      
      Transaction trans;
      trans=new();

      @(inf.cb1);

      //data signals from interface to monitor through clocking block
      trans.data_in_A=inf.cb1.data_in_A;
      trans.data_in_B=inf.cb1.data_in_B;

      trans.data_out_A=inf.cb1.data_out_A;
      trans.data_out_B=inf.cb1.data_out_B;

      //addr and control signals from interface to monitor through clocking block
      trans.addr_A=inf.cb1.addr_A;
      trans.addr_B=inf.cb1.addr_B;
      trans.mode_A=inf.cb1.mode_A;
      trans.mode_B=inf.cb1.mode_B;
      trans.rst=inf.cb1.rst;

      mon2scr.put(trans);
      trans.display("MONITOR");

    end

  endtask

endclass
    
