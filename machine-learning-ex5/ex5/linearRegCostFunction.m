function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%


h = X * theta;
J = sum((h - y) .^ 2) / (2 * m);
J = J + lambda * sum(theta(2:end , :) .^ 2) / (2 * m);

% theta = [0 ; theta(2:end , :)];
% for j = 1:size(X , 2)
%     grad(j , :) = sum((h - y) .* X(: , j)) / m + lambda * theta(j , :) / m;
% end


grad = 1 / m * X' * (X * theta - y);

theta_tmp = [0;theta(2:end)];
grad = grad + lambda / m * theta_tmp;


% =========================================================================

grad = grad(:);

end
