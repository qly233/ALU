`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:54:20 04/12/2022 
// Design Name: 
// Module Name:    ALU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU(of,zf,A,B,ALU_OP,F);
	input[31:0] A,B;
	output reg[31:0] F;
	input[3:0] ALU_OP;
	output reg zf,of;
	
	reg[32:0] CF;
	reg[5:0] i;
	
	always@(ALU_OP or A or B)
	begin
		case(ALU_OP)
		4'b0000:begin CF = A&B;end
		4'b0001:begin CF = A|B;end
		4'b0010:begin CF = A^B;end
		4'b0011:begin CF = ~(A|B);end
		4'b0100:begin CF = A+B;end
		4'b0101:begin CF = A-B;end
		4'b0110:begin CF = (A<B);end
		4'b0111:begin CF = B<<A;end
		endcase
	
	F[31:0] = CF[31:0];
	
	zf = 0;
	for(i = 0;i < 32;i = i + 1)
		zf = zf|F[i];
	zf=~zf;
	of = CF[32];
	
	end
endmodule

module ABSW(AB_SW,A,B);
	input[2:0] AB_SW;
	output reg[31:0] A;
	output reg[31:0] B;
	
	always@(*)
	begin
		case(AB_SW)
			3'b000:begin A=32'h0000_0000; B=32'h0000_0000; end
			3'b001:begin A=32'h0000_0003; B=32'h0000_0607; end
			3'b010:begin A=32'h8000_0000; B=32'h8000_0000; end
			3'b011:begin A=32'h7FFF_FFFF; B=32'h7FFF_FFFF; end
			3'b100:begin A=32'hFFFF_FFFF; B=32'hFFFF_FFFF; end
			3'b101:begin A=32'h8000_0000; B=32'hFFFF_FFFF; end
			3'b110:begin A=32'hFFFF_FFFF; B=32'h8000_0000; end
			3'b111:begin A=32'h1234_5678; B=32'h3333_2222; end
			default:begin A=32'h9ABC_DEF0; B=32'h1111_2222; end
		endcase
	end
endmodule

module LEDSW(F_LED_SW,F,zf,of,LED);
	input[2:0] F_LED_SW;
	input[31:0] F;
	input zf,of;
	output reg[7:0] LED;
	
	always@(*)
	begin
		case(F_LED_SW)
			3'b000:LED=F[7:0];
			3'b001:LED=F[15:8];
			3'b010:LED=F[23:16];
			3'b011:LED=F[31:24];
			default:begin LED[7]=zf;LED[0]=of;LED[6:1]=6'b0;end
		endcase
	end
endmodule
			
module top(AB_SW,ALU_OP,F_LED_SW,LED);
	input[2:0] AB_SW;
	input[3:0] ALU_OP;
	input[2:0] F_LED_SW;
	output[7:0] LED;
	
	wire[31:0] A;
	wire[31:0] B;
	wire[31:0] F;
	wire zf,of;
	
	ABSW absw(AB_SW,A,B);
	ALU alu(of,zf,A,B,ALU_OP,F);
	LEDSW ledsw(F_LED_SW,F,zf,of,LED);
endmodule
