module Counter #(
    parameter WIDTH = 6
)(
    input [WIDTH-1 : 0 ] count,
    input [WIDTH-1 : 0] Key,
    input clk,
    input reset,
    output reg Start,
    output reg Continue
);
    always @(posedge clk) begin
        if (reset) begin
            Continue = 1;
            Start = 1;
        end
        else begin
            Start = 0;
            if (count == Key-1) begin
                Continue = 0 ;
            end
        end
    end

endmodule