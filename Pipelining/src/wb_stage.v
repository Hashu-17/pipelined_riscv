
module wb_stage(input [31:0] alu_result, mem_data, input mem_to_reg, output reg [31:0] write_back_data);
    always @(*) begin
        write_back_data = mem_to_reg ? mem_data : alu_result;
    end
endmodule
