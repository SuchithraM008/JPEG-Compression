module zigzag #(parameter N = 8)(X00,X10,X20,X30,X40,X50,X60,X70,clk,reset,start,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8,Y9,Y10,Y11,Y12,Y13,Y14,Y15,Y16,Y17,Y18,Y19,Y20,Y21,Y22,Y23,Y24,Y25,Y26,Y27,Y28,Y29,Y30,Y31,Y32,Y33,Y34,Y35,Y36,Y37,Y38,Y39,Y40,Y41,Y42,Y43,Y44,Y45,Y46,Y47,Y48,Y49,Y50,Y51,Y52,Y53,Y54,Y55,Y56,Y57,Y58,Y59,Y60,Y61,Y62,Y63);   


input [5*N-20:0] X00,X10,X20,X30,X40,X50,X60,X70;

input clk,reset,start;

output reg [5*N-20:0] Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8,Y9,Y10,Y11,Y12,Y13,Y14,Y15,Y16,Y17,Y18,Y19,Y20,Y21,Y22,Y23,Y24,Y25,Y26,Y27,Y28,Y29,Y30,Y31,Y32,Y33,Y34,Y35,Y36,Y37,Y38,Y39,Y40,Y41,Y42,Y43,Y44,Y45,Y46,Y47,Y48,Y49,Y50,Y51,Y52,Y53,Y54,Y55,Y56,Y57,Y58,Y59,Y60,Y61,Y62,Y63;

reg [4:0] Count;

always @(posedge clk)
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
			if(Count==0)
			begin
				Y0=X00;
				Y2=X10;
				Y3=X20;
				Y9=X30;
				Y10=X40;
				Y20=X50;
				Y21=X60;
				Y35=X70;
			end
			if(Count==1)
			begin
				Y1=X00;
				Y4=X10;
				Y8=X20;
				Y11=X30;
				Y19=X40;
				Y22=X50;
				Y34=X60;
				Y36=X70;
			end
			if(Count==2)
			begin
				Y5=X00;
				Y7=X10;
				Y12=X20;
				Y18=X30;
				Y23=X40;
				Y33=X50;
				Y37=X60;
				Y48=X70;
			end
			if(Count==3)
			begin
				Y6=X00;
				Y13=X10;
				Y17=X20;
				Y24=X30;
				Y32=X40;
				Y38=X50;
				Y47=X60;
				Y49=X70;
			end

			if(Count==4)
			begin
				Y14=X00;
				Y16=X10;
				Y25=X20;
				Y31=X30;
				Y39=X40;
				Y46=X50;
				Y50=X60;
				Y57=X70;
			end

			if(Count==5)
			begin
				Y15=X00;
				Y26=X10;
				Y30=X20;
				Y40=X30;
				Y45=X40;
				Y51=X50;
				Y56=X60;
				Y58=X70;
			end

			
			if(Count==6)
			begin
				Y27=X00;
				Y29=X10;
				Y41=X20;
				Y44=X30;
				Y52=X40;
				Y55=X50;
				Y59=X60;
				Y62=X70;
			end


			if(Count==7)
			begin
				Y28=X00;
				Y42=X10;
				Y43=X20;
				Y53=X30;
				Y54=X40;
				Y60=X50;
				Y61=X60;
				Y63=X70;
			end

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



















