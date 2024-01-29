module DY #(parameter N=8)(X0,X1,X2,X3,X4,X5,X6,X7,D0,D1,D2,D3,D4,D5,D6,D7,clk,reset,start,Y00,Y10,Y20,Y30,Y40,Y50,Y60,Y70);

input [2*N-5:0] X0,X1,X2,X3,X4,X5,X6,X7;
input [N-1:0] D0,D1,D2,D3,D4,D5,D6,D7;

input clk,reset,start;

reg new_input;

reg [4:0] row_count;

reg [4:0] Count;

output reg [4*N-13:0] Y00,Y10,Y20,Y30,Y40,Y50,Y60,Y70;

reg [4*N-6:0] Y[0:7][0:7];

wire [8*N-10:0] Temp0,Temp1,Temp2,Temp3,Temp4,Temp5,Temp6,Temp7;

reg [4*N-6:0] Acc0,Acc1,Acc2,Acc3,Acc4,Acc5,Acc6,Acc7;

reg [4*N-6:0] TD0,TD1,TD2,TD3,TD4,TD5,TD6,TD7;

reg [4*N-6:0] TXin;

MAC_Signed #(.N(4*N-5)) MAC1 (.A(Acc0),.B(TXin),.C(TD0),.Y(Temp0)); // Y=A+B*C;
MAC_Signed #(.N(4*N-5)) MAC2 (.A(Acc1),.B(TXin),.C(TD1),.Y(Temp1));
MAC_Signed #(.N(4*N-5)) MAC3 (.A(Acc2),.B(TXin),.C(TD2),.Y(Temp2));
MAC_Signed #(.N(4*N-5)) MAC4 (.A(Acc3),.B(TXin),.C(TD3),.Y(Temp3));
MAC_Signed #(.N(4*N-5)) MAC5 (.A(Acc4),.B(TXin),.C(TD4),.Y(Temp4)); 
MAC_Signed #(.N(4*N-5)) MAC6 (.A(Acc5),.B(TXin),.C(TD5),.Y(Temp5));
MAC_Signed #(.N(4*N-5)) MAC7 (.A(Acc6),.B(TXin),.C(TD6),.Y(Temp6));
MAC_Signed #(.N(4*N-5)) MAC8 (.A(Acc7),.B(TXin),.C(TD7),.Y(Temp7));

always @(posedge clk)
begin
	if(reset)
	begin
		Count = 0;
		new_input =1;
	end
	else
	begin
		if(start)
		begin
			if(Count<8)
			begin
				
				
				if(new_input==1)
				begin
					row_count=0;
					Y[0][Count]=0;
					Y[1][Count]=0;
					Y[2][Count]=0;
					Y[3][Count]=0;
					Y[4][Count]=0;
					Y[5][Count]=0;
					Y[6][Count]=0;
					Y[7][Count]=0;
				end
				if(Count>0)
				begin
					Y[0][Count-1]=Temp0[4*N-6:0];
					Y[1][Count-1]=Temp1[4*N-6:0];
					Y[2][Count-1]=Temp2[4*N-6:0];
					Y[3][Count-1]=Temp3[4*N-6:0];
					Y[4][Count-1]=Temp4[4*N-6:0];
					Y[5][Count-1]=Temp5[4*N-6:0];
					Y[6][Count-1]=Temp6[4*N-6:0];
					Y[7][Count-1]=Temp7[4*N-6:0];	
				end

				Acc0 = Y[0][Count];
				Acc1 = Y[1][Count];
				Acc2 = Y[2][Count];
				Acc3 = Y[3][Count];
				Acc4 = Y[4][Count];
				Acc5 = Y[5][Count];
				Acc6 = Y[6][Count];
				Acc7 = Y[7][Count];
				
				if(Count==0)
				begin
					TXin = {{(2*N-1){X0[N-1]}},{X0}};
				end
				
				if(Count==1)
				begin
					TXin = {{(2*N-1){X1[N-1]}},{X1}};
				end
				
				if(Count==2)
				begin
					TXin = {{(2*N-1){X2[N-1]}},{X2}};
				end

				if(Count==3)
				begin
					TXin = {{(2*N-1){X3[N-1]}},{X3}};
				end

				if(Count==4)
				begin
					TXin = {{(2*N-1){X4[N-1]}},{X4}};
				end
		
				if(Count==5)
				begin
					TXin = {{(2*N-1){X5[N-1]}},{X5}};
				end

				if(Count==6)
				begin
					TXin = {{(2*N-1){X6[N-1]}},{X6}};
				end

				if(Count==7)
				begin
					TXin = {{(2*N-1){X7[N-1]}},{X7}};
				end

				
				TD0 = {{(3*N-5){D0[N-1]}},{D0}};
				TD1 = {{(3*N-5){D1[N-1]}},{D1}};
				TD2 = {{(3*N-5){D2[N-1]}},{D2}};
				TD3 = {{(3*N-5){D3[N-1]}},{D3}};
				TD4 = {{(3*N-5){D4[N-1]}},{D4}};
				TD5 = {{(3*N-5){D5[N-1]}},{D5}};
				TD6 = {{(3*N-5){D6[N-1]}},{D6}};
				TD7 = {{(3*N-5){D7[N-1]}},{D7}};

				Count = Count+1'b1;
			end
			
			else
			begin
				row_count=row_count+1;
		
			        if(row_count==8)
				begin
				new_input=1;
				Y[0][0]=0;
				Y[1][0]=0;
				Y[2][0]=0;
				Y[3][0]=0;
				Y[4][0]=0;
				Y[5][0]=0;
				Y[6][0]=0;
				Y[7][0]=0;
				end

				
				
				
				Y[0][Count-1]=Temp0[4*N-6:0];
				Y[1][Count-1]=Temp1[4*N-6:0];
				Y[2][Count-1]=Temp2[4*N-6:0];
				Y[3][Count-1]=Temp3[4*N-6:0];
				Y[4][Count-1]=Temp4[4*N-6:0];
				Y[5][Count-1]=Temp5[4*N-6:0];
				Y[6][Count-1]=Temp6[4*N-6:0];
				Y[7][Count-1]=Temp7[4*N-6:0];	
				
				if(row_count==8)
				begin
				Y00 = Y[0][Count-1][4*N-6:7];
				Y10 = Y[1][Count-1][4*N-6:7];
				Y20 = Y[2][Count-1][4*N-6:7];
				Y30 = Y[3][Count-1][4*N-6:7];
				Y40 = Y[4][Count-1][4*N-6:7];
				Y50 = Y[5][Count-1][4*N-6:7];
				Y60 = Y[6][Count-1][4*N-6:7];
				Y70 = Y[7][Count-1][4*N-6:7];

				row_count=0;
				end
				
				Acc0 = Y[0][0];
				Acc1 = Y[1][0];
				Acc2 = Y[2][0];
				Acc3 = Y[3][0];
				Acc4 = Y[4][0];
				Acc5 = Y[5][0];
				Acc6 = Y[6][0];
				Acc7 = Y[7][0];
				
				TXin = {{(2*N-1){X0[N-1]}},{X0}};
				
				TD0 = {{(3*N-5){D0[N-1]}},{D0}};
				TD1 = {{(3*N-5){D1[N-1]}},{D1}};
				TD2 = {{(3*N-5){D2[N-1]}},{D2}};
				TD3 = {{(3*N-5){D3[N-1]}},{D3}};
				TD4 = {{(3*N-5){D4[N-1]}},{D4}};
				TD5 = {{(3*N-5){D5[N-1]}},{D5}};
				TD6 = {{(3*N-5){D6[N-1]}},{D6}};
				TD7 = {{(3*N-5){D7[N-1]}},{D7}};

				if(row_count==1)
				new_input=0;
				
				Count=1;

				
			
			end
		
			
			

			if(row_count==7)
			begin
				if(Count>0&&Count<8)
				begin
				Y00 = Y[0][Count-2][4*N-6:7];
				Y10 = Y[1][Count-2][4*N-6:7];
				Y20 = Y[2][Count-2][4*N-6:7];
				Y30 = Y[3][Count-2][4*N-6:7];
				Y40 = Y[4][Count-2][4*N-6:7];
				Y50 = Y[5][Count-2][4*N-6:7];
				Y60 = Y[6][Count-2][4*N-6:7];
				Y70 = Y[7][Count-2][4*N-6:7];
				end
					
			end
		end
	end
end
endmodule

				
				
				
				
				








			










