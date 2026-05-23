//===========================
//       SCOREBOARD 
//===========================
class Scoreboard;
  
  Coverage Cover;                //coverage class object
  mailbox #(Transaction) mon2scr;

  bit [7:0] Queue_A[$];
  bit [7:0] Queue_B[$];
  reg [7:0] memory [int];

  bit [7:0] exp_A;
  bit [7:0] exp_B;

  bit [7:0] old_read;


  int transaction_cnt;
  int count;
  int error_cnt;

  event done;

  bit skip_en;

  function new(mailbox #(Transaction) mon2scr,string name);
    this.mon2scr=mon2scr;
    Cover=new(name);
  endfunction

  task main();

    forever begin
      Transaction trans;
      mon2scr.get(trans);
      Cover.sample(trans); //sampling function called froom coverage class
      
      if (trans.rst) begin
        memory.delete();
        Queue_A.delete();
        Queue_B.delete();
        
        count++;
        continue; // Skip the rest of the checks for this transaction
      end

      if(skip_en) begin
        skip_en=0;
        continue;
      end

      //--------check previous reads--------
      if(Queue_A.size()>0) begin
        exp_A=Queue_A.pop_front();

        if(exp_A!=trans.data_out_A) begin

          error_cnt++;

          $display("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
          $display("X    [Time %4t] PORT A FAILED           X",$time);
          $display("X Expected   :  %3d                      X",exp_A);
          $display("X Actual     :  %3d                      X",trans.data_out_A);
          $display("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        end
      end

      if(Queue_B.size()>0) begin

        exp_B=Queue_B.pop_front();

        if(exp_B!=trans.data_out_B) begin
          error_cnt++;

          $display("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
          $display("X    [Time %4t] PORT B FAILED           X",$time);
          $display("X Expected   :  %3d                      X",exp_B);
          $display("X Actual     :  %3d                      X",trans.data_out_B);
          $display("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        end
      end

      //-----------Process current write-------------
      if(trans.addr_A!=trans.addr_B) begin
        if(trans.mode_A)
          memory[trans.addr_A]=trans.data_in_A;
        if(trans.mode_B)
          memory[trans.addr_B]=trans.data_in_B;
      end
      else begin
        if(trans.mode_A)
          memory[trans.addr_A]=trans.data_in_A;
      end

     //----------Process current reads---------------
      if(trans.addr_A!=trans.addr_B) begin
        if(!trans.mode_A) begin
          if (memory.exists(trans.addr_A))
            Queue_A.push_back(memory[trans.addr_A]);
          else
            Queue_A.push_back(0); 
        end

        if(!trans.mode_B) begin
          if (memory.exists(trans.addr_B)) begin
            old_read = memory[trans.addr_B];
            Queue_B.push_back(memory[trans.addr_B]);
          end else begin
            old_read = 0;
            Queue_B.push_back(0); 
          end
        end

      end
      //collision scenario
      else begin
        if(!trans.mode_A) begin
          
          if (memory.exists(trans.addr_A))
            Queue_A.push_back(memory[trans.addr_A]);
          else
            Queue_A.push_back(0); 
        end

        if(!trans.mode_B)
          Queue_B.push_back(old_read);
      end

      count++;

      if(count==transaction_cnt+1) begin
        verdict();

        count=0;
        error_cnt=0;
        Queue_A.delete();
        Queue_B.delete();

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

    if(error_cnt==0)
      $display("DUAL PORT MEMORY PASSED");
    else
      $display("DUAL PORT MEMORY  FAILED");

    $display("Total Errors = %0d",error_cnt);
    $display("================================\n");

  endtask

endclass
