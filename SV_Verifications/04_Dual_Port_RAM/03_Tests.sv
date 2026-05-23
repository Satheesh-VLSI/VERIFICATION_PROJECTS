//========================
//        TEST
//========================
class basic_test;

  Environment env;

  function new(virtual RAM_INTERFACE inf,string name);
    env=new(inf,name);
  endfunction
  
  task reset();
    env.reset_system();
  endtask

  task run_test();

    $display("                                                 ============================================================");
    $display("                                                 |----------------- RUNNING RANDOMIZED  TEST ---------------|");
    $display("                                                 ============================================================");
    
    //random tests
    
    env.gen.test_name="RANDOM";
    env.gen.transaction_cnt=2000;
    env.scr.transaction_cnt=2000;
    env.scr.skip_en=0;

    env.test();

    $display("=========================================================================================================================================================================================");
    $display("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    $display("=========================================================================================================================================================================================");

  endtask

endclass
        
//========================
//     RESET TEST
//========================     
class reset_test extends basic_test;

  function new(virtual RAM_INTERFACE inf,string name);
    super.new(inf,name);
  endfunction

  task run_test();
    $display("                                           ============================================================");
    $display("                                           |-------------- RUNNING FULL WRITE-READ  TEST -------------|");
    $display("                                           ============================================================");

    $display("---------------------------------");
    $display("     RUNNING RESET TEST");
    $display("---------------------------------");

    env.gen.test_name="RESET";
    env.gen.transaction_cnt=500;
    env.scr.transaction_cnt=500;
    env.scr.skip_en=0;
    env.test();

    $display("=========================================================================================================================================================================================");
    $display("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    $display("=========================================================================================================================================================================================");

  endtask

endclass

//========================
//  FULL Read-Write TEST
//========================  
class full_write_read extends basic_test;

  function new(virtual RAM_INTERFACE inf,string name);
    super.new(inf,name);
  endfunction

  task run_test();
    $display("                                           ============================================================");
    $display("                                           |-------------- RUNNING FULL WRITE-READ  TEST -------------|");
    $display("                                           ============================================================");

    $display("---------------------------------");
    $display("     RUNNING FULL WRITE TEST");
    $display("---------------------------------");

    env.gen.test_name="FULL WRITE";
    env.gen.transaction_cnt=64;
    env.scr.transaction_cnt=64;
    env.scr.skip_en=0;
    env.test();

    $display("*****************************************************************************************************************************************************************************************");

    $display("---------------------------------");
    $display("     RUNNING FULL Read TEST ");
    $display("---------------------------------");

    env.gen.test_name="FULL READ";
    env.gen.transaction_cnt=64;
    env.scr.transaction_cnt=64;
    env.scr.skip_en=1;
    env.test();

    $display("=========================================================================================================================================================================================");
    $display("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    $display("=========================================================================================================================================================================================");

  endtask

endclass

//========================
//    COLLISION TEST
//========================  

class collision_test extends basic_test;

  function new(virtual RAM_INTERFACE inf,string name);
    super.new(inf,name);
  endfunction

  task run_test();

    $display("                                              ============================================================");
    $display("                                              |----------------- RUNNING COLLISION TEST -----------------|");
    $display("                                              ============================================================");

    $display("------------------------------");
    $display("    Write-Write Collision");
    $display("------------------------------");

    env.gen.test_name="COLLISION_WW";
    env.gen.transaction_cnt=64;
    env.scr.transaction_cnt=64;
    env.scr.skip_en=0;
    env.test();

    $display("*****************************************************************************************************************************************************************************************");

    $display("------------------------------");
    $display("     Read-Write Collision");
    $display("------------------------------");

    env.gen.test_name="COLLISION_RW";
    env.gen.transaction_cnt=64;
    env.scr.transaction_cnt=64;
    env.scr.skip_en=1;
    env.test();

    $display("*****************************************************************************************************************************************************************************************");

    $display("------------------------------");
    $display("    Write-Read Collision");
    $display("------------------------------");

    env.gen.test_name="COLLISION_WR";
    env.gen.transaction_cnt=64;
    env.scr.transaction_cnt=64;
    env.scr.skip_en=1;
    env.test();

    $display("------------------------------");
    $display("     Read-Read Collision");
    $display("------------------------------");

    env.gen.test_name="COLLISION_RR";
    env.gen.transaction_cnt=64;
    env.scr.transaction_cnt=64;
    env.scr.skip_en=1;
    env.test();

    $display("*****************************************************************************************************************************************************************************************");

    $display("------------------------------");
    $display("      Mixed Collision");
    $display("------------------------------");

    env.gen.test_name="COLLISION_MIXED";
    env.gen.transaction_cnt=64;
    env.scr.transaction_cnt=64;
    env.scr.skip_en=1;
    env.test();

    $display("=========================================================================================================================================================================================");
    $display("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    $display("=========================================================================================================================================================================================");

  endtask

endclass
        
        
//===========================
//      TESTBENCH TOP
//===========================
module tb_top;
