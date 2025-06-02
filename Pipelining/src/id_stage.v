
module id_stage(input clk, input [31:0] instr, output reg [4:0] rs1, rs2, rd);
    always @(*) begin
        rs1 = instr[19:15];
        rs2 = instr[24:20];
        rd  = instr[11:7];
    end
endmodule
