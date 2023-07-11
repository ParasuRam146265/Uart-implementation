`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2023 17:57:20
// Design Name: 
// Module Name: uart_tran
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module uart_tran(clk,rst,tx_srt,din,tx_reg,tx_done);
input clk,rst,tx_srt;
input [7:0]din;
output reg tx_reg,tx_done;
parameter idle=2'b00,srt=2'b01,tra=2'b10,sp=2'b11;
wire tick;
wire [11:0]q;
reg [1:0]ns,ps;
integer count;
reg [7:0]sbuf;
braudgenerator m1(clk,rst,q,tick);
always@(posedge clk)begin
if(rst)begin
ps=idle;
tx_done=0;
end
else
ps=ns;
end
always@(*)begin
case(ps)
idle:begin
    tx_reg=1;
    if(tx_srt==1&&tx_done==0)
    ns=srt;
    end
srt:begin
    tx_reg=0;
    if(tick)begin
    
    sbuf=din;
    count=0;
    ns=tra;
    end
    end
tra:begin
    tx_reg=sbuf[0];
    if(tick)begin
        sbuf=sbuf>>1;
        if(count==7)begin
        count=0;
        ns=sp;
        end
        else begin
        count=count+1;
        end
    end
    end
sp:begin
   tx_reg=1;
   if(tick)begin
   tx_done=1;
   ns=idle;
   end
   end
endcase
end
endmodule
