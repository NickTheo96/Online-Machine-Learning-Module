One_a = (0.4 * 0.7 * 0.6 ) *( 0.1*0.4*0.4);

M = [0.3 0.7; 0.6 0.4 ];
B = [0.2 0.3 0.4 0.1; 0.4 0.1 0.2 0.3];
P = [0.4 ;0.6];
x_seq = [4 1 3];

alpha =[0 0 0; 0 0 0];
beta =[0 0 0; 0 0 0];
gamma =[0 0 0; 0 0 0];

alpha = alphamatrix(M, B, P, x_seq, alpha);

beta(1,3)=1;
beta(2,3)=1;

beta(1,2)=(beta(1,3)*M(1,1)*B(1,x_seq(3)))+(beta(2,3)*M(1,2)*B(2,x_seq(3)));
beta(2,2)=(beta(1,3)*M(2,1)*B(1,x_seq(3)))+(beta(2,3)*M(2,2)*B(2,x_seq(3)));

beta(1,1)=(beta(1,2)*M(1,1)*B(1,x_seq(2)))+(beta(2,2)*M(1,2)*B(2,x_seq(2)));
beta(2,1)=(beta(1,2)*M(2,1)*B(1,x_seq(2)))+(beta(2,2)*M(2,2)*B(2,x_seq(2)));

for t = 1:3
    for i = 1:2
        gamma(i,t)=(alpha(i,t)*beta(i,t))/((alpha(1,t)*beta(1,t)+(alpha(2,t)*beta(2,t))));
    end
end




