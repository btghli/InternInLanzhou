module handle(
	clk,
	rst_n,
	num,
	result,
	);
 input clk;
 input rst_n;
 input [43:0]num;

 output [7:0] result;
 
 reg [7:0] result_reg;
 reg count;
 reg [43:0]shrift_reg;
 reg clka;

 ///////////计数部分/////
 always @(posedge clk or negedge rst_n) 
 begin
 	if (!rst_n) 
 	 count<=0;
 	 result_reg<=0;
 	 shrift_reg<=0;
 	
 	else if (count==12)
 	 count<=0;;////count<=0;
 	
 	else if (count==0)
 	shrift_reg[43:0]=num[43:0];
 	
 	else if (count<=12)
     count<=count+1;
     clka=~clka;
     case(shrift_reg[3:0])
      2'b0000: result_reg[7:0]=2'b00000000;
      2'b0001: result_reg[7:0]=2'b00000001;
      2'b0010: result_reg[7:0]=2'b00000010;
      2'b0011: result_reg[7:0]=2'b00000011;
      2'b0100: result_reg[7:0]=2'b00000100;
      2'b0101: result_reg[7:0]=2'b00000101;
      2'b0110: result_reg[7:0]=2'b00000110;
      2'b0111: result_reg[7:0]=2'b00000111;
      2'b1000: result_reg[7:0]=2'b00001000;
      2'b1001: result_reg[7:0]=2'b00001001;
     result[7:0]=result_reg[7:0];
     shrift_reg=shrift_reg>>4;
 end
//////////识别转化部分/////////////////
/*always @(posedge clk or negedge rst_n) 
begin
	if(!rst_n)
     	shrift_reg<=0;  
    else if (count==0) 
     	shrift_reg=num;
   	else if (count<=11)
      begin
      case(shrift_reg[3:0])
      2'b0000: result_reg[3:0]=0;
      2'b0001: result_reg[3:0]=1;
      2'b0010: result_reg[3:0]=2;
      2'b0011: result_reg[3:0]=3;
      2'b0100: result_reg[3:0]=4;
      2'b0101: result_reg[3:0]=5;
      2'b0110: result_reg[3:0]=6;
      2'b0111: result_reg[3:0]=7;
      2'b1000: result_reg[3:0]=8;
      2'b1001: result_reg[3:0]=9;
      result[7:0]=result_reg[7:0];
      shrift_reg=shrift_reg>>4;
      end
      */
endmodule
 