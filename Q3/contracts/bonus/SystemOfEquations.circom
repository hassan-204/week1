pragma circom 2.0.0;

include "../../node_modules/circomlib/circuits/comparators.circom";
include "../../node_modules/circomlib-matrix/circuits/matAdd.circom"; 
include "../../node_modules/circomlib-matrix/circuits/matElemMul.circom"; 




template MultiplierInitial (){
   signal input a;
   signal input b;
   signal output out;

   out <== a*b;

}


template SystemOfEquations(n) { // n is the number of variables in the system of equations
    signal input x[n]; // this is the solution to the system of equations
    signal input A[n][n]; // this is the coefficient matrix
    signal input b[n]; // this are the constants in the system of equations
    signal output out; // 1 for correct solution, 0 for incorrect solution
    signal output isEqOutputs[n];

component isEq[3];
component add[90];
component mul[90];  

var total = 0; 
var resultOfOut = 1;

var r = 0;
 
while (r<6){ 
for(var i=0; i<3; i++){
    for(var j=0; j<3; j++){
    component add[r] = matAdd(i, j); 
    component mul[r] = matElemMul(i, j);
    mul[r].a <== x;
    mul[r].b <== A;

    r++;

    //total += A[i][j] * x[j];
}
}
}

out === 1;
}






component main {public [A, b]} = SystemOfEquations(3);