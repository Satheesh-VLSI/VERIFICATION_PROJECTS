//========================
//        TEST
//========================
class basic_test;

  Environment env;
  

  function new(virtual FIFO_INTERFACE inf);
    env=new(inf);
  endfunction

  task run_reset();
    env.reset_system();
  endtask
  task run_test();

    $display("                                                 ============================================================");
    $display("                                                 |----------------- RUNNING RANDOMIZED  TEST ---------------|");
    $display("                                                 ============================================================");
    
    //random tests
    env.gen.test_name="RANDOM";
    env.gen.transaction_cnt=100;
    env.scr.transaction_cnt=100;
    env.test();

    $display("=============================================================================================================================================================================");
    $display("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    $display("=============================================================================================================================================================================");


  endtask

endclass

        

class full_write_read_test extends basic_test;

  function new(virtual FIFO_INTERFACE inf);
    super.new(inf);
  endfunction

  task run_test();
    $display("                                           ============================================================");
    $display("                                           |-------------- RUNNING FULL WRITE-READ  TEST -------------|");
    $display("                                           ============================================================");

    $display("===================================");
    $display("     RUNNING FULL WRITE TEST");
    $display("===================================");

    env.gen.test_name="FULL_WRITE";
    env.gen.transaction_cnt=16;
    env.scr.transaction_cnt=16;
    env.test();

    $display("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
 

    $display("===================================");
    $display("     RUNNING FULL Read TEST ");
    $display("===================================");

    env.gen.test_name="FULL_READ";
    env.gen.transaction_cnt=16;
    env.scr.transaction_cnt=16;
    env.test();

    $display("=============================================================================================================================================================================");
    $display("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    $display("=============================================================================================================================================================================");


  endtask

endclass
        
class pointer_wrap_around_test extends basic_test;

  function new(virtual FIFO_INTERFACE inf);
    super.new(inf);
  endfunction

  task run_test();
    $display("                                           ============================================================");
    $display("                                           |------------- RUNNING POINTER WRAP AROUND TEST -----------|");
    $display("                                           ============================================================");
    

    env.gen.test_name="WRAP_AROUND";
    env.scr.transaction_cnt=60;
    env.test();

    $display("=============================================================================================================================================================================");
    $display("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    $display("=============================================================================================================================================================================");

  endtask

endclass
        
                
class overflow_underflow_test extends basic_test;

  function new(virtual FIFO_INTERFACE inf);
    super.new(inf);
  endfunction

  task run_test();
    $display("                                           ============================================================");
    $display("                                           |------------- RUNNING OVERFLOW-UNDERFLOW TEST -----------|");
    $display("                                           ============================================================");

    $display("                                                      ===================================");
    $display("                                                            RUNNING OVERFLOW TEST");
    $display("                                                      ===================================");
    env.gen.test_name="OVERFLOW";
    env.gen.transaction_cnt=25;
    env.scr.transaction_cnt=25;
    env.test();
    
     $display("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
 
    
    $display("                                                     ===================================");
    $display("                                                           RUNNING UNDERFLOW TEST");
    $display("                                                     ===================================");
    env.gen.test_name="UNDERFLOW";
    env.gen.transaction_cnt=25;
    env.scr.transaction_cnt=25;
    env.test();

    $display("=============================================================================================================================================================================");
    $display("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    $display("=============================================================================================================================================================================");


  endtask


endclass
        
        
                        
class concurrent_boundary_collision_test extends basic_test;

  function new(virtual FIFO_INTERFACE inf);
    super.new(inf);
  endfunction

  task run_test();
    $display("                                           ============================================================");
    $display("                                           |------------- RUNNING CONCURRENT BOUNDARY TEST -----------|");
    $display("                                           ============================================================");

    env.gen.test_name="CONCURRENT_BOUNDARY";
    env.gen.transaction_cnt=50;
    env.scr.transaction_cnt=50;
    env.test();

    $display("=============================================================================================================================================================================");
    $display("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    $display("=============================================================================================================================================================================");


  endtask


endclass
        
class continues_concurrent_test extends basic_test;

  function new(virtual FIFO_INTERFACE inf);
    super.new(inf);
  endfunction

  task run_test();
    $display("                                           ============================================================");
    $display("                                           |------------- RUNNING CONTINUES CONCURRENT  TEST ----------|");
    $display("                                           ============================================================");

    env.gen.test_name="CONTINUES_CONCURRENT";
    env.gen.transaction_cnt=100;
    env.scr.transaction_cnt=100;
    env.test();

    $display("=============================================================================================================================================================================");
    $display("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    $display("=============================================================================================================================================================================");


  endtask

endclass




  
