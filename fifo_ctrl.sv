`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2022 07:08:47 PM
// Design Name: 
// Module Name: fifo_ctrl
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


module fifo_ctrl
    #(parameter ADDR_WIDTH = 3)(
    input logic clk, reset,
    input logic wr, rd,
    output logic full, empty,
    output logic [ADDR_WIDTH - 1: 0] w_addr,
    output logic [ADDR_WIDTH - 1: 0] r_addr
    );
    
    logic [ADDR_WIDTH - 1: 0] wr_ptr, wr_ptr_next;
    logic [ADDR_WIDTH - 1: 0] rd_ptr, rd_ptr_next;
    
    logic full_next, empty_next;
    
    always_ff @(posedge clk, posedge reset)
    begin
        if(reset)
            begin
                wr_ptr <= 0;
                rd_ptr <= 0;
                full <= 0;
                empty <= 1;
            end
        else
            begin
                wr_ptr <= wr_ptr_next;
                rd_ptr <= rd_ptr_next;
                full <= full_next;
                empty <= empty_next;
            end
    end
    
    always_comb
    begin
    //defaults
    wr_ptr_next = wr_ptr;
    rd_ptr_next = rd_ptr;
    full_next = full;
    empty_next = empty;

    unique case({wr, rd})
        2'b01: //read
            begin
                if(!empty)
                    begin
                        if(wr_ptr - rd_ptr_next >= 2) //since write two spaces at a time, will be considered full until two spaces available
                            full_next = 1'b0;
                        rd_ptr_next = rd_ptr + 1;
                        if(rd_ptr_next == wr_ptr)
                            empty_next = 1'b1;
                    end
            end
        2'b10: //write
            begin
                if(!full)
                    begin
                        empty_next = 1'b0;
                        wr_ptr_next = wr_ptr + 2;   //need to move ptr two spaces since every write will take two address spaces
                        if(wr_ptr_next == rd_ptr) 
                            full_next = 1'b1;
                    end   
            end
        2'b11: //read and write simultaneously 
            begin
                if(empty)
                    begin
                        empty_next = 1'b0;      //no longer empty since can only read half of write
                        wr_ptr_next = wr_ptr + 2;
                        //keep read ptr in palce for first word fall thru
                        //will result in one more read input needed
                        //change to rd_ptr + 1 if extra input not acceptable will no longer be fwft
                        rd_ptr_next = rd_ptr;   
                    end
                else
                    begin
                        //same read protocol as before
                        //cant be empty since writing at the same time
                        rd_ptr_next = rd_ptr + 1;
                        if(wr_ptr - rd_ptr_next > 1) 
                            full_next = 1'b0;
                        if(rd_ptr_next == wr_ptr)
                            empty_next = 1'b1;
                        //same write protocol as before
                        if(!full)
                            begin
                                empty_next = 1'b0;
                                wr_ptr_next = wr_ptr + 2;  
                                if(wr_ptr_next == rd_ptr) 
                                    full_next = 1'b1;
                            end
                    end
            end
        default: ;//if no read or write do nothing
    endcase 
    end
    
    //outputs
    assign w_addr = wr_ptr;
    assign r_addr = rd_ptr;
endmodule

