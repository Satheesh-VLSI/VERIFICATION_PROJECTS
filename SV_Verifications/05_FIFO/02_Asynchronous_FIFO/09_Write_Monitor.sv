  
//========================
//     WRITE MONITOR 
//========================
class Write_Monitor;

  virtual FIFO_INTERFACE inf;
  mailbox #(Transaction) mon2scr;

  function new(virtual FIFO_INTERFACE inf,
               mailbox #(Transaction) mon2scr);

    this.inf=inf;
    this.mon2scr=mon2scr;

  endfunction

  task main();

    forever begin
      
      Transaction trans;
      trans=new();

      @(inf.w_cb1);

      //output signals from interface to monitor through clocking block
      trans.full=inf.w_cb1.full;

      //input signals from interface to monitor through clocking block
      
      trans.data_in=inf.w_cb1.data_in;
      trans.w_en=inf.w_cb1.w_en;
      trans.w_rst=inf.w_cb1.w_rst;

      mon2scr.put(trans);
//      trans.display_write("Write_MONITOR");

    end

  endtask

endclass

    
