
module FullAdderGate(a,b,cin,sum,cout);
input a,b,cin;
output sum,cout;
wire s1,c1,c2;
xor (s1,a,b);
xor (sum,s1,cin);
and (c1,a,b);
and (c2,s1,cin);
xor (cout,c1,c2);
endmodule

module FullAdder4bit(a,b,cin,sum,cout);
input [3:0] a,b;
input cin;
output [3:0] sum;
output cout;
wire c1,c2,c3;
FullAdderGate f0(a[0] ,b[0], cin,sum[0],c1);
FullAdderGate f1(a[1], b[1], c1, sum[1], c2);
FullAdderGate f2(a[2], b[2], c2, sum[2] ,c3);
FullAdderGate f3(a[3], b[3], c3, sum[3], cout);
endmodule

module sim1bitAdder;
reg a,b,cin;
wire sum, cout;
FullAdderGate adder1(a,b,cin,sum,cout);
initial 
begin 
#0 a = 0; b = 0; cin = 0;

#100 a = 0; b = 1; cin = 0;

#100 a = 1; b = 0; cin = 0;

#100 a = 1; b = 1; cin = 0;
end
endmodule

module sim4bitAdder;
reg [3:0] a,b;
reg cin;
wire [3:0] sum;
wire cout;

FullAdder4bit fullAdder(a,b,cin,sum,cout);

initial 
begin 
#100 a = 4'd8; b = 4'd4; cin = 1'b0;

#100 a = 4'd6; b = 4'd4; cin = 1'b0;

#100 a = 4'd3; b = 4'd2; cin = 1'b0;

#100 a = 4'd8; b = 4'd7; cin = 1'b0;

#100 a = 4'd0; b = 4'd0; cin = 1'b0;

#100 a = 4'd4; b = 4'd3; cin = 1'b0;
end
endmodule

module sim4bitSubtractor;
reg [3:0] a,b;
reg cin;
wire [3:0] sum;
wire cout;

FullAdder4bit fullAdder(a,b,cin,sum,cout);

initial 
begin 
#100 a = 4'd8; b = 4'd4; cin = 1'b1;

#100 a = 4'd6; b = 4'd4; cin = 1'b1;

#100 a = 4'd3; b = 4'd2; cin = 1'b1;

#100 a = 4'd8; b = 4'd7; cin = 1'b1;

#100 a = 4'd0; b = 4'd0; cin = 1'b1;

#100 a = 4'd4; b = 4'd3; cin = 1'b1;

#100 a = 4'd12; b = 4'd8; cin = 1'b1;
end
endmodule
