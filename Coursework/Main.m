One_a = (0.4 * 0.7 * 0.6 ) *( 0.1*0.4*0.4);

%M = [0.3 0.7; 0.6 0.4 ];
%B = [0.2 0.3 0.4 0.1; 0.4 0.1 0.2 0.3];
%P = [0.4 ;0.6];
%v = [4 1 3];

B = dlmread("B.txt");
M = dlmread("M.txt");
P = dlmread("p.txt");
v = dlmread("v.txt");

alpha = alpha_dynamic(M, B, P, v);
%beta=beta_dynamic(M, B, P, v);
%gamma=gamma_dynamic(alpha, beta); 

%alpha =zeros(length(P),length(v));
    
%prob_v_given_s_j = zeros(length(P),length(P),length(v));%there are t: length p by width p matrix corresponding to t=1,t=2,...t=T
%matrices that are diagonal such that matrix multipliction is possible 
 





