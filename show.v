module show(clk,ain,q,w,e,r);

input [7:0]ain;
output q,w,e,r;

reg [7:0]aout;

always @(posedge clk or negedge rst) begin
	if (!rst) begin
		aout<=0;
	end
	else begin
	aout[7:0]=ain[7:0];	
	end
end
assign q = aout[3];
assign w = aout[2];
assign e = aout[1];
assign r = aout[0];  

endmodule