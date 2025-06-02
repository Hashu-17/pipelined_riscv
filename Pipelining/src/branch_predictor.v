
module branch_predictor(input [31:0] pc, input branch_taken, input update, output reg predict_taken);
    reg [1:0] predictor_table [0:255]; // 2-bit saturating counters
    wire [7:0] index = pc[9:2];
    always @(*) begin
        predict_taken = predictor_table[index][1];
    end
    always @(posedge update) begin
        if (branch_taken && predictor_table[index] != 2'b11)
            predictor_table[index] = predictor_table[index] + 1;
        else if (!branch_taken && predictor_table[index] != 2'b00)
            predictor_table[index] = predictor_table[index] - 1;
    end
endmodule
