module rec(
	clk,
	ain,
	rst,
	result,
	);
 
 input clk;
 input rst;
 input ain;

 output [43:0]result;

 reg count;
 reg [44:0]result_reg;
 reg [43:0] result;

initial
    begin   
 		result_reg<=0;
 		count<=0;
    end 
 always @(posedge clk or negedge rst)
        if (!rst)
         begin
 		     result_reg<=0;
 		     count<=0;	
         end 
 	      else if (count<44&&ain==1) 
          begin
 		      result_reg[0] <=1 ;
 	        result_reg<=result_reg<<1;
          count<=count+1;
          end
 	      else if (count<44&&ain==0) 
           begin
 	         result_reg[0] <=0 ;
 	         result_reg<=result_reg<<1;
           count<=count+1;
           end
 	       else if (count==44)   
            result[43:0]=result_reg[44:1];    //全部receive完成，输出
  endmodule
 /*result=result<<1;
 count<=count+1;

 /*
 always @(ain or negedge rst) begin
 	if (!rst) begin
 		ain<=0;
 		aout<=0;// reset
 		result<=0;
 		count<=0;
 	 end
 	else if (ain>0)begin
 	   assign aout = 1;
       assign result[1:0] =aout ;
       result=result<<1;
       count<=count+1;	
 	end
 	else if (ain=0) begin
 	   assign aout = 0;
 	   assign result[1:0] =aout ;
 	   result=result<<1;
 	   count<=count+1;
 	end
 	else if (count==44) begin //输出显示
 	
 	end
 end
 */


