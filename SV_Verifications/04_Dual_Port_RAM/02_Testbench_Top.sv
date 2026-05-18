
//===========================
//      TESTBENCH TOP
//===========================
module tb_top;

  logic clk;

  initial clk=0;

  always #5 clk=~clk;

  RAM_INTERFACE inf(clk);

  basic_test base;
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

    inf.rst=1;

    #20;
    inf.rst=0;

    $display("\n                                       =================================================================================");
    $display("                                       ||                                                                             ||");
    $display("                                       ||                   DUAL PORT RAM VERIFICATION STARTED                        ||");
    $display("                                       ||                                                                             ||");
    $display("                                       =================================================================================\n");

    base=new(inf);
    base.run_test();

    inf.rst=1;
    #20;
    inf.rst=0;

    wr_test=new(inf);
    wr_test.run_test();

    inf.rst=1;
    #20;
    inf.rst=0;

    collision=new(inf);
    collision.run_test();

    #20;
    $finish;

  end

endmodule
