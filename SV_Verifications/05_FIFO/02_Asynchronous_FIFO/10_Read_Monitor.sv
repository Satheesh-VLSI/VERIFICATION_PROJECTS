//========================
//     READ MONITOR 
//========================
class Read_Monitor;

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

      @(inf.r_cb1);

      //output signals from interface to monitor through clocking block
      trans.data_out=inf.r_cb1.data_out;
      trans.empty=inf.r_cb1.empty;

      //input signals from interface to monitor through clocking block
      
      trans.r_en=inf.r_cb1.r_en;
      trans.r_rst=inf.r_cb1.r_rst;

      mon2scr.put(trans);
//       trans.display_read("Read_MONITOR");

    end

  endtask

endclass
