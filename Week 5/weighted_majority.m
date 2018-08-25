function [predictions] = weighted_majority(expertsPredictions,outcomes, beta)
%weighted_majority(expertsPredictions, outcomes, beta) generates
%predictions produced by the weighted majority algorithm given
%expertsPredictions(this is a matrix whose lines are sequences of
%predictions), outcomes and bets

%whats_predicted = weighted_majority(expertsPredictions,beta);
[N, T] = size(expertsPredictions);
weights= ones(N,1);%initialise the parameters
counter_0=0;
counter_1=0;
predictions =zeros(0,T);

    for t = 1:T%outer loop loops through time sequentially
        for n = 1:N
            if expertsPredictions(n,t)==0%two seperate counters used so that they are later compared
                counter_0=counter_0+weights(n);%updates the sum of weights  
            else 
                counter_1=counter_1+weights(n);
            end
        end

        if counter_1 >= counter_0
            predictions(t)=1;%gives a prediction of 1 if the sum of weights for 1 is larger or equal to the sum of weights for 0
        else
            predictions(t)=0;
        end
        
    counter_0=0;
    counter_1=0;


        for n = 1:N
            if outcomes(t) ~= expertsPredictions(n,t)%updates the weights if an expert makes a mistake (checked that implemented correctly
                weights(n) = beta * weights(n);%
            end
        end
        
    end%end outer loop
    
end%end function

