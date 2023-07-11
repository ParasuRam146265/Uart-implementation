`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2023 19:09:17
// Design Name: 
// Module Name: transtb
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


module transtb();
reg clk,rst,tx_srt;
reg [7:0]din;
wire tx_reg,tx_done;
uart_tran m2(clk,rst,tx_srt,din,tx_reg,tx_done);
initial begin
rst=1;
clk=0;
#11 rst=0;
tx_srt=1;
din=8'haa;
#1000000 $stop;
end
always #10 clk=~clk;
endmodule
