pragma circom 2.0.0;

include "../../node_modules/circomlib/circuits/comparators.circom";

template RangeProof(n) {
    assert(n <= 252);
    signal input in; // this is the number to be proved inside the range
    signal input range[2]; // the two elements should be the range, i.e. [lower bound, upper bound]
    signal output out;

    component low = LessEqThan(n);
    component high = GreaterEqThan(n);

    low.in[0] <== range[0];
    low.in[1] <== in;
    low.out === 1;
    high.in[0] <== range[1];
    high.in[1] <== in;
    high.out === 1;



    out <-- (low.out + high.out) *1/2;
    out === 1;    
}

//component main = RangeProof(32);