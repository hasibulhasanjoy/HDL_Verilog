module JKFF(q,qb,j,k,clk,clr);
input j,k,clk,clr;
output q,qb;
wire w1,w2,m,mb,w3,w4,clkb;

nand (w1,j,clk,qb,clr);
nand(w2,k,clk,q);
nand(m,w1,mb);
nand(mb,w2,m,clr);

not(clkb,clk);

nand(w3,m,clkb);
nand(w4,mb,clkb);
nand(q,w3,qb);
nand(qb,w4,q,clr);
endmodule
/*
set clk = clk
initially set clr = 0 then clr = no force 
*/
module mod10(clk,j,k,q,qbar);
input j,k,clk;
output [3:0] q,qbar;
wire clr;
nand (clr,q[3],q[1]);
JKFF f1(q[0],qbar[0],j,k,clk,clr);
JKFF f2(q[1],qbar[1],j,k,q[0],clr);
JKFF f3(q[2],qbar[2],j,k,q[1],clr);
JKFF f4(q[3],qbar[3],j,k,q[2],clr);
endmodule 
