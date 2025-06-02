
module control_unit(input [6:0] opcode, output reg mem_read, mem_write, alu_src, reg_write, mem_to_reg);
    always @(*) begin
        case (opcode)
            7'b0000011: begin // Load
                mem_read = 1; mem_write = 0; alu_src = 1;
                reg_write = 1; mem_to_reg = 1;
            end
            7'b0100011: begin // Store
                mem_read = 0; mem_write = 1; alu_src = 1;
                reg_write = 0; mem_to_reg = 0;
            end
            default: begin
                mem_read = 0; mem_write = 0; alu_src = 0;
                reg_write = 1; mem_to_reg = 0;
            end
        endcase
    end
endmodule
