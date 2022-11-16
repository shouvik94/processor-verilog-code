module test;
    reg [1:0]addr;
    reg [7:0]data;
    reg write,rst;
    wire [7:0]out;

    registers R(addr,data,rst,write,out);
    initial begin
        $dumpfile("GTK.vcd");
        $dumpvars(1,test);
    end

    initial begin
        addr = 2'b11;
        data = 9'b00000110;
        rst = 1;
        write=0;
        #1 rst = ~rst;
        write=~write;
        #1 write=~write;
        #1 write=~write;
        #1 write=~write;
        #1 write=~write;
    end

    
endmodule