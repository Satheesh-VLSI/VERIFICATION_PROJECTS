    
//=======================
//       DRIVER
//=======================
class Driver;

  virtual RAM_INTERFACE inf;
  mailbox #(Transaction) gen2drv;

  function new(
    virtual RAM_INTERFACE inf,
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
      inf.cb.data_in_A<=trans.data_in_A;
      inf.cb.data_in_B<=trans.data_in_B;

      //addr and control signals
      inf.cb.addr_A<=trans.addr_A;
      inf.cb.addr_B<=trans.addr_B;
      inf.cb.mode_A<=trans.mode_A;
      inf.cb.mode_B<=trans.mode_B;
      inf.cb.rst<=trans.rst;

    end

  endtask

endclass
