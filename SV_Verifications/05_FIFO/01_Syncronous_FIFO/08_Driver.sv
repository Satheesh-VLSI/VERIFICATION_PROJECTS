//=======================
//       DRIVER
//=======================
class Driver;

  virtual FIFO_INTERFACE inf;
  mailbox #(Transaction) gen2drv;

  function new(
    virtual FIFO_INTERFACE inf,
    mailbox #(Transaction) gen2drv
  );

    this.inf=inf;
    this.gen2drv=gen2drv;

  endfunction

  task main();

    forever begin
      Transaction trans;
      gen2drv.get(trans);

      @(inf.cb);

      //data signals
      inf.cb.data_in<=trans.data_in;
      
      inf.cb.rst<=trans.rst;

      //addr and control signals
      inf.cb.w_en<=trans.w_en;
      inf.cb.r_en<=trans.r_en;

    end

  endtask

endclass
    
    
