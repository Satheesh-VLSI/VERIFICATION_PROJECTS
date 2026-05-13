
//=======================
//    TESTBENCH TOP
//=======================
module tb_top;
  logic clk;
  initial clk=0;
  always #5 clk=~clk;
//INterface instantiation
  DECADE_CNT_INTERFACE inf(clk);
//DUT Instantiation
  Decade dut(.clk(inf.clk),
             .rst(inf.rst),
             .Q(inf.q));
//environment class call
  Environment env;

  initial begin
    
    env=new(inf);
    $display("==================================================================");
    $display("    SYNC DECADE COUNTER WITH SYNC RESET VERIFICATION STARTED");
    $display("==================================================================");
    env.test();
    #20;
    $finish;
  end
endmodule
