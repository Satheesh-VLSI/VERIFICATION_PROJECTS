//===========================
//       SCOREBOARD 
//===========================
class Scoreboard #(parameter Width=8, parameter Depth=16);
  
  Coverage Cover;

  mailbox #(Transaction) mon2scr;
  
  
  static int total_tests_pass=0;
  static int total_tests_fail=0;

  bit [Width-1:0] Queue[$];
  bit [Width-1:0] exp_q[$];

  bit [Width-1:0] exp_out;
  bit exp_full, exp_empty;

  int transaction_cnt;
  int count;
  int error_cnt;
  

  event done;

  function new(mailbox #(Transaction) mon2scr,string name);
    this.mon2scr=mon2scr;
    Cover=new(name);
    exp_full=0;
    exp_empty=1;
  endfunction

  task main();

    forever begin
      Transaction trans;
      mon2scr.get(trans);
      Cover.sample(trans);
    
      
      if(trans.rst) begin 
        exp_full = 0;
        exp_empty = 1;
        exp_out=0;
        Queue.delete();
        exp_q.delete();
      end
      else begin
        
          if(exp_q.size() > 0) begin
        exp_out = exp_q.pop_front();
        if(exp_out !== trans.data_out) begin
          error_cnt++;
          $display("\n\nXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
          $display("X    [Time %4t] DATA MISMATCH          X",$time);
          $display("X Expected Out   :  %3d                  X",exp_out);
          $display("X Actual Out     :  %3d                  X",trans.data_out);
          $display("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\n\n");
        end
      end

      
      if(exp_full !== trans.full || exp_empty !== trans.empty) begin
          error_cnt++;
        $display("\n\nXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
          $display("X    [Time %4t] FLAG MISMATCH          X",$time);
          $display("X Expected Full  :  %b  |  Actual Full  :  %b  X",exp_full,trans.full);
          $display("X Expected Empty :  %b  |  Actual Empty :  %b  X ",exp_empty,trans.empty);
        $display("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\n\n");
      end

      
        
        // Predict Write
        if(trans.w_en && !exp_full) begin
          Queue.push_back(trans.data_in);
        end
        
        // Predict Read
        if(trans.r_en && !exp_empty) begin
          exp_q.push_back(Queue.pop_front());
        end
        
        
        exp_empty = (Queue.size() == 0);
        exp_full  = (Queue.size() == Depth); 
      end

      count++;

      
      if(count == transaction_cnt+2) begin
        verdict();

        count=0;
        error_cnt=0;

        -> done;
        break;
      end
    end

  endtask

  //Final design status after all tests
  task verdict();

    $display("\n================================");
    $display("        DESIGN STATUS");
    $display("================================");

    if(error_cnt==0)begin
      $display("Synchronous FIFO PASSED");
      total_tests_pass++;
    end
    else begin
      $display("Synchronous FIFO  FAILED");
      total_tests_fail++;
    end
    

    $display("Total Errors = %0d",error_cnt);
    $display("================================\n");

  endtask

endclass 
