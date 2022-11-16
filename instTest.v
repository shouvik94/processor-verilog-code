module test ;
    reg [7:0] addr,data;
    reg done,clk,mem_active;
    wire[7:0] out;

    instReg R(clk,mem_active,addr,data,done,out);

    initial begin
        $dumpfile("GTK.vcd");
        $dumpvars(1,test);
    end

    initial begin
        clk = 0;
        #1 clk = ~clk;
    end


    initial begin
        addr = 8'b00000001; data = 8'b00000110; done = 1; #1 done = 0;
        #1 addr = 8'b00000000; data = 8'b00000010; done = 1; #1 done = 0;
        #1 addr = 8'b00000001; mem_active = 1;
    end
endmodule