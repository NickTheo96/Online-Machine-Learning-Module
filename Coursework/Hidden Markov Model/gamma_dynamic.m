function [gamma] = gamma_dynamic(alpha, beta) 
    [length_P,length_v] = size(alpha);
    gamma =zeros(length_P,length_v);%initialize the matrix 
    sum =zeros(length_v);

    for t = 1:length_v
        for i=1:length_P
            
            sum(t) = sum(t) + (alpha(i,t)*beta(i,t));
        end
    end
    
    for t = 1:length_v
        for i = 1:length_P
            gamma(i,t)=alpha(i,t)*beta(i,t)/sum(t);
        end
    end
    
end


 