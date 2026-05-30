//========================
//     ENVIRONMENT
//========================
class Environment;

  Write_Agent w_agent;
  Read_Agent r_agent;
  Scoreboard #(.Width(8),.Depth(32)) scr;
  
  mailbox #(Transaction) w_mon2scr;
  mailbox #(Transaction) r_mon2scr;

  virtual FIFO_INTERFACE inf;
  
  function new(virtual FIFO_INTERFACE inf,string name);

    this.inf=inf;
    
    
    w_mon2scr=new();
    r_mon2scr=new();
    w_agent=new(inf,w_mon2scr);
    r_agent=new(inf,r_mon2scr);
    scr=new(w_mon2scr,r_mon2scr,inf,name);

  endfunction
  
  task reset_system();
    
    $display("[ENVIRONMENT] Asserting Active-High Resets... at time = %0t",$time);
    inf.w_rst <= 1;
    inf.r_rst <= 1;
    inf.w_en  <= 0; 
    inf.r_en  <= 0;
    
    #50; 
    
    inf.w_rst <= 0;
    inf.r_rst <= 0;
    $display("[ENVIRONMENT] Resets De-asserted at time = %0t",$time);
    
  endtask

  task test(string name,int count);
        
    Transaction dummy;
    
    configure(name,count);  //configuring the generator for different testings

    
    while(w_mon2scr.try_get(dummy));
    while(r_mon2scr.try_get(dummy));
    
    fork
      begin
        fork
          w_agent.agent_task();
          r_agent.agent_task();
          scr.main();
        join_none
        @(scr.done);
        disable fork;
      end
    join
  endtask
        
  task configure(string name,int count);
    w_agent.gen.test_name=name;
    w_agent.gen.transaction_cnt=count;
    
    
    r_agent.gen.test_name=name;
    r_agent.gen.transaction_cnt=count;
    
    scr.transaction_cnt=count;
  endtask
    
        
endclass : Environment
        
 
