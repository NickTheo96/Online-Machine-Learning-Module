function [gamma] = gammamatrix(alpha, beta) 
    gamma =[0 0 0; 0 0 0];
    for t = 1:3
        for i = 1:2
            gamma(i,t)=(alpha(i,t)*beta(i,t))/((alpha(1,t)*beta(1,t)+(alpha(2,t)*beta(2,t))));
        end
    end
end
