module brentkung32(
input [31:0] a,b ,
input cin,
output [31:0] sum,
output cout,
output [31:0] c


);
genvar i,k,h,n,o,j,l,m,s;
wire[31:0] g,p;
wire[15:0]  g2b,p2b;
wire[7:0] g3b,p3b;
wire[3:0] g4b,p4b;
wire[1:0] g5b,p5b;
//wire [30:0] c
wire g6b,p6b;
assign g=a&b;
assign p=a^b;
generate

for(j=0;j<16;j=j+1)
begin:division16
g2bits ga(g[2*j+1:2*j],p[2*j+1],g2b[j]);
p2bits pa(p[2*j+1:2*j],p2b[j]);
 end

for(l=0;l<8;l=l+1)
begin:division8
g2bits gb(g2b[2*l+1:2*l],p2b[2*l+1],g3b[l]);
p2bits pb(p2b[2*l+1:2*l],p3b[l]);

end
for(m=0;m<4;m=m+1)
begin:division4
g2bits gc(g3b[2*m+1:2*m],p3b[2*m+1],g4b[m]);
p2bits pc(p3b[2*m+1:2*m],p4b[m]);

end

for(s=0;s<2;s=s+1)
begin:division2
g2bits gd(g4b[2*s+1:2*s],p4b[2*s+1],g5b[s]);
p2bits pd (p4b[2*s+1:2*s],p5b[s]);

end
endgenerate
g2bits ge(g5b[1:0],p5b[1],g6b);
p2bits pe(p5b[1:0],p6b);
assign  c[0]=cin;

assign cout= g6b|(p6b&cin);
assign c[16]=g5b[0]|(p5b[0]&cin);
assign c[8]=g4b[0]|(p4b[0]&cin);
assign c[4]=g3b[0]|(p3b[0]&cin);
assign c[2]=g2b[0]|(p2b[0]&cin);
assign c[1]=g[0]|(p[0]&cin);
assign c[12]=g3b[2]|(p3b[2]&c[8]);
assign c[20]=g3b[4]|(p3b[4]&c[16]);
assign c[3]=g[2]|(p[2]&c[2]);
assign c[24]=g4b[2]|(p4b[2]&c[16]);
assign c[28]=g3b[6]|(p3b[6]&c[24]);
assign c[6]=g2b[2]|(p2b[2]&c[4]);
assign c[10]=g2b[4]|(p2b[4]&c[8]);
assign c[14]=g2b[6]|(p2b[6]&c[12]);
assign c[18]=g2b[8]|(p2b[8]&c[16]);
assign c[22]=g2b[10]|(p2b[10]&c[20]);
assign c[26]=g2b[12]|(p2b[12]&c[24]);
assign c[30]=g2b[14]|(p2b[14]&c[28]);
assign c[5]=g[4]|(p[4]&c[4]);
assign c[7]=g[6]|(p[6]&c[6]);
assign c[9]=g[8]|(p[8]&c[8]);
assign c[11]=g[10]|(p[10]&c[10]);
assign c[13]=g[12]|(p[12]&c[12]);
assign c[15]=g[14]|(p[14]&c[14]);
assign c[17]=g[16]|(p[16]&c[16]);
assign c[19]=g[18]|(p[18]&c[18]);
assign c[21]=g[20]|(p[20]&c[20]);
assign c[23]=g[22]|(p[22]&c[22]);
assign c[25]=g[24]|(p[24]&c[24]);
assign c[27]=g[26]|(p[26]&c[26]);
assign c[29]=g[28]|(p[28]&c[28]);
assign c[31]=g[30]|(p[30]&c[30]);

assign sum=a^b^c[31:0];
endmodule
module g2bits(
input [1:0] g2,
input p2,
output   g2o
);
assign g2o=g2[1]|(g2[0]&p2);
endmodule
module p2bits(
input [1:0] p2,
output  p2o
);
assign p2o=p2[1]&p2[0];
endmodule
module adder(
input p,
output s
);
assign s=p+1;
endmodule