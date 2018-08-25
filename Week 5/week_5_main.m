expertsPredictions = [0 1 0 1; 1 1 1 0; 0 1 0 0];
outcomes = [0 1 1 0];
beta =0.5;

question_1_ans = weighted_majority(expertsPredictions, outcomes, beta);

