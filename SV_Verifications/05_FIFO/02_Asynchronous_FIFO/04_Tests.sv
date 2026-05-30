    
//========================
//         TEST
//========================
class basic_test;

  Environment env;
  

  function new(virtual FIFO_INTERFACE inf,string name);
    env=new(inf,name);
  endfunction

  task run_reset();
    env.reset_system();
  endtask
  
  task run_test();

    $display("                                          ============================================================");
    $display("                                          |----------------- RUNNING RANDOMIZED  TEST ---------------|");
    $display("                                          ============================================================");
    
    env.test("RANDOM",200);

    $display("=========================================================================================================================================================================================");
    $display("=========================================================================================================================================================================================");

  endtask

endclass

        

class full_write_read_test extends basic_test;

  function new(virtual FIFO_INTERFACE inf,string name);
    super.new(inf,name);
  endfunction

  task run_test();
    $display("                                           ============================================================");
    $display("                                           |-------------- RUNNING FULL WRITE-READ  TEST -------------|");
    $display("                                           ============================================================");

    $display("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    $display("  RUNNING FULL WRITE TEST.... ");
    $display("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");

    env.test("FULL_WRITE",32);

    $display("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");

    $display("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    $display("   RUNNING FULL Read TEST.... ");
    $display("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");

    env.test("FULL_READ",32);

    $display("=========================================================================================================================================================================================");
    $display("=========================================================================================================================================================================================");

  endtask

endclass
        
class pointer_wrap_around_test extends basic_test;

  function new(virtual FIFO_INTERFACE inf,string name);
    super.new(inf,name);
  endfunction

  task run_test();
    $display("                                           ============================================================");
    $display("                                           |------------- RUNNING POINTER WRAP AROUND TEST -----------|");
    $display("                                           ============================================================");
    

    env.test("WRAP_AROUND",160);

    $display("=========================================================================================================================================================================================");
    $display("=========================================================================================================================================================================================");

  endtask

endclass
        
                
class overflow_underflow_test extends basic_test;

  function new(virtual FIFO_INTERFACE inf,string name);
    super.new(inf,name);
  endfunction

  task run_test();
    $display("                                           ============================================================");
    $display("                                           |------------- RUNNING OVERFLOW-UNDERFLOW TEST -----------|");
    $display("                                           ============================================================");

    $display("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    $display("   RUNNING OVERFLOW TEST.....");
    $display("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
 
    env.test("OVERFLOW",40);
    
     $display("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    
    $display("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    $display("   RUNNING UNDERFLOW TEST....");
    $display("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");

    
    env.test("UNDERFLOW",40);

    $display("=========================================================================================================================================================================================");
    $display("=========================================================================================================================================================================================");

  endtask


endclass
        
        
                        
class concurrent_boundary_collision_test extends basic_test;

  function new(virtual FIFO_INTERFACE inf,string name);
    super.new(inf,name);
  endfunction

  task run_test();
    $display("                                           ============================================================");
    $display("                                           |------------- RUNNING CONCURRENT BOUNDARY TEST -----------|");
    $display("                                           ============================================================");

    env.test("CONCURRENT_BOUNDARY",150);

    $display("=========================================================================================================================================================================================");
    $display("=========================================================================================================================================================================================");

  endtask


endclass
        
class continues_concurrent_test extends basic_test;

  function new(virtual FIFO_INTERFACE inf,string name);
    super.new(inf,name);
  endfunction

  task run_test();
    $display("                                           ============================================================");
    $display("                                           |------------- RUNNING CONTINUES CONCURRENT  TEST ----------|");
    $display("                                           ============================================================");

    env.test("CONTINUES_CONCURRENT",200);

    $display("=========================================================================================================================================================================================");
    $display("=========================================================================================================================================================================================");

  endtask


endclass


class reset_test extends basic_test;

  function new(virtual FIFO_INTERFACE inf,string name);
    super.new(inf,name);
  endfunction

  task run_test();
    $display("                                           ============================================================");
    $display("                                           |------------- RUNNING RESET TEST ----------|");
    $display("                                           ============================================================");
    fork
      begin
    env.test("RESET_TEST",200);
      end
      
      begin 
        repeat(10)begin
          #($urandom_range(200,2500));
          env.reset_system();
          #($urandom_range(20,25));
        end
      end 
    join

    $display("=========================================================================================================================================================================================");
    $display("=========================================================================================================================================================================================");

  endtask


endclass
