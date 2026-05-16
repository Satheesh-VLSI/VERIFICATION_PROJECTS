//==========================
//        MONITOR 
//==========================
class Monitor;
  
  virtual DFF_INTERFACE inf;
  mailbox #(Transaction) mon2scr;

  function new(virtual DFF_INTERFACE inf,mailbox #(Transaction) mon2scr);
    this.inf=inf;
    this.mon2scr=mon2scr;
  endfunction

  task main();
    forever begin
      
      Transaction trans;
      trans=new();

      @(inf.cb1);
      
      
      trans.d=inf.cb1.d;
      trans.rst=inf.cb1.rst;
      trans.q=inf.cb1.q;

      mon2scr.put(trans);
      trans.display("MONITOR");
    end
  endtask
endclass:Monitor





