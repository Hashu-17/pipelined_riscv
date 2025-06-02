
module alu(input [31:0] a, b, input [3:0] op, output reg [31:0] result);
    always @(*) begin
        case (op)
            4'b0000: result = a + b;
            4'b0001: result = a - b;
            4'b0010: result = a & b;
            4'b0011: result = a | b;
            default: result = 0;
        endcase
    end
endmodule
