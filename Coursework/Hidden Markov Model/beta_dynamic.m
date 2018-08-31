function [beta] = beta_dynamic(M, B, P, v) 
    length_v = length(v);
    length_P = length(P);
    beta =zeros(length_P,length_v);%initialize the matrix 

    beta(:,length_v)=1;%initialise the final row with ones
        prob_v_given_s_j = zeros(length_P,length_P,length_v-1);%generate the diagonal matrix of v given s_t for 
        %t=length v, length v-1,...,1
    
    for t =length_v-1:-1:1%work out probability matrix from right to left using a matrix equation for the t th row of betas
        for i = 1:length_P
                prob_v_given_s_j(i,i,t)=B(i,v(t+1));%a diagonal matrix for each iteration of t
        end
    end
    
    for i = length_v-1:-1:1
        beta(:,i) = M * prob_v_given_s_j(:,:,i) * beta(:,i+1);%solve each row using a matrix equation
    end

    
end

