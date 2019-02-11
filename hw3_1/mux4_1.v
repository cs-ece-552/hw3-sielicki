/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 1

    4-1 mux template
*/

module mux4_1(InA, InB, InC, InD, S, Out);
   input        InA, InB, InC, InD;
   input [1:0] 	 S;
   output 	 Out;

   wire 	 m1, m2;

   mux2_1 a(InA, InB, S[0], m1);
   mux2_1 b(InC, InD, S[0], m2);
   mux2_1 c(m1, m2, S[1], Out);
   
endmodule
