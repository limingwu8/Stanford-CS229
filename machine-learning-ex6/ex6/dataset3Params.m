function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
C = [0.1,0.5,1,2,5,10,20,50,100];
sigma = [0.1,0.3,0.6,1,1.5,5,10,20,50]
for i = 1:length(C)
   for j = 1:length(sigma)
       model= svmTrain(X, y, C(i), @(x1, x2) gaussianKernel(x1, x2, sigma(j)));
       predictions = svmPredict(model,Xval);
       errors(i,j) = mean(double(predictions~=yval));
   end
end

[M,I] = min(errors(:))
[I_row, I_col] = ind2sub(size(errors),I)

C = C(I_row);
sigma = sigma(I_col);

% =========================================================================

end
