module GrayToBinary (g0,g1,g2,g3,b0,b1,b2,b3);
input g0,g1,g2,g3;
output b0,b1,b2,b3;
or (b3,g3,0);
xor (b2,g3,g2);
xor(b1,g3,g2,g1);
xor(b0,g3,g2,g1,g0);
endmodule

module simulateGrayToBinary;

reg g0,g1,g2,g3;
wire b0,b1,b2,b3;

GrayToBinary test(g0,g1,g2,g3,b0,b1,b2,b3);

initial 
begin 
#100
g3 = 0;
g2 = 0;
g1 = 1;
g0 = 1;
#100
g3 = 0;
g2 = 0;
g1 = 1;
g0 = 0;
#100
g3 = 0;
g2 = 1;
g1 = 1;
g0 = 1;
#100
g3 = 0;
g2 = 1;
g1 = 0;
g0 = 0;
#100
g3 = 1;
g2 = 1;
g1 = 1;
g0 = 1;
#100
g3 = 1;
g2 = 0;
g1 = 1;
g0 = 0;
#100
g3 = 1;
g2 = 0;
g1 = 0;
g0 = 0;
end
endmodule

