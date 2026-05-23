      
    $display("Total Errors = %0d", error_cnt);
    $display("===================================\n");
  endtask
endclass:Scoreboard

//========================
//      ENVIRONMENT
//========================
class Environment;
  Generator  gen;
  Driver     drv;
  Monitor    mon;
  Scoreboard scr;
  
  mailbox #(Transaction) gen2drv; 
  mailbox #(Transaction) mon2scr; 

  function new(virtual DECADE_CNT_INTERFACE inf);
    gen2drv = new();
    mon2scr = new();
    
    gen = new(gen2drv);
    drv = new(inf, gen2drv);
    mon = new(inf, mon2scr);
    scr = new(mon2scr);
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
endclass:Environment


      
