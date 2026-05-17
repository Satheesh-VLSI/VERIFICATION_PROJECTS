//========================
//        MONITOR 
//========================
class Monitor;
  virtual DFF_INTERFACE inf;
  mailbox #(Transaction) mon2scr;

  function new(virtual DFF_INTERFACE inf,mailbox #(Transaction) mon2scr);
    this.inf=inf;
    this.mon2scr=mon2scr;
  endfunction

  task main();
    forever begin
      Transaction trans=new();

      @(inf.cb1 or posedge inf.rst);

      
      trans.rst=inf.rst; 

      if(inf.rst) begin
        trans.Edge=0;
        #1;
        trans.q=inf.q;
      end 
      else begin
        trans.Edge=1;
        trans.d=inf.d; 
        trans.q=inf.cb1.q;
      end
      mon2scr.put(trans);
      
      trans.display("MONITOR");
    end
  endtask
endclass:Monitor




