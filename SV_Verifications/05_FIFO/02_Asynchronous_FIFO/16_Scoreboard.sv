//===========================
//        SCOREBOARD 
//===========================
class Scoreboard #(parameter Width=8, parameter Depth=32);
  
  virtual FIFO_INTERFACE inf;
  Coverage COV;

  mailbox #(Transaction) w_mon2scr;
  mailbox #(Transaction) r_mon2scr;
  
  static int total_tests_pass=0;
  static int total_tests_fail=0;

  
  bit [Width-1:0] mem [Depth];
  
  
  bit [Width-1:0] exp_q[$];

  bit [Width-1:0] exp_out;
  bit exp_full,exp_empty;
  
  // Internal Pointers
  int w_ptr=0;
  int r_ptr=0;
  
  int w_ptr_sync[4]='{0,0,0,0};
  int r_ptr_sync[4]='{0,0,0,0};

  int transaction_cnt;
  int count;
  int error_cnt;

  event done;

  function new(mailbox #(Transaction) w_mon2scr,r_mon2scr,virtual FIFO_INTERFACE inf,string name);
    this.w_mon2scr=w_mon2scr;
    this.r_mon2scr=r_mon2scr;
    this.inf=inf;
    COV=new(name);
    exp_full=0;
    exp_empty=1;
  endfunction

  task main();
    fork
      //-------------------------write thread-----------------------
      forever begin
        Transaction w_trans;
        w_mon2scr.get(w_trans); 
        COV.write_sample(w_trans);
        
        
        if(inf.w_rst) begin
          w_ptr=0;
          r_ptr_sync='{0,0,0,0};
          exp_full=0;
        end 
        
        else begin
          r_ptr_sync[3]=r_ptr_sync[2];
          r_ptr_sync[2]=r_ptr_sync[1];
          r_ptr_sync[1]=r_ptr_sync[0];
          r_ptr_sync[0]=r_ptr;
          
          exp_full=((w_ptr-r_ptr_sync[3])>=Depth);
          
          if(exp_full!=w_trans.full) begin 
            error_cnt++;
            $display("\nXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
            $display("X    [Time %4t] WRITE FLAG MISMATCH      X",$time);
            $display("X Expected Full  :  %b  |  Actual Full  :  %b  X",exp_full,w_trans.full);
            $display("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\n");
          end 
          
          //current write 
          if(w_trans.w_en&&!exp_full) begin
            mem[w_ptr%Depth]=w_trans.data_in;
            w_ptr++;
          end
        end
      end
      
      //-------------------------read thread-----------------------
      forever begin
        Transaction r_trans;
        r_mon2scr.get(r_trans); 
        COV.read_sample(r_trans);
        
        
        
        if(inf.r_rst) begin
          r_ptr=0;
          w_ptr_sync='{0,0,0,0};
          exp_empty=1;
          exp_q.delete();
        end 
        else begin
          w_ptr_sync[3]=w_ptr_sync[2];
          w_ptr_sync[2]=w_ptr_sync[1];
          w_ptr_sync[1]=w_ptr_sync[0];
          w_ptr_sync[0]=w_ptr;
          
          exp_empty=(r_ptr==w_ptr_sync[3]);
          
          if(exp_empty!=r_trans.empty) begin 
            error_cnt++;
            $display("\nXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
            $display("X    [Time %4t] READ FLAG MISMATCH       X",$time);
            $display("X Expected Empty :  %b  |  Actual Empty :  %b  X",exp_empty,r_trans.empty);
            $display("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\n");
          end 
          
          //read previous reg
          if(exp_q.size()>0) begin
            exp_out=exp_q.pop_front();
            if(exp_out!==r_trans.data_out) begin
              error_cnt++;
              $display("\nXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
              $display("X    [Time %4t] DATA MISMATCH            X",$time);
              $display("X Expected Out   :  %3d                  X",exp_out);
              $display("X Actual Out     :  %3d                  X",r_trans.data_out);
              $display("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\n");
            end
          end
          
          //process current read reg
          if(r_trans.r_en&&!exp_empty) begin
            exp_q.push_back(mem[r_ptr%Depth]);
            r_ptr++;
          end
        end

        count++;

        if(count==transaction_cnt+2) begin
          verdict();
          count=0;
          error_cnt=0;
          ->done;
        end
      end
    join_none
  endtask

  //Final design status after all tests
  task verdict();
    $display("TEST COMPLETED :");
    $display("+----------------------------------------+");
    $display("|             DESIGN STATUS              |");
    $display("+----------------------------------------+");

    if(error_cnt==0) begin
      $display("| Asynchronous FIFO PASSED               |");
      total_tests_pass++;
    end
    else begin
      $display("| Asynchronous FIFO  FAILED              |");
      total_tests_fail++;
    end

    $display("| Total Errors = %0d                       |",error_cnt);
    $display("+----------------------------------------+\n\n");
  endtask

endclass
