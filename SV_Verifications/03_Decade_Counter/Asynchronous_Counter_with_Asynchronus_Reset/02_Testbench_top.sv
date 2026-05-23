
//=======================
//    TESTBENCH TOP
//=======================
module tb_top;
  logic clk;
  initial clk = 0;
  always #5 clk = ~clk;

  DECADE_CNT_INTERFACE inf(clk);

  Decade dut(
    .clk (inf.clk),
    .rst (inf.rst),
    .Q   (inf.q)
  );

  Environment env;

  initial begin
    
    $dumpfile("c.vcd");
    $dumpvars;
    env = new(inf);
    $display("==================================================================");
    $display("    ASYNC DECADE COUNTER VERIFICATION STARTED");
    $display("==================================================================");
    env.test();
    #20;
    $finish;
  end
endmodule
