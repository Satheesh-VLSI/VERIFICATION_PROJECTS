//=========================
//      SCOREBOARD 
//=========================
class Scoreboard;
  mailbox #(Transaction) mon2scr;
  
  bit expected_q;
  bit prev_d;
  bit prev_rst;
  
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

      
      if(prev_rst)begin 
        expected_q = 0;
      end else begin
        expected_q=prev_d;
      end

      // Compare
      if(expected_q != trans.q) begin
        error_cnt++;
        $display("--------------------------------");
        $display("DFF FAILED at Time %0t", $time);
        $display("Expected Q = %0b", expected_q);
        $display("Actual   Q = %0b", trans.q);
        $display("--------------------------------");
      end

      prev_d=trans.d;
      prev_rst=trans.rst; 

      count++;
      if(count == 100) begin
        verdict();
        -> done;
        break;
      end
    end
  endtask

  task verdict();
    $display("\n================================");
    $display("        DESIGN STATUS");
    $display("================================");
    
    if(error_cnt == 0) 
      $display("SYNC DFF VERIFICATION PASSED");
    else               
      $display("SYNC DFF VERIFICATION FAILED");
    $display("Total Errors = %0d", error_cnt);
    $display("================================\n");
  endtask
endclass:Scoreboard



