One_a = (0.4 * 0.7 * 0.6 ) *( 0.1*0.4*0.4);

M = [0.3 0.7; 0.6 0.4 ];
B = [0.2 0.3 0.4 0.1; 0.4 0.1 0.2 0.3];
P = [0.4 ;0.6];
x_seq = [4 1 3];

alpha = alphamatrix(M, B, P, x_seq);
beta=betamatrix(M, B, P, x_seq);
gamma=gammamatrix(alpha, beta); 

%- need to implement the Viterbi algorithm next (as a function)
%- need to then complete the first question in the coursework using similar
%functions



