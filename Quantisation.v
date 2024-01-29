//Writing HDL code for Quantisation 

module Quantisation #(parameter N = 8)(X00,X10,X20,X30,X40,X50,X60,X70,clk,reset,start,Y00,Y10,Y20,Y30,Y40,Y50,Y60,Y70);

input [4*N-13:0] X00,X10,X20,X30,X40,X50,X60,X70;

input clk,reset,start;

reg [4:0] Count;

reg [7:0] A[0:7][0:7];

output reg [5*N-20:0] Y00,Y10,Y20,Y30,Y40,Y50,Y60,Y70;

reg [5*N-13:0] Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7;



reg [7:0] Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;

assign A[0][0]=8'd8;
assign A[0][1]=8'd12;
assign A[0][2]=8'd13;
assign A[0][3]=8'd8;
assign A[0][4]=8'd5;
assign A[0][5]=8'd3;
assign A[0][6]=8'd3;
assign A[0][7]=8'd2;

assign A[1][0]=8'd11;
assign A[1][1]=8'd11;
assign A[1][2]=8'd9;
assign A[1][3]=8'd7;
assign A[1][4]=8'd5;
assign A[1][5]=8'd2;
assign A[1][6]=8'd2;
assign A[1][7]=8'd2;

assign A[2][0]=8'd9;
assign A[2][1]=8'd10;
assign A[2][2]=8'd8;
assign A[2][3]=8'd5;
assign A[2][4]=8'd3;
assign A[2][5]=8'd2;
assign A[2][6]=8'd2;
assign A[2][7]=8'd2;

assign A[3][0]=8'd9;
assign A[3][1]=8'd8;
assign A[3][2]=8'd6;
assign A[3][3]=8'd4;
assign A[3][4]=8'd3;
assign A[3][5]=8'd1;
assign A[3][6]=8'd2;
assign A[3][7]=8'd2;

assign A[4][0]=8'd7;
assign A[4][1]=8'd6;
assign A[4][2]=8'd3;
assign A[4][3]=8'd2;
assign A[4][4]=8'd2;
assign A[4][5]=8'd1;
assign A[4][6]=8'd1;
assign A[4][7]=8'd2;

assign A[5][0]=8'd5;
assign A[5][1]=8'd4;
assign A[5][2]=8'd2;
assign A[5][3]=8'd2;
assign A[5][4]=8'd2;
assign A[5][5]=8'd1;
assign A[5][6]=8'd1;
assign A[5][7]=8'd1;

assign A[6][0]=8'd3;
assign A[6][1]=8'd2;
assign A[6][2]=8'd2;
assign A[6][3]=8'd1;
assign A[6][4]=8'd1;
assign A[6][5]=8'd1;
assign A[6][6]=8'd1;
assign A[6][7]=8'd1;

assign A[7][0]=8'd2;
assign A[7][1]=8'd1;
assign A[7][2]=8'd1;
assign A[7][3]=8'd1;
assign A[7][4]=8'd1;
assign A[7][5]=8'd1;
assign A[7][6]=8'd1;
assign A[7][7]=8'd1;


always@(posedge clk)
begin
	if(reset)
	begin
		Count=0;
	end

	else
	begin

		if(start)
		begin
			if(Count<8)
			begin
				Q0=A[0][Count];
				Q1=A[1][Count];
				Q2=A[2][Count];
				Q3=A[3][Count];
				Q4=A[4][Count];
				Q5=A[5][Count];
				Q6=A[6][Count];
				Q7=A[7][Count];

				

				
				Y0=X00*Q0;
				
				Y1=X10*Q1;
				
				Y2=X20*Q2;
				
				Y3=X30*Q3;
				
				Y4=X40*Q4;
				
				Y5=X50*Q5;
				
				Y6=X60*Q6;
				
				Y7=X70*Q7;

				Y00=Y0[5*N-13:7];	
				Y10=Y1[5*N-13:7];	
				Y20=Y2[5*N-13:7];	
				Y30=Y3[5*N-13:7];	
				Y40=Y4[5*N-13:7];	
				Y50=Y5[5*N-13:7];	
				Y60=Y6[5*N-13:7];	
				Y70=Y7[5*N-13:7];	

			
				Count=Count+1'b1;
			
			end
			else
			begin
				Count=0;
			end
		end
	end
end





endmodule






































