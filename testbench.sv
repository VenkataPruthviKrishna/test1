// Code your testbench here
// or browse Examples
//----------------
// 7. testbench	|
//----------------
module above_test;
reg start, clk;
reg [15:0] data_in;
wire done;
wire eqz,ldA,ldB,ldP,clrP,decB;
  
datapath DP(eqz, ldA,ldB,ldP,clrP,decB, clk,data_in);
controller CON(ldA,ldB,ldP,clrP,decB,done, clk,eqz,start);

initial
	begin
		clk = 1'b0;
		#3 start=1'b1;
		#500 $finish;
	end
	
always #5 clk = ~clk;

initial
	begin
		#17 data_in = 17;
		#10 data_in = 5;
	end

initial
	begin
      $monitor($time," product = %d, multiplication_completed = %b", DP.P_out, done);
      $dumpfile("dump.vdc"); $dumpvars(0,above_test);
	end

endmodule