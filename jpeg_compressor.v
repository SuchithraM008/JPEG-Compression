module jpeg_commpressor;
parameter N=8;

reg [N-1:0] pixel;

reg [7:0]i;

reg [7:0]mem[0:63];

reg clk,reset,start,start1;

reg [4:0] Count,Count1;

reg [7:0] D[0:7][0:7];

assign D[0][0]=8'd45;
assign D[0][1]=8'd45;
assign D[0][2]=8'd45;
assign D[0][3]=8'd45;
assign D[0][4]=8'd45;
assign D[0][5]=8'd45;
assign D[0][6]=8'd45;
assign D[0][7]=8'd45;

assign D[1][0]=8'd63;
assign D[1][1]=8'd53;
assign D[1][2]=8'd36;
assign D[1][3]=8'd12;
assign D[1][4]=-8'd12;
assign D[1][5]=-8'd36;
assign D[1][6]=-8'd53;
assign D[1][7]=-8'd63;

assign D[2][0]=8'd59;
assign D[2][1]=8'd24;
assign D[2][2]=-8'd24;
assign D[2][3]=-8'd59;
assign D[2][4]=-8'd59;
assign D[2][5]=-8'd24;
assign D[2][6]=8'd24;
assign D[2][7]=8'd59;

assign D[3][0]=8'd53;
assign D[3][1]=-8'd12;
assign D[3][2]=-8'd63;
assign D[3][3]=-8'd36;
assign D[3][4]=8'd36;
assign D[3][5]=8'd63;
assign D[3][6]=8'd12;
assign D[3][7]=-8'd53;

assign D[4][0]=8'd45;
assign D[4][1]=-8'd45;
assign D[4][2]=-8'd45;
assign D[4][3]=8'd45;
assign D[4][4]=8'd45;
assign D[4][5]=-8'd45;
assign D[4][6]=-8'd45;
assign D[4][7]=8'd45;

assign D[5][0]=8'd36;
assign D[5][1]=-8'd63;
assign D[5][2]=8'd12;
assign D[5][3]=8'd53;
assign D[5][4]=-8'd53;
assign D[5][5]=-8'd12;
assign D[5][6]=8'd63;
assign D[5][7]=-8'd36;

assign D[6][0]=8'd24;
assign D[6][1]=-8'd59;
assign D[6][2]=8'd59;
assign D[6][3]=-8'd24;
assign D[6][4]=-8'd24;
assign D[6][5]=8'd59;
assign D[6][6]=-8'd59;
assign D[6][7]=8'd24;

assign D[7][0]=8'd12;
assign D[7][1]=-8'd36;
assign D[7][2]=8'd53;
assign D[7][3]=-8'd63;
assign D[7][4]=8'd63;
assign D[7][5]=-8'd53;
assign D[7][6]=8'd36;
assign D[7][7]=-8'd12;


wire [2*N-5:0]Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7;

wire [4*N-13:0]TY0,TY1,TY2,TY3,TY4,TY5,TY6,TY7;

reg [N-1:0]D0,D1,D2,D3,D4,D5,D6,D7;

reg [N-1:0]TD0,TD1,TD2,TD3,TD4,TD5,TD6,TD7;

reg [2*N-5:0] X0,X1,X2,X3,X4,X5,X6,X7;

XDT #(.N(N)) Call_1 (.Xin(pixel),.D0(D0),.D1(D1),.D2(D2),.D3(D3),.D4(D4),.D5(D5),.D6(D6),.D7(D7),.clk(clk),.reset(reset),.start(start),.row_done(row_done),.Y0(Y0),.Y1(Y1),.Y2(Y2),.Y3(Y3),.Y4(Y4),.Y5(Y5),.Y6(Y6),.Y7(Y7));

DY #(.N(N)) Call_2 (.X0(X0),.X1(X1),.X2(X2),.X3(X3),.X4(X4),.X5(X5),.X6(X6),.X7(X7),.D0(TD0),.D1(TD1),.D2(TD2),.D3(TD3),.D4(TD4),.D5(TD5),.D6(TD6),.D7(TD7),.clk(clk),.reset(reset),.start(start1),.Y00(TY0),.Y10(TY1),.Y20(TY2),.Y30(TY3),.Y40(TY4),.Y50(TY5),.Y60(TY6),.Y70(TY7));     
initial
begin
clk=1'b1;
reset=1'b1;
start=1'b0;
start1=1'b0;
Count=0;
Count1=0;
i=0;
$readmemb("image_data.txt",mem);
pixel=mem[0];
D0=D[0][Count];
D1=D[1][Count];
D2=D[2][Count];
D3=D[3][Count];
D4=D[4][Count];
D5=D[5][Count];
D6=D[6][Count];
D7=D[7][Count];

#70
reset=1'b0;
start=1'b1;

#12000
$stop;

end

always @(posedge clk)
begin

if(start)
begin
if(i<64)
begin



pixel=mem[i];


D0=D[0][Count];
D1=D[1][Count];
D2=D[2][Count];
D3=D[3][Count];
D4=D[4][Count];
D5=D[5][Count];
D6=D[6][Count];
D7=D[7][Count];

#5
if(row_done==1'b1)
begin
start1 =1'b1;
X0=Y0;
X1=Y1;
X2=Y2;
X3=Y3;
X4=Y4;
X5=Y5;
X6=Y6;
X7=Y7;
TD0=D[0][Count1];
TD1=D[1][Count1];
TD2=D[2][Count1];
TD3=D[3][Count1];
TD4=D[4][Count1];
TD5=D[5][Count1];
TD6=D[6][Count1];
TD7=D[7][Count1];
Count1=Count1+1'b1;
if(Count1==8)
begin
Count1=0;
end
end

if(Count==7)
begin
Count=0;


end
else
Count=Count+1'b1;

i=i+1'b1;
end

if(i==64)
i=0;
end

end

always
#40 clk=~clk;

always @(posedge clk)
begin

end
endmodule









