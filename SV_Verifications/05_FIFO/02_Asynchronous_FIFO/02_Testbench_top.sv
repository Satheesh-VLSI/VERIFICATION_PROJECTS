`include "interface.sv"
`include "Transaction.sv"


`include "write_generator.sv"
`include "read_generator.sv"


`include "write_driver.sv"
`include "read_driver.sv"

`include "write_monitor.sv"
`include "read_monitor.sv"

`include "Coverage.sv"
`include "scoreboard.sv"

`include "write_agent.sv"
`include "read_agent.sv"



`include "environment.sv"
`include "tests.sv"
    
//===========================
//      TESTBENCH TOP
//===========================
module tb_top;

  logic w_clk,r_clk;

  initial begin w_clk=0;r_clk=0;end

  always #7 w_clk=~w_clk;

  always #10 r_clk=~r_clk;

  FIFO_INTERFACE inf(w_clk,r_clk);
  
  basic_test                         TEST1;
  full_write_read_test               TEST2;
  pointer_wrap_around_test           TEST3;
  overflow_underflow_test            TEST4;
  concurrent_boundary_collision_test TEST5;
  continues_concurrent_test          TEST6;
  reset_test                         TEST7;

  Async_FIFO #(8,32) fifo(.w_clk(w_clk),
                          .r_clk(r_clk),
                          .r_rst(inf.r_rst),
                          .w_rst(inf.w_rst),
                          .w_en(inf.w_en),
                          .r_en(inf.r_en),
                          .d_in(inf.data_in),
                          .d_out(inf.data_out),
                          .full(inf.full),
                          .empty(inf.empty));

  initial begin
    
    $display("\n                                       =================================================================================");
    $display("                                       ||                                                                             ||");
    $display("                                       ||                  ASYNCHRONOUS FIFO VERIFICATION STARTED                      ||");
    $display("                                       ||                                                                             ||");
    $display("                                       =================================================================================\n");

    TEST1=new(inf,"\n========================================================================================\n	RANDOM\n========================================================================================");
    TEST1.run_reset();
    TEST1.run_test();
    
    
    TEST2=new(inf,"\n========================================================================================\n	Full_Read_Write\n========================================================================================");
    TEST2.run_reset();
    TEST2.run_test();
   
    
    TEST3=new(inf,"\n========================================================================================\n	Pointer_Wrap_Around\n========================================================================================");
    TEST3.run_reset();
    TEST3.run_test();
    
    
    TEST4=new(inf,"\n========================================================================================\n	OVERFLOW_UNDERFLOW\n========================================================================================");
    TEST4.run_reset();
    TEST4.run_test();
    
    
    
    TEST5=new(inf,"\n========================================================================================\n	Concurrent_Boundary_Collision\n========================================================================================");
    TEST5.run_reset();
    TEST5.run_test();
    
    
    TEST6=new(inf,"\n========================================================================================\n	Continues_Concurrent\n========================================================================================");
    TEST6.run_reset();
    TEST6.run_test();
    
    
    TEST7=new(inf,"\n========================================================================================\n	RESET test\n========================================================================================");
    TEST7.run_reset();
    TEST7.run_test();
    
    
    $display("\n\n");
    $display("    ################################################################");
    $display("    ##                                                            ##");
    $display("    ##                FINAL   SIMULATION   REPORT                 ##");
    $display("    ##                                                            ##");
    $display("    ################################################################");
    $display("    ##                                                            ##");
    $display("    ##     Total Tests Performed : %2d                             ##", Scoreboard#(8,32)::total_tests_pass + Scoreboard#(8,32)::total_tests_fail);
    $display("    ##     Total Tests PASSED    : %2d                             ##", Scoreboard#(8,32)::total_tests_pass);
    $display("    ##     Total Tests FAILED    : %2d                             ##", Scoreboard#(8,32)::total_tests_fail);
    $display("    ##                                                            ##");
    $display("    ################################################################");
    
    if (Scoreboard#(8,32)::total_tests_fail == 0) begin
      $display("    ##                                                            ##");
      $display("    ##                 D E S I G N   P A S S E D                  ##");
      $display("    ##                                                            ##");
    end else begin  
      $display("    ##                                                            ##");
      $display("    ##                 D E S I G N   F A I L E D                  ##");
      $display("    ##                                                            ##");
    end
    
    $display("    ################################################################");

    #20;
    $stop;
  end
endmodule
