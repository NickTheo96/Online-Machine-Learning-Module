function [beta] = beta_dynamic(M, B, P, v) 
    beta =[0 0 0; 0 0 0];
    beta(:,3)=1;
    for i=2:-1:1
        beta(:,i) =M * [B(1,v(i+1)) 0 ;0 B(2,v(i+1))] * beta(:,i+1);
    end
end

