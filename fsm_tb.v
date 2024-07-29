module fsm_tb;

reg clk, reset, in;
wire out;

fsm uut (
    .clk(clk),
    .reset(reset),
    .in(in),
    .out(out)
);

initial begin
    clk = 0;
    reset = 1;
    in = 0;
    #5 reset = 0;
    #10 in = 1;
    #10 in = 0;
    #10 in = 1;
    #10 in = 0;
    #10 $finish;
end

always #5 clk = ~clk;

endmodule