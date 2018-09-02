data_matrix = dlmread("tennis1.txt");
tennis_data(:,1) = data_matrix(:,4);
tennis_data(:,2) = data_matrix(:,6);
tennis_data(:,3) = data_matrix(:,8);
tennis_data(:,4) = data_matrix(:,10);

weights = [0.25,0.25,0.25,0.25];%initialise weights


    length_tennis_data = length(tennis_data);
    length_weights = length(weights);
    sum_weights=0;
    g_0=0;
    g_1=0;
    ita = 2;
    p =zeros(1,length_weights);%initialize the p matrix 
    gamma=zeros(length_tennis_data,1);
    
for t = 1:588
    

    for n = 1:length(weights)
       sum_weights = sum_weights + weights(n);
    end

    for n = 1:length(weights)
        p(n) = weights(n)/sum_weights;
    end
    
    for n = 1:length(weights)
    g_0= g_0 + (log(p(n)) * exp(-ita*(tennis_data(t,n)^2)));
    g_1= g_1 + (log(p(n)) * exp(-ita*(1-tennis_data(t,n)^2)));
    end
    
    g_0=(-1/ita) * g_0;
    g_1=(-1/ita) * g_1;
    
    gamma(t)=0.5-((0.5)*(g_1-g_0));
    
    
    for n = 1:length(weights)
        weights(n)=weights(n)*exp((-ita*(1-tennis_data(t,n)^2)));
    end
    
    g_0=0;
    g_1=0;
    sum_weights=0;
    
end
    