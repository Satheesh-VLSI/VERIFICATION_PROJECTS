
//=======================
//    TESTBENCH TOP
//=======================
module tb_top;
  logic clk;
  initial clk=0;
  always #5 clk=~clk;

  DFF_INTERFACE inf(clk);

  d_ff dut(.d(inf.d),
           .clk(inf.clk),
           .rst(inf.rst),
           .q(inf.q));

  Environment env;

  initial begin
    $dumpfile("etho.vcd");
    $dumpvars();
    env=new(inf);
    $display("===========================================");
    $display("   DFF(SYNC RESET) VERIFICATION STARTED");
    $display("===========================================");
    env.test();
    #20;
    $finish;
  end
endmodule
