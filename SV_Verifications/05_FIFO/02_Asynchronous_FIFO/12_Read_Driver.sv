

    
//=======================
//     read  DRIVER
//=======================
class Read_Driver;

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

      @(inf.r_cb);

      //addr and control signals
      inf.r_cb.r_en<=trans.r_en;

    end

  endtask

endclass

    

