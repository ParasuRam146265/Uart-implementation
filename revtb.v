`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2023 09:48:19
// Design Name: 
// Module Name: revtb
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


module revtb();
reg tx_reg,rst,clk;
wire rx_done,tick;
wire [7:0]dout;
uart_rec uut(tx_reg,rst,clk,dout,rx_done,tick);
initial begin
rst=1;
clk=0;
#11 rst=0;
#20 tx_reg=1;
$display($time,"start process");
ram(1); 
ram(1); 
ram(1); 
ram(0);//start bit
ram(0); 
ram(1); 
ram(0); 
ram(1); 
ram(0); 
ram(1); 
ram(0); 
ram(1);
ram(1); //stop bit
#1000000 $stop;
end
task ram;
input ip;
begin
@(posedge tick)begin
tx_reg=ip;
end 
end
endtask
always #10 clk=~clk;
endmodule

