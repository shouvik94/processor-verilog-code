module t_m;
	reg [143:0] a,b;
    wire [143:0] r;
    reg [15:0] matC [2:0][2:0];
    m m1(a,b,r);
    initial
        begin
        //$dumpfile("test.vcd");
        //$dumpvars(0,t_m);
        a={16'd9,16'd8,16'd7,16'd6,16'd5,16'd4,16'd3,16'd2,16'd1};
        b={16'd1,16'd9,16'd8,16'd7,16'd6,16'd5,16'd4,16'd3,16'd2};
        //$monitor
        end
endmodule