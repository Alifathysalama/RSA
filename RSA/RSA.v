module RSA #(
   parameter WIDTH = 6
)(
    input clk,
    input reset,
    input [WIDTH-1:0] Data,
    input [5:0] Key,
    input [WIDTH-1:0] N,
    output [WIDTH-1:0] Result,
    output Done
);
    wire Continue,Start;
    wire [WIDTH-1:0] Data_Bram, count;
    wire [(2*WIDTH)-1:0] out_mul;

    Out out_RSA(
        .Continue(Continue),
        .Data_Bram(Data_Bram),
        .valid(Done),
        .out(Result)
    );

    BRAM Bram(
        .clk(clk),
        .Continue(Continue),
        .N(N),
        .Data_Bram(Data_Bram),
        .out_mul(out_mul)
    );

    Multiplayer MUlt(
        .clk(clk),
        .reset(reset),
        .Data(Data),
        .Continue(Continue),
        .Start(Start),
        .Data_Bram(Data_Bram),
        .count(count),
        .Out_mul(out_mul)
    );

    Counter COUN(
        .count(count),
        .Key(Key),
        .reset(reset),
        .clk(clk),
        .Start(Start),
        .Continue(Continue)
    );


endmodule