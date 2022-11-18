module control (
    input clk,rst,
    input [0:2]flag,
    input [7:0]instruction,aluRes,mem_word,reg_out,
    output reg mem_active,alu_on,reg_rst,reg_write,mem_enable,mem_write,pc_clk,
    output reg [7:0]opA,opB,reg_data,mem_addr,bus_1,
    output reg [3:0]opcode,
    output reg [1:0]reg_addr
   );

    assign opcode=instruction[7:4];

    reg [7:0] address,data;
    reg [2:0] p_state,n_state;
    reg [1:0] rd,rs;

    parameter[1:0]fetch1=2'b00;
    parameter[1:0]fetch2=2'b01;
    parameter[1:0]execute=2'b10;
    parameter[1:0]store=2'b11;

    always@(posedge clk or posedge rst)
	begin
        pc_clk=0;
		if(rst)
			p_state<=fetch1;
		else
			p_state<=n_state;
	end 

    always @(*) begin
       case (p_state)
        fetch1:
        begin
            mem_active=1;

            n_state=fetch2;
        end
            

        
        fetch2:
        begin
            case(opcode)
            4'b0000:begin
                address[3:0]<=instruction[3:0];
                case (instruction[3])
                    1'b1: address[7:4]=4'b1111;
                    1'b0: address[7:4]=4'b0000;                
                endcase
                mem_write=0;
                mem_addr<=address;
                data<=mem_word;
                n_state=store;
            end
              4'b0001:begin
                reg_write=0;
                reg_addr=2'b00;
                data<=reg_out;
                n_state=store;
                
            end
             4'b0011:begin
                 rd=instruction[3:2];
	             rs=instruction[1:0];
                 reg_write=0;
                 reg_addr=rs;
                 data=reg_out;
                 n_state=store;
            end
             4'b0010:begin
                 rd=instruction[3:2];
	              data[1:0]<=instruction[1:0];
                case (instruction[1])
                    1'b1: data[7:2]=6'b111111;
                    1'b0: data[7:2]=6'b000000;                
                endcase
                n_state=store;
                 
            end
            /* 4'b0100:begin
                 rd=instruction[3:2];
	             rs=instruction[1:0];
                 reg_write=0;
                 reg_addr=rs;
                 
            end
            */

            endcase
        end
        //execute:
        store:
         begin
            case(opcode)
            4'b0000:begin
                reg_write=1;
                reg_addr=2'b00;
                reg_data=data;
                n_state=fetch1;
                pc_clk=1;
            end
            4'b0001:begin
             address[3:0]<=instruction[3:0];
                case (instruction[3])
                    1'b1: address[7:4]=4'b1111;
                    1'b0: address[7:4]=4'b0000;                
                endcase
                mem_addr<=address;
                bus_1<=data;
                mem_write<=1;
                n_state=fetch1;
                pc_clk=1;
            end
             4'b0011:begin
                
                 reg_write=1;
                 reg_addr=rd;
                 reg_data<=data;

                 n_state=fetch1;
                pc_clk=1;
            end
             4'b0010:begin
                 
	            reg_write=1;
                reg_addr=rd;
                reg_data=data;
                n_state=fetch1;
                pc_clk=1;
                 
            end
         

            endcase
        end
       endcase
    end
    
endmodule