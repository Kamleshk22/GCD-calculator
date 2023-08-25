module gcd_testbench();
    reg [15:0] data_in;
    reg clk, start;
    wire done;
    
    reg [15:0] A, B;
    
    gcd_datapath DP (lt, gt, eq, ldA, ldB, sel1, sel2, sel_in, data_in, clk);
    gcd_controlpath CON (ldA, ldB, sel1, sel2, sel_in, done, clk, lt, gt, eq, start);
    
    initial begin
        clk= 1'b0;
        #3 start = 1'b1;
        #1000 $finish;
    end
    
    always #5 clk = ~clk;
    
    initial begin
        #12 data_in = 143;
        #10 data_in = 78;
    end
    
    initial begin
        $monitor ($time, "%d %b", DP.Bout, done);
        $monitor ($time, " %d %b", DP.Aout, done); 
      $dumpfile ("gcd_datapath.vcd"); $dumpvars (0, gcd_testbench);
    end
    
endmodule