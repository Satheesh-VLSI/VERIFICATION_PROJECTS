//========================
//       MONITOR 
//========================
class Monitor;

  virtual FIFO_INTERFACE inf;
  mailbox #(Transaction) mon2scr;

  function new(virtual FIFO_INTERFACE inf,
               mailbox #(Transaction) mon2scr);

    this.inf=inf;
    this.mon2scr=mon2scr;

  endfunction

  task main();

    forever begin
      
      Transaction trans;
      trans=new();

      @(inf.cb1);

      //output signals from interface to monitor through clocking block
      trans.data_out=inf.cb1.data_out;
      trans.full=inf.cb1.full;
      trans.empty=inf.cb1.empty;

      //input signals from interface to monitor through clocking block
      
      trans.data_in=inf.cb1.data_in;
      trans.w_en=inf.cb1.w_en;
      trans.r_en=inf.cb1.r_en;
      trans.rst=inf.cb1.rst;

      mon2scr.put(trans);
      //trans.display("MONITOR");

    end

  endtask

endclass
