
module register_file(input clk, input reg_write, input [4:0] rs1, rs2, rd, input [31:0] write_data,
                     output [31:0] read_data1, read_data2);
    reg [31:0] regs [0:31];
    assign read_data1 = regs[rs1];
    assign read_data2 = regs[rs2];
    always @(posedge clk) begin
        if (reg_write)
            regs[rd] <= write_data;
    end
endmodule
