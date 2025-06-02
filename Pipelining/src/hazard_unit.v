
module hazard_unit(input [4:0] id_rs1, id_rs2, ex_rd, input ex_mem_read, output reg stall);
    always @(*) begin
        stall = (ex_mem_read && ((ex_rd == id_rs1) || (ex_rd == id_rs2))) ? 1 : 0;
    end
endmodule
