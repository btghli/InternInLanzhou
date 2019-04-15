module top();

input num;
reg [43:0]num_rec;
reg [7:0] num_han;
output LEDG0;
output LEDG1;
output LEDG2;
output LEDG3;


rec
(
	.num(ain),
	.num_rec(result)
	);

handle
(
	.num_rec(num),
	.num_han(result)
	);

show
(
	.num_han(ain),
	.LEDG0(q),
	.LEDG1(w),
	.LEDG2(e),
	.LEDG3(r),
	);

endmodule



