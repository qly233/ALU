`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:07:12 04/24/2022
// Design Name:   top
// Module Name:   D:/zuchengyuanli/ALU/test.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg [2:0] AB_SW;
	reg [3:0] ALU_OP;
	reg [2:0] F_LED_SW;

	// Outputs
	wire [7:0] LED;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.AB_SW(AB_SW), 
		.ALU_OP(ALU_OP), 
		.F_LED_SW(F_LED_SW), 
		.LED(LED)
	);

	initial begin
		// Initialize Inputs
		AB_SW = 0;
		ALU_OP = 0;
		F_LED_SW = 0;

		// Wait 100 ns for global reset to finish
		#100;
      AB_SW = 3'b000; ALU_OP=4'b0000;F_LED_SW=3'b000;
		#100;
      AB_SW = 3'b001; ALU_OP=4'b0001;F_LED_SW=3'b001;
		#100;
      AB_SW = 3'b010; ALU_OP=4'b0010;F_LED_SW=3'b010;
		#100;
      AB_SW = 3'b011; ALU_OP=4'b0011;F_LED_SW=3'b011;
		#100;
      AB_SW = 3'b100; ALU_OP=4'b0100;F_LED_SW=3'b100;
		#100;
      AB_SW = 3'b101; ALU_OP=4'b0101;F_LED_SW=3'b101;
		#100;
      AB_SW = 3'b110; ALU_OP=4'b0110;F_LED_SW=3'b110;
		#100;
      AB_SW = 3'b111; ALU_OP=4'b0111;F_LED_SW=3'b111;
		#100;
		// Add stimulus here

	end
      
endmodule

