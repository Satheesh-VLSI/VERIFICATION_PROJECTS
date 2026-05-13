
//========================
//      ENVIRONMENT
//========================
class Environment;
  
  Generator  gen;
  Driver     drv;
  Monitor    mon;
  Scoreboard scr;
  
  mailbox #(Transaction) gen2drv;  //mailbox to send data from generator to driver
  mailbox #(Transaction) mon2scr;  //mailbox to send data from monitor to scoreboard

  function new(virtual DECADE_CNT_INTERFACE inf);
    
    gen2drv=new();
    mon2scr=new();
    
    gen=new(gen2drv);
    drv=new(inf,gen2drv);
    mon=new(inf,mon2scr);
    scr=new(mon2scr);
    
  endfunction

  task test();
    
    fork
      gen.main();
      drv.main();
      mon.main();
      scr.main();
    join_none
    
    wait(scr.done.triggered);
    disable fork;
  endtask
endclass
