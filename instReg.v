module instReg (
    input clk,mem_active,
    input [7:0]addr,data,
    input done,
    output reg [7:0]out 
);
    reg [7:0]mem[255:0];

    always @(posedge done) begin
        mem[addr]= data;
    end
    always@(posedge mem_active) begin
        out = mem[addr];

    end

endmodule