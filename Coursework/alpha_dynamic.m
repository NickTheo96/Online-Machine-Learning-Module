function [alpha] = alpha_dynamic(M, B, P, v) 
    length_v = length(v);%for some reason these lengths must be speficified before creating the emplty matrix
    length_P = length(P);
    
    alpha =zeros(length_P,length_v);%initialize the alpha matrix to the correct size
    
    prob_v_given_s_j = zeros(length(P),length(P),length(v));%there are t: length p by width p matrix corresponding to t=1,t=2,...t=T
    %matrices that are diagonal such that matrix multipliction is possible 

    
    for t = 1:length(v)%outer loop over t for each iteration of the next rows of alpha calculated
        for j = 1:length(P)
            prob_v_given_s_j(j,j,t)=B(j,v(t));%a diagonal matrix for each iteration of t
        end
    end

    alpha(:,1) = prob_v_given_s_j(:,:,1)*P;%generate the first column of alphas using the initial probabilites

    for t = 2:length(v)
        alpha(:,t) =prob_v_given_s_j(:,:,t) * M.' * alpha(:,t-1);%generate the subsequent columns  using the previous colum of alpha
    end
end

