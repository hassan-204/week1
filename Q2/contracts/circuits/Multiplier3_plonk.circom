pragma circom 2.0.0;

// [assignment] Modify the circuit below to perform a multiplication of three signals

// To bypass circom's restrictions, we will create another template, and we will use 
// its output in the second template to perform a multiplication of three inputs

template MultiplierInitial (){
   signal input a;
   signal input b;
   signal output out;

   out <== a*b;

}

template Multiplier3 () {  
   signal input a;
   signal input b;
   signal input c;
   signal output out;
   
   //Reference to the template components above
   component mult1 = MultiplierInitial();
   component mult2 = MultiplierInitial();

   // Initializing a and b as mult1.a and mult1.b
   // Then making their output as mult2.a, then setting the final output as
   // mult2.a by mult2.b, which is a * b * c
   
   mult1.a <== a;
   mult1.b <== b;
   mult2.a <== mult1.out;
   mult2.b <== c;
   out <== mult2.out;
}

component main = Multiplier3();