
//===========================
//        DRIVER 
//===========================
class Driver;
  
  virtual DECADE_CNT_INTERFACE inf;
  mailbox #(Transaction) gen2drv;

  function new(virtual DECADE_CNT_INTERFACE inf,mailbox #(Transaction) gen2drv);
    this.inf= inf;
    this.gen2drv=gen2drv;
  endfunction

  task main();
    inf.rst=1;
    forever begin
      Transaction trans;
      gen2drv.get(trans);

      @(inf.cb);
      inf.cb.rst<=trans.rst;
    end
  endtask
endclass:Driver
