//MONITOR
class Monitor;
  Transaction trans;
  
  virtual FA_INTERTFACE inf;
  mailbox #(Transaction) mon2scr;
  
  
  function new(virtual FA_INTERTFACE inf,mailbox #(Transaction) mon2scr);
    this.inf=inf;
    this.mon2scr=mon2scr;
  endfunction
  
  task main();
    
    forever begin 
      trans=new();
      @(posedge inf.clk);
      #1;
      trans.a=inf.a;
      trans.b=inf.b;
      trans.cin=inf.cin;
      trans.sum=inf.sum;
      trans.cout=inf.cout;
      
      mon2scr.put(trans);
      trans.display("MONITOR");
    end
  endtask
  
endclass:Monitor

