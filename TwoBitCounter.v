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
set clk = clock
initialy force clr = 0
then set clr = 1
*/
module twobitcounter(clk,qa,qb);
input clk;
output qa,qb;
wire q1b,q2b,clr;
reg j = 1, k = 1;
JKFF f1(qa,q1b,j,k,clk,clr);
JKFF f2(qb,q2b,j,k,qa,clr);
endmodule



