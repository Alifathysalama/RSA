module RSA_tb;

parameter clk_period = 10 ; 

reg  clk_tb = 0 ;
always #(clk_period/2) clk_tb = ~clk_tb; 

reg reset_tb;
wire Done_tb;
reg [5:0] Data_tb,Key_tb,N_tb;
wire [5:0] Result_tb;

RSA RSA_test (
    .clk(clk_tb),
    .reset(reset_tb),
    .Data(Data_tb),
    .Key(Key_tb),
    .N(N_tb),
    .Result(Result_tb),
    .Done(Done_tb)
);

task crypto(
    input reg [5:0] N_test,
    input reg [5:0] Data_test,
    input reg [5:0] key_test
); begin 
    N_tb = N_test;
    Key_tb = key_test ; 
    Data_tb = Data_test;
end
endtask

initial begin
  reset_tb = 1 ;
  crypto(28,28,60);
  #(clk_period);
  reset_tb = 0;
  #((2*Key_tb)*clk_period);
  $stop;
end

initial begin
    $monitor("N_tb =%d , Data_tb =%d , Key_tb=%d so i expect Result_tb=%d ",N_tb,Data_tb,Key_tb,Result_tb);
end

endmodule