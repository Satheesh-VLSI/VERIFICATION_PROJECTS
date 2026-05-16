//===========================
//        DRIVER 
//===========================
class Driver;
  
  virtual DFF_INTERFACE inf;
  mailbox #(Transaction) gen2drv;

  function new(virtual DFF_INTERFACE inf,mailbox #(Transaction) gen2drv);
    this.inf= inf;
    this.gen2drv=gen2drv;
  endfunction

  task main();
    forever begin
      Transaction trans;
      gen2drv.get(trans);

      @(inf.cb);

      inf.cb.d<=trans.d;
      inf.cb.rst<=trans.rst;
      
      
    end
  endtask
endclass:Driver
