function [beta] = beta_dynamic(M, B, P, v) 
    length_v = length(v);
    length_P = length(P);
    beta =zeros(length_P,length_v);%initialize the matrix 

    beta(:,length_v)=1;%initialise the final row with ones
        prob_v_given_s_j = zeros(length_P,length_P,length_v-1);%generate the diagonal matrix of v given s_t for 
        %t=length v, length v-1,...,1
    
    for t =1:length_v
        for j = 1:length_P
                prob_v_given_s_j(j,j,t)=B(j,v(length(v)+1-t));%a diagonal matrix for each iteration of t
        end
    end
    
    for t=1:length_v-1%iterates from right to left and calculates each row using a matrix equation
        beta(:,length_v-t) = M * prob_v_given_s_j(:,:,length_v-t) * beta(:,length_v+1-t);
    end   
    
end

