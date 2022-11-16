module registers(
input [1:0] addr,
input [7:0] data,
input rst,write,
output reg [7:0]out

    );
    
    reg [7:0] rA;
    reg [7:0] rB;
    reg [7:0] rC;
    reg [7:0] rD;
    
    always @(*)
   
    begin
        if (rst) begin
            case(addr)
            2'b00:rA=8'b00000000;
            2'b01:rB=8'b00000000;
            2'b10:rC=8'b00000000;
            2'b11:rD=8'b00000000;
            endcase

        end
        else if (write) begin
            case(addr)
            2'b00:rA=data;
            2'b01:rB=data;
            2'b10:rC=data;
            2'b11:rD=data;
            endcase

        end
        else begin
         case(addr)
            2'b00:out = rA;
            2'b01:out = rB;
            2'b10:out = rC;
            2'b11:out = rD;
        endcase
        end
           
         
    end
endmodule