
  
//================================
//         WRITE AGENT
//================================
class Write_Agent;
  
   virtual FIFO_INTERFACE inf;
  
  Write_Generator gen;
  Write_Driver    drv;
  Write_Monitor   mon;
  
  mailbox #(Transaction) gen2drv;
  mailbox #(Transaction) mon2scr;
  
  
  function new( virtual FIFO_INTERFACE inf, mailbox #(Transaction) mon2scr);
    
    this.inf=inf;
    
    gen2drv=new();

    gen=new(gen2drv);
    drv=new(inf,gen2drv);
    mon=new(inf,mon2scr);

  endfunction
  
  task agent_task();
    
    
//     Transaction dummy;
    
//     while(gen2drv.try_get(dummy));
//     while(mon2scr.try_get(dummy));

    fork
      gen.main();
      drv.main();
      mon.main();
        join_none
  endtask
endclass
        
    
