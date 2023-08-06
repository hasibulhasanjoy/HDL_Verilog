module fullAdder1bit(a,b,cin,sum,carry);
input a,b,cin;
output sum,carry;
wire s1,c1,c2;
xor (s1,a,b);
xor (sum,s1,cin);
and (c1,a,b);
and (c2,s1,cin);
xor (carry,c1,c2);
endmodule


module FullAdder4bitBCD(a,b,cin,sum,carry);
input [3:0] a,b;
input cin;
output [3:0] sum;
output carry;
wire c1,c2,c3;
fullAdder1bit f0(a[0],b[0],cin,sum[0],c1);
fullAdder1bit f1(a[1],b[1],c1,sum[1],c2);
fullAdder1bit f2(a[2],b[2],c2,sum[2],c3);
fullAdder1bit f3(a[3],b[3],c3,sum[3],carry);
endmodule

module BCDAdderGate(a,b,sum,carry);
input [3:0] a,b;
wire [3:0] z;
wire c1,c2,c3,c4;
output carry;
output [3:0] sum;
FullAdder4bitBCD fa1(a,b,0,z,c4);
and (c1,z[3],z[2]);
and (c2,z[3],z[1]);
or (c3,c1,c2);
or (carry,c3,c4);
wire [3:0] m;
and (m[0],0,0);
and (m[3],0,0);
or (m[1],carry,0);
or (m[2],carry,0);
wire c5;
FullAdder4bitBCD fa2(m,z,0,sum,c5);
endmodule

module SimBCDGate;
reg [3:0] a,b;
wire [3:0] sum;
wire carry;
BCDAdderGate bcd(a,b,sum,carry);
initial
begin
#10 a = 4'd0; b = 4'd0;
#100 a = 4'd0; b = 4'd1;
#100 a = 4'd1; b = 4'd1;
#100 a = 4'd4; b = 4'd3;
#100 a = 4'd5; b = 4'd5;
#100 a = 4'd7; b = 4'd6;
#100 a = 4'd8; b = 4'd7;
#100 a = 4'd12; b = 4'd0;
#100 a = 4'd14; b = 4'd1;
#100 a = 4'd11; b = 4'd2;
#100 a = 4'd10; b = 4'd5;
end
endmodule

module sim4bitBcdAdder;
reg [3:0] a,b;
reg cin;
wire [3:0] sum;
wire carry;
FullAdder4bitBCD adder2(a,b,cin,sum,carry);
initial
begin
#10 a = 4'd0; b = 4'd0; cin = 1'b0;
#100 a = 4'd0; b = 4'd1; cin = 1'b0;
#100 a = 4'd1; b = 4'd1; cin = 1'b0;
#100 a = 4'd4; b = 4'd3; cin = 1'b0;
#100 a = 4'd5; b = 4'd5; cin = 1'b0;
#100 a = 4'd7; b = 4'd6; cin = 1'b0;
#100 a = 4'd8; b = 4'd7; cin = 1'b0;
#100 a = 4'd12; b = 4'd0; cin = 1'b0;
#100 a = 4'd14; b = 4'd1; cin = 1'b0;
#100 a = 4'd11; b = 4'd2; cin = 1'b0;
#100 a = 4'd10; b = 4'd5; cin = 1'b0;
end
endmodule

module sim1BitAdderBCD;
reg a,b,cin;
wire sum,carry;
fullAdder1bit adder1(a,b,cin,sum,carry);
initial 
begin
#10 a = 0;b = 0; cin = 0;
#100 a = 0; b = 1; cin = 0;
#100 a = 1; b = 0; cin = 0;
#100 a = 1; b = 1; cin = 0;
end
endmodule
