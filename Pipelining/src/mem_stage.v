
module mem_stage(input clk, input mem_read, mem_write, input [31:0] addr, write_data, output reg [31:0] read_data);
    reg [31:0] memory [0:255];
    always @(posedge clk) begin
        if (mem_write)
            memory[addr >> 2] <= write_data;
        if (mem_read)
            read_data <= memory[addr >> 2];
    end
endmodule
