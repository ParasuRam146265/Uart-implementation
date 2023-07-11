`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2023 22:26:46
// Design Name: 
// Module Name: braudgenerator
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
