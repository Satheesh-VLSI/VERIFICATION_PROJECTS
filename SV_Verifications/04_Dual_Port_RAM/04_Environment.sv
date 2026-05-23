//========================
//     ENVIRONMENT
//========================
class Environment;

  Generator gen;
  Driver drv;
  Monitor mon;
  Scoreboard scr;

  mailbox #(Transaction) gen2drv;
  mailbox #(Transaction) mon2scr;
  
  virtual RAM_INTERFACE inf;

  function new(virtual RAM_INTERFACE inf,string name);

    gen2drv=new();
    mon2scr=new();

    gen=new(gen2drv);
    drv=new(inf,gen2drv);
    mon=new(inf,mon2scr);
    scr=new(mon2scr,name);
    
    this.inf=inf;

  endfunction
  
   
  task reset_system();
    @(inf.cb);
    inf.cb.rst <= 1;
    repeat(2) @(inf.cb);
    inf.cb.rst <= 0;
  endtask

  task test();

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

