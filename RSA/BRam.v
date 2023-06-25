module BRAM #(
    parameter WIDTH = 6
)(
    input clk,
    input Continue,
    input [WIDTH-1:0] N,
    input [(2*WIDTH)-1:0] out_mul,
    output reg [WIDTH-1:0] Data_Bram
);

   // reg [WIDTH-1:0] BRAM [(2**WIDTH)-1:0] ;
    reg [(2*WIDTH)-1:0] rem ; 

    //integer i ;
    /*initial begin
        for( i =0 ; i < 64 ; i = i+1) begin
          BRAM[i] = i;
        end
    end*/
    always @(*) begin
        rem = out_mul / N;
    end
    always @(*) begin
        if(!rem) begin
          Data_Bram = rem; 
        end 
        else if(Continue) begin
          Data_Bram = out_mul-(rem*N);
        end
    end
endmodule