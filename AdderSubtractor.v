module AdderSubtractor(a,b,cin,s,cout);
input [3:0] a,b;
input cin;
output [3:0] s;
output cout;
assign {cout,s} = a + b + cin;
endmodule

///////////////////////////////////////////////////

/* Simulation */

module simulationAdderSubtractor;
reg [3:0] a,b;
reg cin;
wire [3:0] s;
wire cout;
AdderSubtractor adder(a,b,cin,s,cout);
initial 
begin 
#100 a = 4'b0000; b = 4'b0001; cin = 1'b0;
#100 a = 4'b0001; b = 4'b0001; cin = 1'b0;
#100 a = 4'b0101; b = 4'b0011; cin = 1'b0;
#100 a = 4'b0110; b = 4'b1000; cin = 1'b0;
#100 a = 4'b1000; b = 4'b1000; cin = 1'b0;
end
endmodule
