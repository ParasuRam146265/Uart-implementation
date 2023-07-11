`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2023 09:26:50
// Design Name: 
// Module Name: uart_rec
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


module uart_rec(tx_reg,rst,clk,dout,rx_done,tick);
input tx_reg,rst,clk;
output [7:0]dout;
output rx_done,tick;
wire [7:0]dout;
reg rx_done;
parameter idle=2'b00,srt=2'b01,tra=2'b10,sp=2'b11;
wire tick;
wire [11:0]q;
reg [1:0]ns,ps;
reg [2:0]count;
reg [7:0]sbuf;
braudgenerator m1(clk,rst,q,tick);
always@(posedge clk)begin
if(rst)begin
ns=idle;
sbuf=8'hff;
end
else
ps=ns;
end
always@(*)begin
case(ps)
idle:begin
    if(tx_reg==0)
        ns=srt;
    end
srt:
    begin
    count=0;
    ns=tra;
    end
tra:
    begin
    if(tick)begin
    sbuf={tx_reg,sbuf[7:1]};
    if(count==7)begin
    ns=sp;
    end
    else
    count=count+1;
    end
    end
sp:
    begin
    if(tick)begin
    rx_done=1;
    ns=idle;
    end
    end
endcase
end
assign dout=sbuf;
endmodule
module braudgenerator(clk,rst,q,tick);
input clk,rst;
output reg [11:0]q;
output tick;
wire tick;
always@(posedge clk)begin
if((rst)||(q==2604))
q=0;
else 
q=q+1;
end
assign tick=(q==2604)?1:0;
endmodule

