//==========================
//        MONITOR 
//==========================
class Monitor;
  
  virtual DECADE_CNT_INTERFACE inf;
  mailbox #(Transaction) mon2scr;

  function new(virtual DECADE_CNT_INTERFACE inf,mailbox #(Transaction) mon2scr);
    this.inf=inf;
    this.mon2scr=mon2scr;
  endfunction

  task main();
    forever begin
      
      Transaction trans;
      trans=new();

      @(inf.cb);
      
      trans.rst=inf.rst;
      trans.q=inf.cb.q;

      mon2scr.put(trans);
      trans.display("MONITOR");
    end
  endtask
endclass
