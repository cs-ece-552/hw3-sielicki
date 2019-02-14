module fullAdder_1b_bench;
   wire Clk, rst, err;
   reg A, B, C_in;
   wire S, C_out;
   
   clkrst my_clkrst( .clk(Clk), .rst(rst), .err(err));
   fullAdder_1b a(/*AUTOINST*/
		  // Outputs
		  .S			(S),
		  .C_out		(C_out),
		  // Inputs
		  .A			(A),
		  .B			(B),
		  .C_in			(C_in));

   initial begin
      A = 1'b0;
      B = 1'b0;
      C_in = 1'b0;
      #3200 $finish;
   end // initial
   
   always @(posedge Clk) begin
      C_in <= (C_in ^ (A & B));
      B <= (B ^ A);
      A <= ~A;
     end // always@ (*)

   always @(negedge Clk) begin
      case (S)
	2'b0 :
	  if ((A & ~B & ~C_in) || (~A & B & ~C_in) || (~A & ~B & C_in) || (A & B & C_in))
	    $display ("Error: Sum=0");
	2'b1 :
	  if ((A & B & ~C_in) || (~A & B & C_in) || (A & ~B & C_in) || (~A & ~B & ~C_in))
	    $display ("Error: Sum=1");
      endcase // case (S)

      case (C_out)
	2'b0 :
	  if ((~A & B & C_in) || (A & ~B & C_in) || (A & B & ~C_in) || (A & B & C_in))
	    $display ("Error: C_out=0");
	2'b1 :
	  if ((~A & ~B & ~C_in) || (~A & ~B & C_in) || (~A & B & ~C_in) || (A & ~B & ~C_in))
	    $display ("Error: C_out=1");
      endcase // case (C_out)
   end // always @ (negedge Clk)

endmodule
