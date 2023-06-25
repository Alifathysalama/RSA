module Out #(
    parameter WIDTH = 6
)(
    input Continue,
    input [WIDTH-1:0] Data_Bram,
    output reg valid,
    output reg [WIDTH-1:0] out
);
    always @(*) begin
        if(!Continue) begin
          valid <= 1;
          out <= Data_Bram;
        end
    end

endmodule