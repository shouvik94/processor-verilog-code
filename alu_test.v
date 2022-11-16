//`timescale 1ns / 1ps

module alu_t;
  
  reg [3:0] opcode;
  reg [7:0] operand_A;
  reg [7:0] operand_B;
  reg [7:0] memory_address;
  
  wire [7:0] result;
  wire [2:0] flag;
  
  alu a(opcode,operand_A,operand_B,memory_address,result,flag);
  
  initial begin
    $dumpfile("GTK.vcd");
    $dumpvars(1,alu_t);
  end
  
  initial begin
    
    opcode=4'b0100;operand_A=8'b00000010;operand_B=8'b00100111;
    #2opcode=4'b1000;operand_A=8'b00010010;operand_B=8'b00110111;
    #2opcode=4'b0100;operand_A=8'b00000010;operand_B=8'b11111111;
    #2opcode=4'b0111;operand_A=8'b10010010;operand_B=8'b10010010;
        #2opcode=4'b1000;operand_A=8'b00010010;operand_B=8'b00110111;
    
  end
  initial #10 $finish;
endmodule