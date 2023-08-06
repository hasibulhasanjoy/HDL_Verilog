module BcdToExcess3(a,b,c,d,w,x,y,z);
input a,b,c,d;
output w,x,y,z;
assign w = a | (b & c) | (b & d);
assign x = (~b & c) | (~b & d) | (b & ~c & ~d);
assign y = (c & d) | (~c & ~d);
assign z = ~d;
endmodule

////////////////

module simulateBcdToXs3;

reg a,b,c,d;
wire w,x,y,z;
BcdToExcess3 bcd(a,b,c,d,w,x,y,z);
initial 
begin
#0
a = 0;
b = 0;
c = 0;
d = 0;

#100
a = 0;
b = 0;
c = 1;
d = 0;

#100
a = 0;
b = 1;
c = 0;
d = 1;

#100
a = 0;
b = 1;
c = 1;
d = 1;

#100
a = 0;
b = 1;
c = 0;
d = 0;

#100
a = 1;
b = 0;
c = 0;
d = 0;
end
endmodule

