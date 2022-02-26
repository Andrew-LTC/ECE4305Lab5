`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2022 12:43:24 PM
// Design Name: 
// Module Name: fifo_tb
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


module fifo_tb();

localparam DATA_WIDTH = 4;
localparam ADDR_WIDTH = 3;
localparam T = 10;

logic clk, reset;
logic wr, rd;
logic [DATA_WIDTH -1: 0] r_data;
logic [(2*DATA_WIDTH) -1: 0] w_data;
logic full, empty;

asym_fifo #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH)) uut (.*);

    always
    begin
        clk = 1'b1;
        #(T / 2);
        clk = 1'b0;
        #(T / 2);
    end

    initial
    begin
        reset = 1'b1;
        rd = 1'b0;
        wr = 1'b0;
        @(negedge clk);
        reset = 1'b0;
    end
 
    initial
    begin
//         //write
//        @(negedge clk);
//        w_data = 8'b1111_0000;
//        wr = 1'b1;     
//        @(negedge clk);
//        wr = 1'b0; 
        
//        //write
//        @(negedge clk);
//        w_data = 8'b0111_1000;
//        wr = 1'b1;     
//        @(negedge clk);
//        wr = 1'b0;
        
//        //write
//        @(negedge clk);
//        w_data = 8'b0011_1100;
//        wr = 1'b1;     
//        @(negedge clk);
//        wr = 1'b0;
        
//        //write
//        @(negedge clk);
//        w_data = 8'b0001_1110;
//        wr = 1'b1;     
//        @(negedge clk);
//        wr = 1'b0;
        
//        // read
//        repeat(1) @(negedge clk);
//        rd = 1'b1;
//        @(negedge clk)
//        rd = 1'b0;
        
//        //write
//        @(negedge clk);
//        w_data = 8'b1001_0110;
//        wr = 1'b1;     
//        @(negedge clk);
//        wr = 1'b0;
        
//        // read
//        repeat(1) @(negedge clk);
//        rd = 1'b1;
//        @(negedge clk)
//        rd = 1'b0;
        
//        // read
//        repeat(1) @(negedge clk);
//        rd = 1'b1;
//        @(negedge clk)
//        rd = 1'b0;
        
//        // read
//        repeat(1) @(negedge clk);
//        rd = 1'b1;
//        @(negedge clk)
//        rd = 1'b0;
        
//        // read
//        repeat(1) @(negedge clk);
//        rd = 1'b1;
//        @(negedge clk)
//        rd = 1'b0;
        
//        // read
//        repeat(1) @(negedge clk);
//        rd = 1'b1;
//        @(negedge clk)
//        rd = 1'b0;
        
//        // read
//        repeat(1) @(negedge clk);
//        rd = 1'b1;
//        @(negedge clk)
//        rd = 1'b0;
        
//        // read
//        repeat(1) @(negedge clk);
//        rd = 1'b1;
//        @(negedge clk)
//        rd = 1'b0;
        
//        // read
//        repeat(1) @(negedge clk);
//        rd = 1'b1;
//        @(negedge clk)
//        rd = 1'b0;
        
//        //write
//        @(negedge clk);
//        w_data = 8'b1101_0100;
//        wr = 1'b1;     
//        @(negedge clk);
//        wr = 1'b0;
        
//        // read
//        repeat(1) @(negedge clk);
//        rd = 1'b1;
//        @(negedge clk)
//        rd = 1'b0;
        
//        // read
//        repeat(1) @(negedge clk);
//        rd = 1'b1;
//        @(negedge clk)
//        rd = 1'b0;
        
        //read and write
        repeat(1) @(negedge clk);
        w_data = 8'b1111_0000;
        wr = 1'b1;
        rd = 1'b1;
        @(negedge clk)
        wr = 1'b0;
        rd = 1'b0;
        
        //read and write
        repeat(1) @(negedge clk);
        w_data = 8'b1001_0110;
        wr = 1'b1;
        rd = 1'b1;
        @(negedge clk)
        wr = 1'b0;
        rd = 1'b0;
        
        //read and write
        repeat(1) @(negedge clk);
        w_data = 8'b1010_0101;
        wr = 1'b1;
        rd = 1'b1;
        @(negedge clk)
        wr = 1'b0;
        rd = 1'b0;
        
        //read and write
        repeat(1) @(negedge clk);
        w_data = 8'b1101_0010;
        wr = 1'b1;
        rd = 1'b1;
        @(negedge clk)
        wr = 1'b0;
        rd = 1'b0;
        
        //read and write
        repeat(1) @(negedge clk);
        w_data = 8'b0000_1111;
        wr = 1'b1;
        rd = 1'b1;
        @(negedge clk)
        wr = 1'b0;
        rd = 1'b0;
        
        //read and write
        repeat(1) @(negedge clk);
        w_data = 8'b1000_0111;
        wr = 1'b1;
        rd = 1'b1;
        @(negedge clk)
        wr = 1'b0;
        rd = 1'b0;
        
        //read and write
        repeat(1) @(negedge clk);
        w_data = 8'b0101_1010;
        wr = 1'b1;
        rd = 1'b1;
        @(negedge clk)
        wr = 1'b0;
        rd = 1'b0;
        
        //read and write
        repeat(1) @(negedge clk);
        w_data = 8'b0110_1011;
        wr = 1'b1;
        rd = 1'b1;
        @(negedge clk)
        wr = 1'b0;
        rd = 1'b0;
        
        //read and write
        repeat(1) @(negedge clk);
        w_data = 8'b0100_1001;
        wr = 1'b1;
        rd = 1'b1;
        @(negedge clk)
        wr = 1'b0;
        rd = 1'b0;
        

        
//        // read
//        repeat(1) @(negedge clk);
//        rd = 1'b1;
//        @(negedge clk)
//        rd = 1'b0;
        
//        // read
//        repeat(1) @(negedge clk);
//        rd = 1'b1;
//        @(negedge clk)
//        rd = 1'b0;
        
//        // read
//        repeat(1) @(negedge clk);
//        rd = 1'b1;
//        @(negedge clk)
//        rd = 1'b0;
        
        repeat(3) @(negedge clk);
        $stop;
    end   
endmodule
