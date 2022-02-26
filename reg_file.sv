`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2022 06:58:25 PM
// Design Name: 
// Module Name: reg_file
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


module reg_file
    #(parameter ADDR_WIDTH = 2, DATA_WIDTH = 4)(
    input logic clk,
    input logic w_en,
    input logic [ADDR_WIDTH - 1: 0] r_addr,
    input logic [ADDR_WIDTH - 1: 0] w_addr,    
    input logic [(2 * DATA_WIDTH) - 1: 0] w_data,   //write port 2x read port
    output logic [DATA_WIDTH - 1: 0] r_data 
    );
    
    //signal declaration
    //reg file same size as read port
    logic [ DATA_WIDTH - 1: 0] memory [0: (2 ** ADDR_WIDTH) - 1];
    
    //write operation
    always_ff@(posedge clk)
    begin
        if(w_en)
        begin
            memory[w_addr] <= w_data[((2 * DATA_WIDTH)/2) - 1: 0];                  //write last half to address
            memory[w_addr + 1] <= w_data[(2 * DATA_WIDTH) - 1: (2 * DATA_WIDTH)/2 ];//write first half to next address
        end
    end
    
    //read operation
    assign r_data = memory[r_addr];
endmodule
