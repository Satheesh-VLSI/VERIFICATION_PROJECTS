//===========================
//        SCOREBOARD 
//===========================
class Scoreboard;
  mailbox #(Transaction) mon2scr;
  
  bit expected_q;
  bit prev_d;
  
  
  int count;
  int error_cnt;
  event done;

  function new(mailbox #(Transaction) mon2scr);
    this.mon2scr=mon2scr;
  endfunction

  task main();
    forever begin
      Transaction trans;
      mon2scr.get(trans);

      if(trans.rst) begin
        expected_q=0;
        prev_d=0;
      end
      else if(trans.Edge) begin
        expected_q=prev_d;
        prev_d=trans.d;
      end

      // Compare
      if(expected_q!==trans.q) begin
        error_cnt++;
        $display("--------------------------------");
        $display("DFF FAILED at Time %0t",$time);
        $display("Expected Q = %0b",expected_q);
        $display("Actual   Q = %0b",trans.q);
        $display("--------------------------------");
      end

      count++;
      if(count>=100) begin
        verdict();
        ->done;
        break;
      end
    end
  endtask

  //Final design status after all tests
  task verdict();
    $display("\n================================");
    $display("        DESIGN STATUS");
    $display("================================");
    if(error_cnt==0) 
      $display("ASYNC DFF VERIFICATION PASSED");
    else              
      $display("ASYNC DFF VERIFICATION FAILED");
    $display("Total Errors = %0d",error_cnt);
    $display("================================\n");
  endtask
endclass:Scoreboard




