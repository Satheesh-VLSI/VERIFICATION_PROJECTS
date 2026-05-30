    
//=======================
//     Write  DRIVER
//=======================
class Write_Driver;

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

      @(inf.w_cb);

      //data signals
      inf.w_cb.data_in<=trans.data_in;
      
      //addr and control signals
      inf.w_cb.w_en<=trans.w_en;
      
      

    end

  endtask

endclass

