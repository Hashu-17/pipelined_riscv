
module forwarding_unit(input [4:0] ex_rs1, ex_rs2, mem_rd, wb_rd, input mem_reg_write, wb_reg_write,
                       output reg [1:0] forward_a, forward_b);
    always @(*) begin
        forward_a = 2'b00;
        forward_b = 2'b00;
        if (mem_reg_write && (mem_rd != 0) && (mem_rd == ex_rs1))
            forward_a = 2'b10;
        else if (wb_reg_write && (wb_rd != 0) && (wb_rd == ex_rs1))
            forward_a = 2'b01;
        if (mem_reg_write && (mem_rd != 0) && (mem_rd == ex_rs2))
            forward_b = 2'b10;
        else if (wb_reg_write && (wb_rd != 0) && (wb_rd == ex_rs2))
            forward_b = 2'b01;
    end
endmodule
