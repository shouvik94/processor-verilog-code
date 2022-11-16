module test ;
    reg [7:0]address,bus_1;
    reg write;
    wire [7:0] mem_word;

    Memory M(address,bus_1,write,mem_word);

    initial begin
        $dumpfile("GTK.vcd");
        $dumpvars(1,test);
    end

    initial begin
        write=1;
      #8 write = ~write;
      #2 write = ~write;
       
    end

     initial begin
        #2 address = 8'b00000001; bus_1 = 8'b00000110;
        #4 address = 8'b00000000; bus_1 = 8'b00000010;
        #2 address = 8'b00000001; 
    end


endmodule