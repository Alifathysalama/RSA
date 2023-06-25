module Multiplayer #(
    parameter WIDTH = 6
)(
    input clk,
    input reset,
    input [WIDTH-1:0] Data,
    input Continue,
    input Start,
    input [WIDTH-1:0] Data_Bram,
    output reg [WIDTH-1:0] count,
    output reg [(2*WIDTH)-1:0] Out_mul
);


    always @(posedge clk ) begin
        if (reset) begin
            count =0;
        end
        else begin
          if (Start && Continue) begin
            Out_mul= Data * Data;
            count = count + 1;
          end
          else if (Continue) begin
            Out_mul = Data_Bram * Data;
            count = count + 1;
          end
          else begin
            count = 0 ;
          end
        end
    end

endmodule