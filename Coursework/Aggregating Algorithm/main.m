data_matrix = dlmread("tennis1.txt");%load in the data into a matrix

tennis_data(:,1) = data_matrix(:,4);
tennis_data(:,2) = data_matrix(:,6);
tennis_data(:,3) = data_matrix(:,8);
tennis_data(:,4) = data_matrix(:,10);%create a new matrix of the 4 columns actually used

weights = [0.25,0.25,0.25,0.25];%initialise weights to user select value



gamma = AA_prediction(tennis_data,weights);%runs the AA predictions function on the data to produce the 
%gamma matrix
    

AA_total_loss =0;%initialize the total loss of the AA to 0

for t = 1:length(tennis_data)
    AA_total_loss = AA_total_loss + gamma(t);%simple loop to calculate AA cumulative loss
end
    