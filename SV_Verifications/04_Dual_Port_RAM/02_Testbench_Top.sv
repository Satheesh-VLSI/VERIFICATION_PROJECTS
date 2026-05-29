b_top;

  logic clk;

  initial clk=0;

  always #5 clk=~clk;

  RAM_INTERFACE inf(clk);

  basic_test base;
  reset_test r_test;
  full_write_read wr_test;
  collision_test collision;

  dual_port_RAM ram1 (.data_in_A(inf.data_in_A),
                      .data_in_B(inf.data_in_B),
                      .addr_A(inf.addr_A),
                      .addr_B(inf.addr_B),
                      .mode_A(inf.mode_A),
                      .mode_B(inf.mode_B),
                      .clk(inf.clk),
                      .rst(inf.rst),
                      .data_out_A(inf.data_out_A),
                      .data_out_B(inf.data_out_B)
  );

  initial begin
    inf.asrt_en=0;

    $display("\n                                       =================================================================================");
    $display("                                       ||                                                                             ||");
    $display("                                       ||                  DUAL PORT RAM VERIFICATION STARTED                         ||");
    $display("                                       ||                                                                             ||");
    $display("                                       =================================================================================\n");

    base=new(inf,"\n========================================================================================\n	RANDOMIZED TEST\n========================================================================================");
    
    base.reset();
    inf.asrt_en=1;
    base.run_test();
    
    
    r_test=new(inf,"\n========================================================================================\n	RESET TEST\n========================================================================================");
    base.reset();
    r_test.run_test();

 

    wr_test=new(inf,"\n========================================================================================\n	Full Read-Write TEST\n========================================================================================");
    base.reset();
    wr_test.run_test();


    collision=new(inf,"\n========================================================================================\n	COLLISION TEST\n========================================================================================");
    base.reset();
    collision.run_test();

    
    $stop;

  end
   


endmodule
