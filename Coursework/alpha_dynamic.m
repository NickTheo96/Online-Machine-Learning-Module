function [alpha] = alpha_dynamic(M, B, P, v) 
    length_v = length(v);
    alpha =[0 0 0; 0 0 0];
    
    alpha(:,1) = [B(1,v(1)) 0; 0 B(2,v(1))]*P;
    for t = 2:3
        alpha(:,t) =[B(1,v(t)) 0 ;0 B(2,v(t))] * M.' * alpha(:,t-1);
    end
end

