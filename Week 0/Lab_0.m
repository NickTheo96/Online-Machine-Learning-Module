M_cubed = [0.77 0.18 0.05; 0.36 0.57 0.07; 0.47 0.37 0.16];
P_norm = [0.33 0.34 0.33];

M_damped_cubed = [0.05 0.475 0.475; 0.9 0.05 0.05; 0.05 0.9 0.05];
for i = 2:40
P_infinity = P_norm * M_damped_cubed^i;
end

sq_norm([3,2,3])%must define a function in a seperate .m file that is named the same as the function

x=0:pi/100:2*pi;
y=sin(x);
%plot(x,y);

A = [0.3 0.7; 0.4 0.6];
B = [1 2;1 1];

C = A / B;

L = [0 1 1; 1 0 0; 0 1 0];
Lnorm = L./repmat(sum(L,2),1,3);
M = 0.15*ones(3)/3+0.85*Lnorm;
[v, D] = eig(M');
u = v(:,1);
p = u/sum(u);
p;

%good examlpe of metropolis sampling
%https://theclevermachine.wordpress.com/tag/acceptance-probability/
a = min([1,(exp(-1^4)/exp(-0.5^4))])