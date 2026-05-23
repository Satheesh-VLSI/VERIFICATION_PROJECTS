endclass
    
//===========================
//        SCOREBOARD 
//===========================
class Scoreboard;
  mailbox #(Transaction) mon2scr;
  
  bit [3:0] expected_q; 
  
  
  int count;
  int error_cnt;
  event done;

  function new(mailbox #(Transaction) mon2scr);
    this.mon2scr = mon2scr;
  endfunction

  task main();
    forever begin
      Transaction trans;
      mon2scr.get(trans);

      
      if(trans.rst) begin 
        expected_q = 0;
      end else begin
        if(expected_q != 9)
          expected_q = expected_q + 1;
        else
          expected_q = 0;
      end

      
      if(expected_q != trans.q) begin
        error_cnt++;
        $display("--------------------------------");
        $display("COUNTER FAILED at Time %0t", $time); 
        $display("Expected Q = %0d", expected_q);
        $display("Actual   Q = %0d", trans.q);
        $display("--------------------------------");
      end
      
      count++;
      if(count == 100) begin
        verdict();
        -> done;
        break;
      end
    end
  endtask

  task verdict();
    $display("\n===================================");
    $display("        DESIGN STATUS");
    $display("===================================");
    
    if(error_cnt == 0) 
