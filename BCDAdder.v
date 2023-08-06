module BCDAdder (a,b,cout,sum);
input [3:0] a,b;
wire [3:0] z;
wire c1,c2,c3,c4;
output cout;
output[3:0] sum;
assign {c4,z} = a + b + 0;
assign c1 = (z[3] & z[2]);
assign c2 = z[3] & z[1];
assign c3 = c1 | c2;
assign cout = c3 | c4;
wire [3:0] x;
assign x = {1'b0,cout,cout,1'b0};
assign sum = x + z + 0;
endmodule

module simBCDAdder;
reg [3:0] a,b;
wire cout;
wire [3:0] sum;
BCDAdder bcd(a,b,cout,sum);
initial 
begin 
#10 a = 4'd1; b = 4'd1;
#100 a = 4'd4; b = 4'd2;
#100 a = 4'd4; b = 4'd4;
#100 a = 4'd5; b = 4'd2;
#100 a = 4'd4; b = 4'd6;
#100 a = 4'd6; b = 4'd6;
#100 a = 4'd8; b = 4'd7;
end
endmodule

 