//========================
//     ENVIRONMENT
//========================
class Environment;

  Generator gen;
  Driver drv;
  Monitor mon;
  Scoreboard #(.Width(8),.Depth(16)) scr;

  mailbox #(Transaction) gen2drv;
  mailbox #(Transaction) mon2scr;

  virtual FIFO_INTERFACE inf;
  
  function new(virtual FIFO_INTERFACE inf);

    this.inf=inf;
    
    gen2drv=new();
    mon2scr=new();

    gen=new(gen2drv);
    drv=new(inf,gen2drv);
    mon=new(inf,mon2scr);
    scr=new(mon2scr);

  endfunction
  
  task reset_system();
    @(inf.cb);
    inf.cb.rst <= 1;
    inf.cb.w_en <= 0;
    inf.cb.r_en <= 0;
    repeat(2) @(inf.cb);
    inf.cb.rst <= 0;
  endtask

  task test();
    
    
    Transaction dummy;
    
    while(gen2drv.try_get(dummy));
    while(mon2scr.try_get(dummy));

    fork
      begin
        fork
          gen.main();
          drv.main();
          mon.main();
          scr.main();
        join_none
        @(scr.done);
        disable fork;
      end
    join
  endtask
        
endclass : Environment
        
        
