
//SCOREBOARD
class Scoreboard;
  
  mailbox #(Transaction) mon2scr;
  
  bit expected_sum,expected_cout;
  
  
  event done;
  integer count=0;
  
  
  function new(mailbox #(Transaction) mon2scr);
    
    this.mon2scr=mon2scr;
  endfunction
  
    int error_cnt;
  task main();
    error_cnt=0;
    forever begin
      
      Transaction trans;
      
      mon2scr.get(trans); //GETTING THE TRANS OBJECT FROM THE MONITOR USING MAILBOX 
      
      expected_sum=trans.a^trans.b^trans.cin;
      expected_cout=(trans.a & trans.b)|(trans.b &trans.cin)|(trans.a&trans.cin);
      
      if(expected_sum!=trans.sum || expected_cout!=trans.cout)
        error_cnt++;
      
      count++;
      if(count==100)begin 
        ->>done;
        verdict();
      end
    end 
  endtask
  
  task verdict();
    $display("==================================");
    $display("DESIGN STATUS:");
    if(error_cnt==0)
      $display("    Full Adder PASSED");
    else
      $display("    Full Adder FAILED");
    
    $display("==================================");
  endtask
  
endclass:Scoreboard
