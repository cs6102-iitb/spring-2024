`timescale 1ns/1ps
module tb_combinational_karatsuba;

parameter N = 16;

reg clk;
reg rst;

reg [N-1:0] X;
reg [N-1:0] Y;

wire [(2*N - 1):0] Z;

reg [N:0] i;
reg [N:0] j;

initial begin
    $display("time\t, clk\t rst\t, X\t, Y\t, Z\t ");
    $monitor ("%g\t %b\t   %b\t     %d\t      %d\t      %d\t   ", $time, clk, rst, X, Y, Z);

    clk = 1;
    rst = 0;

    #10 rst = 1;
    #10 rst = 0;

    for (i=0; i<1000; i=i+1) begin
        for (j=0; j<10; j=j+1) begin
            X = i;
            Y = 4294967295;
            #10;
            if (Z != X*Y) begin
                $display("ERROR");
                $finish;
            end
        end
    end

    #20
    #5 $finish;
end

always begin
    #5 clk = ~clk;
end

combinational_karatsuba dut(.X(X), .Y(Y), .Z(Z));

initial begin
    $dumpfile("combinational_karatsuba.vcd");
    $dumpvars(0,tb_combinational_karatsuba);
end

endmodule
