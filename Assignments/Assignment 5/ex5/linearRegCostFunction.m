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

% Calculate cost function
h = X*theta;            % mXj * jX1 = mX1
theta(1) = 0;           % theta(1) can be chagned now.
error = y-h;            % mX1
error_sqr = error.^2;   % mX1
J_unreg = sum(error_sqr)/(2*m);
J_reg = lambda * sum(theta.^2)/(2*m);
J = J_unreg + J_reg;

% Calculate gradient

grad_unreg = X'*(h-y)/m;  %jXm * mX1 = jX1;
grad_reg = lambda*theta/m;
grad = grad_reg + grad_unreg;








% =========================================================================

grad = grad(:);

end
