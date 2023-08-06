module BinaryToGray(b1,b2,b3,b4,g1,g2,g3,g4);
input b1,b2,b3,b4;
output g1,g2,g3,g4;
wire x1,x2,x3,x4;
/*
assign x1 = b1 ^ b2;
assign x2 = g2 ^ g3;
assign x3 = g3 ^ g4;
assign x4 = b4;
*/
xor (g1,b1,b2);
xor (g2,b2,b3);
xor (g3,b3,b4);
or (g4,b4,0);
endmodule

module simulate;
reg b1,b2,b3,b4;
wire g1,g2,g3,g4;

BinaryToGray test(b1,b2,b3,b4,g1,g2,g3,g4);
initial 
begin 
#0
b1 = 0;
b2 = 0;
b3 = 0;
b4 = 0;
#100
b1 = 0;
b2 = 1;
b3 = 0;
b4 = 0;
#100
b1 = 0;
b2 = 0;
b3 = 1;
b4 = 0;
#100
b1 = 1;
b2 = 0;
b3 = 1;
b4 = 0;
#100
b1 = 1;
b2 = 1;
b3 = 0;
b4 = 1;
end 
endmodule 
