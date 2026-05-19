//===========================
//      TESTBENCH TOP
//===========================
module tb_top;

  logic clk;

  initial clk=0;

  always #5 clk=~clk;

  FIFO_INTERFACE inf(clk);
  
  basic_test                         TEST1;
  full_write_read_test               TEST2;
  pointer_wrap_around_test           TEST3;
  overflow_underflow_test            TEST4;
  concurrent_boundary_collision_test TEST5;
  continues_concurrent_test          TEST6;

  Sync_FIFO #(8,16) fifo(.clk(clk),
                         .rst(inf.rst),
                         .full(inf.full),
                         .empty(inf.empty),
                         .data_in(inf.data_in),
                         .data_out(inf.data_out),
                         .w_en(inf.w_en),
                         .r_en(inf.r_en));

  initial begin
    
    $display("\n                                       =================================================================================");
    $display("                                       ||                                                                             ||");
    $display("                                       ||                  SYNCHRONOUS FIFO VERIFICATION STARTED                      ||");
    $display("                                       ||                                                                             ||");
    $display("                                       =================================================================================\n");

    TEST1=new(inf);
    TEST1.run_reset();
    TEST1.run_test();
    
    
    TEST2=new(inf);
    TEST2.run_reset();
    TEST2.run_test();
   
    
    TEST3=new(inf);
    TEST3.run_reset();
    TEST3.run_test();
    
    
    TEST4=new(inf);
    TEST4.run_reset();
    TEST4.run_test();
    
    
    
    TEST5=new(inf);
    TEST5.run_reset();
    TEST5.run_test();
    
    
    TEST6=new(inf);
    TEST6.run_reset();
    TEST6.run_test();
    
    
    $display("\n\n");
    $display("    ################################################################");
    $display("    ##                                                            ##");
    $display("    ##                FINAL   SIMULATION   REPORT                 ##");
    $display("    ##                                                            ##");
    $display("    ################################################################");
    $display("    ##                                                            ##");
    $display("    ##     Total Tests Executed : %2d                              ##", Scoreboard#(8,16)::total_tests_pass + Scoreboard#(8,16)::total_tests_fail);
    $display("    ##     Total Tests PASSED   : %2d                              ##", Scoreboard#(8,16)::total_tests_pass);
    $display("    ##     Total Tests FAILED   : %2d                              ##", Scoreboard#(8,16)::total_tests_fail);
    $display("    ##                                                            ##");
    $display("    ################################################################");
    
    if (Scoreboard#(8,16)::total_tests_fail == 0) begin
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
    $finish;
  end
endmodule
