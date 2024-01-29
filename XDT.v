module XDT #(parameter N=8)(Xin,D0,D1,D2,D3,D4,D5,D6,D7,clk,reset,start,row_done,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7);
input [N-1:0]Xin;
input [N-1:0]D0,D1,D2,D3,D4,D5,D6,D7;
input clk,reset,start;
output reg row_done;
output reg [2*N-5:0]Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7;

reg [4:0]Count;

wire [4*N+6:0] Temp0,Temp1,Temp2,Temp3,Temp4,Temp5,Temp6,Temp7;

reg [2*N+2:0] TXin;

reg [2*N+2:0] TD0,TD1,TD2,TD3,TD4,TD5,TD6,TD7;

reg [2*N+2:0] Acc0,Acc1,Acc2,Acc3,Acc4,Acc5,Acc6,Acc7;


MAC_Signed #(.N(2*N+3)) MAC1 (.A(Acc0),.B(TXin),.C(TD0),.Y(Temp0)); // Y=A+B*C;
MAC_Signed #(.N(2*N+3)) MAC2 (.A(Acc1),.B(TXin),.C(TD1),.Y(Temp1));
MAC_Signed #(.N(2*N+3)) MAC3 (.A(Acc2),.B(TXin),.C(TD2),.Y(Temp2));
MAC_Signed #(.N(2*N+3)) MAC4 (.A(Acc3),.B(TXin),.C(TD3),.Y(Temp3));
MAC_Signed #(.N(2*N+3)) MAC5 (.A(Acc4),.B(TXin),.C(TD4),.Y(Temp4)); 
MAC_Signed #(.N(2*N+3)) MAC6 (.A(Acc5),.B(TXin),.C(TD5),.Y(Temp5));
MAC_Signed #(.N(2*N+3)) MAC7 (.A(Acc6),.B(TXin),.C(TD6),.Y(Temp6));
MAC_Signed #(.N(2*N+3)) MAC8 (.A(Acc7),.B(TXin),.C(TD7),.Y(Temp7));

always @(posedge clk)
begin
	if(reset)
	begin
		Count<=0;
		row_done<=1'b0;
		Y0 <= 0;
		Y1 <= 0;
		Y2 <= 0;
		Y3 <= 0;
		Y4 <= 0;
		Y5 <= 0;
		Y6 <= 0;
		Y7 <= 0;
	end
	else
	begin
		if(start)
		begin
			if(Count==0)
			begin
				row_done=1'b0;

				Acc0 <= 0;
				Acc1 <= 0;
				Acc2 <= 0;
				Acc3 <= 0;
				Acc4 <= 0;
				Acc5 <= 0;
				Acc6 <= 0;
				Acc7 <= 0;
				
				TXin <= {{(N+3){Xin[N-1]}},{Xin}};

				TD0 <= {{(N+3){D0[N-1]}},{D0}};
				TD1 <= {{(N+3){D1[N-1]}},{D1}};
				TD2 <= {{(N+3){D2[N-1]}},{D2}};
				TD3 <= {{(N+3){D3[N-1]}},{D3}};
				TD4 <= {{(N+3){D4[N-1]}},{D4}};
				TD5 <= {{(N+3){D5[N-1]}},{D5}};
				TD6 <= {{(N+3){D6[N-1]}},{D6}};
				TD7 <= {{(N+3){D7[N-1]}},{D7}};

				
				
				
				Count <= Count+1'b1;
			end
			else if(Count>0&&Count<8)
			begin
				row_done=1'b0;

				Acc0 <= Temp0[2*N+2:0];
				Acc1 <= Temp1[2*N+2:0];
				Acc2 <= Temp2[2*N+2:0];
				Acc3 <= Temp3[2*N+2:0];
				Acc4 <= Temp4[2*N+2:0];
				Acc5 <= Temp5[2*N+2:0];
				Acc6 <= Temp6[2*N+2:0];
				Acc7 <= Temp7[2*N+2:0];
				
				TXin <= {{(N+3){Xin[N-1]}},{Xin}};

				TD0 <= {{(N+3){D0[N-1]}},{D0}};
				TD1 <= {{(N+3){D1[N-1]}},{D1}};
				TD2 <= {{(N+3){D2[N-1]}},{D2}};
				TD3 <= {{(N+3){D3[N-1]}},{D3}};
				TD4 <= {{(N+3){D4[N-1]}},{D4}};
				TD5 <= {{(N+3){D5[N-1]}},{D5}};
				TD6 <= {{(N+3){D6[N-1]}},{D6}};
				TD7 <= {{(N+3){D7[N-1]}},{D7}};

				Count <= Count+1'b1;
			end
			else
			begin
				row_done=1'b1;
				Acc0 <= 0;
				Acc1 <= 0;
				Acc2 <= 0;
				Acc3 <= 0;
				Acc4 <= 0;
				Acc5 <= 0;
				Acc6 <= 0;
				Acc7 <= 0;
				
				TXin <= {{(N+3){Xin[N-1]}},{Xin}};

				TD0 <= {{(N+3){D0[N-1]}},{D0}};
				TD1 <= {{(N+3){D1[N-1]}},{D1}};
				TD2 <= {{(N+3){D2[N-1]}},{D2}};
				TD3 <= {{(N+3){D3[N-1]}},{D3}};
				TD4 <= {{(N+3){D4[N-1]}},{D4}};
				TD5 <= {{(N+3){D5[N-1]}},{D5}};
				TD6 <= {{(N+3){D6[N-1]}},{D6}};
				TD7 <= {{(N+3){D7[N-1]}},{D7}};
				
				Y0 <= Temp0[2*N+2:7];
				Y1 <= Temp1[2*N+2:7];
				Y2 <= Temp2[2*N+2:7];
				Y3 <= Temp3[2*N+2:7];
				Y4 <= Temp4[2*N+2:7];
				Y5 <= Temp5[2*N+2:7];
				Y6 <= Temp6[2*N+2:7];
				Y7 <= Temp7[2*N+2:7];

				Count <=1;
			end
		end

	end
end
endmodule





























				
