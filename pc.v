module pc(rst,clk,out_pc);

input rst,clk;
output reg [7:0] out_pc;
always@(posedge clk or posedge rst)
begin
if(rst)
out_pc<=8'd0;

else out_pc<=out_pc+1;
end

endmodule