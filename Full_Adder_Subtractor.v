module FullAdder1Bit(sum,carry,a,b,cin);
input a,b,cin;
output sum,carry;
wire s1,c1,c2;

xor(s1,a,b);
xor(sum,s1,cin);

and(c1,a,b);
and (c2,s1,cin);
xor(carry,c1,c2);
endmodule

module FullAdder4Bit(sum,carry,a,b,cin);
input [3:0] a,b;
input cin;
output [3:0] sum;
output carry;
wire c1,c2,c3;
FullAdder1Bit f1(sum[0],c1,a[0],b[0],cin);
FullAdder1Bit f2(sum[1],c2,a[1],b[1],c1);
FullAdder1Bit f3(sum[2],c3,a[2],b[2],c2);
FullAdder1Bit f4(sum[3],carry,a[3],b[3],c3);
endmodule

module FourBit_Adder_Subtractor(ans,carry,a,b,cin);
input [3:0] a,b;
input cin;
output [3:0] ans;
output carry;
wire [3:0] in_B;

xor(in_B[0],b[0],cin);
xor(in_B[1],b[1],cin);
xor(in_B[2],b[2],cin);
xor(in_B[3],b[3],cin);
FullAdder4Bit adder_subtractor(ans,carry,a,in_B,cin);
endmodule 

module Sim1bitAdder;
reg a,b,cin;
wire sum,carry;
FullAdder1Bit adder1(sum,carry,a,b,cin);
initial 
begin 
#5 a = 0; b = 0; cin = 0;

#100 a = 0; b = 1; cin = 0;

#100 a = 1; b = 0; cin = 0;

#100 a = 1; b = 1; cin = 0;
end
endmodule 

module Sim4BitAdder;
reg [3:0] a,b;
reg cin;
wire [3:0] sum;
wire carry;
FullAdder4Bit fulladder(sum,carry,a,b,cin);
initial 
begin
#5 a = 4'd8; b = 4'd4; cin = 1'b0;

#100 a = 4'd6; b = 4'd4; cin = 1'b0;

#100 a = 4'd3; b = 4'd2; cin = 1'b0;

#100 a = 4'd8; b = 4'd7; cin = 1'b0;

#100 a = 4'd0; b = 4'd0; cin = 1'b0;

#100 a = 4'd4; b = 4'd3; cin = 1'b0;
end
endmodule


module sim_Adder_Subtractor;
reg [3:0] a,b;
reg cin;
wire [3:0] ans;
wire carry;
FourBit_Adder_Subtractor fas(ans,carry,a,b,cin);
initial 
begin 
#5 a = 4'd8; b = 4'd4; cin = 1'b0;

#100 a = 4'd6; b = 4'd4; cin = 1'b0;

#100 a = 4'd3; b = 4'd2; cin = 1'b0;

#100 a = 4'd8; b = 4'd7; cin = 1'b0;

#100 a = 4'd0; b = 4'd0; cin = 1'b0;

#100 a = 4'd4; b = 4'd3; cin = 1'b0;

#100 a = 4'd8; b = 4'd4; cin = 1'b1;

#100 a = 4'd6; b = 4'd4; cin = 1'b1;

#100 a = 4'd3; b = 4'd2; cin = 1'b1;

#100 a = 4'd8; b = 4'd7; cin = 1'b1;

#100 a = 4'd0; b = 4'd0; cin = 1'b1;

#100 a = 4'd4; b = 4'd3; cin = 1'b1;
end
endmodule 




