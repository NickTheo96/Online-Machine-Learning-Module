function [alpha] = alphamatrix(M, B, P, x_seq, alpha) 
    alpha(:,1) = [B(1,x_seq(1)) 0; 0 B(2,x_seq(1))]*P;
    for t = 2:3
        alpha(:,t) =[B(1,x_seq(t)) 0 ;0 B(2,x_seq(t))] * M.' * alpha(:,t-1);
    end
end

