%% This file is distributed under BSD (simplified) license
%% Author: Behrad Soleimani <behrad@umd.edu>

function [x, res] = GradDescent_Nesterov(f, grad, x0, max_iterations, tol)
    % This function implements Nesterov accelerated gradient descent 
    % algorithm.
    
    % Inputs:
    % f                = objective function
    % grad             = gradient of objective function
    % x0               = initial point
    % MaxIterations    = maximum number of iterations (def. = 1e4)
    % Tol              = convergence tolerance (def. = 1e-4)

    % Outputs:
    % x     = converged solution
    % res   = norm of the residual error
    % ---------------------------------------------------------------------

    if nargin < 5
        tol = 1e-4;
    end
    
    if nargin < 4
        max_iterations = 1e4;
    end

    res = [];
    L = LipschitzEstimation(grad, x0);
    tau = 0.5/L;
%     alpha = 0.5;
    lastx = x0;
    lasty = x0;
    lastdelta = 1;
    
    for i = 1 : max_iterations
        d = -grad(lasty);
%         while (f(lasty + tau*d)>= f(lasty) - alpha*tau*(norm(d)^2))
%             tau = tau / 2
%         end

        x = lasty + tau*d;
        delta = (1 + sqrt(1 + 4*lastdelta^2))/2;
        y = x + (lastdelta-1)/(delta)*(x-lastx);
        
        if (norm(grad(x)) < norm(grad(x0))*tol)
            break;
        end
        
        lastx = x;
        lasty = y;
        lastdelta = delta;
        
        res = [res,norm(grad(x))];
    end
end

