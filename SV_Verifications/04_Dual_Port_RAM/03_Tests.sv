//========================
//        TEST
//========================
class basic_test;

  Environment env;

  function new(virtual RAM_INTERFACE inf);
    env=new(inf);
  endfunction

  task run_test();

    $display("                                                 ============================================================");
    $display("                                                 |----------------- RUNNING RANDOMIZED  TEST ---------------|");
    $display("                                                 ============================================================");
    
    //random tests
    env.gen.transaction_cnt=64;
    env.scr.transaction_cnt=64;
    env.scr.skip_en=0;

    env.test();

    $display("=========================================================================================================================================================================================");
    $display("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    $display("=========================================================================================================================================================================================");

  endtask

endclass

class full_write_read extends basic_test;

  function new(virtual RAM_INTERFACE inf);
    super.new(inf);
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

class collision_test extends basic_test;

  function new(virtual RAM_INTERFACE inf);
    super.new(inf);
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

