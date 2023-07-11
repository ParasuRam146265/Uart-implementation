`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2023 22:34:43
// Design Name: 
// Module Name: braudtb
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


module braudtb;
reg clk,rst;
wire tick;
wire [11:0]q;
braudgenerator m(clk,rst,q,tick);
initial begin
clk=0;
rst=1;
#12 rst=0;

end
always #10 clk=~clk;
endmodule