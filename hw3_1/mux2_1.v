/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 1

    2-1 mux template
*/
module mux2_1(InA, InB, S, Out);
   input   InA, InB;
   input    S;
   output   Out;

   wire     NotS, MaxA, MaxB;
   
   not1 i(S, NotS);
   nand2 j(NotS, InA, MaxA);
   nand2 k(S, InB, MaxB);
   nand2 l(MaxA, MaxB, Out);
      
endmodule
