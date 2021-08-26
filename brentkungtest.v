`timescale 1ps/1ps
module brentkungtest;
 // Inputs
 reg [31:0] a;
 reg [31:0] b;
 reg cin;
 // Outputs
 wire [31:0] sum;
wire cout;
wire [31:0] c;

 brentkung32 dut(a,b,cin ,sum,cout,c);
integer i;
 initial begin
  // Initialize Inputs

  a = 32'd14576884;
  b=32'd539574;
  cin=	1;
  
 end
  always begin
 

  
  #50 a = 32'd 27794585;
  b=32'd67769764;
  cin=0;
  #50 a =32'd 5734568;
 	 b=32'd90867565;
  	cin=1;
#50 a =32'b00111111111111111111111111111111;
	b=32'b00111111111111111111111111111111;
  cin=0;
  #50 a=32'd946878;
  	b=32'd4223357;
 	cin=1;

  
  
  
  // Add stimulus here
 end
 endmodule
      