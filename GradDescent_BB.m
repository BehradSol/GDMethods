%% This file is distributed under BSD (simplified) license
%% Author: Behrad Soleimani <behrad@umd.edu>

function [x, res] = GradDescent_BB(f, grad, x0, max_iterations, tol)
    % This function implements gradient descent algorithm, Barzilai-Borwein
    % (BB) version, with (backtracking) line search (Armijo condition).
    
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
    tau = 10/L;
    alpha = 0.1;
    lastx = x0;
    
    for i = 1 : max_iterations
        d = -grad(lastx);

        while (f(lastx + tau*d)>= f(lastx) - alpha*tau*(norm(d)^2) && tau > 1e-6)
            tau = tau / 2;
        end
        x = lastx + tau*d;

        if (norm(grad(x)) < norm(grad(x0))*tol)
            break;
        end

        tau = tau*norm(d)^2 / sum(d.*(grad(x)+d));
        
        lastx = x;
        
        res = [res,norm(grad(x))];
    end
end

