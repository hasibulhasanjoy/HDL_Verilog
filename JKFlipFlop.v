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

