`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2022 04:57:04 PM
// Design Name: 
// Module Name: asym_fifo
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


module asym_fifo
    #(parameter ADDR_WIDTH = 3, DATA_WIDTH = 4)(
    input logic clk, reset,
    input logic wr, rd,
    input logic [(2 * DATA_WIDTH) - 1: 0] w_data,
    output logic [DATA_WIDTH - 1: 0] r_data,
    output logic full, empty
    );
    
    // signal declaration
    logic [ADDR_WIDTH - 1: 0] w_addr, r_addr;
    
    reg_file #(.ADDR_WIDTH(ADDR_WIDTH),.DATA_WIDTH(DATA_WIDTH)) r_file_unit (
        .w_en(wr & !full),
        .*
    );
    
    fifo_ctrl #(.ADDR_WIDTH(ADDR_WIDTH)) ctrl_unit (
        .*
    );
    
endmodule
