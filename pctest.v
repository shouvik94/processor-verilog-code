// Code your testbench here
// or browse Examples
module test ;
wire [7:0]out_pc;
reg clk,rst,inc_pc;

pc P(rst,clk,out_pc);

initial begin
    $dumpfile("GTK.vcd");
    $dumpvars(1,test);
end

initial begin
    rst = 1;
    clk = 1;
   #1 rst = 0;clk = 0;
  #5 clk = 1; #1 clk = 0;
  
end


initial #10 $finish;

endmodule