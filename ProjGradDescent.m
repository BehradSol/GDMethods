%% This file is distributed under BSD (simplified) license
%% Author: Behrad Soleimani <behrad@umd.edu>

function [x, res] = ProjGradDescent(f, grad, x0, A, b, Aeq, beq, max_iterations, tol)
    % This function implements projected gradient descent algorithm with 
    % (backtracking) line search (Armijo condition).
    
    % Inputs:
    % f                = objective function
    % grad             = gradient of objective function
    % x0               = initial point
    % A,b              = coressponding matrices for inequality constraint
    %                    A*x <= b   
    % Aeq,beq          = coressponding matrices for equality constraint
    %                    Aeq*x = beq   
    % MaxIterations    = maximum number of iterations (def. = 1e4)
    % Tol              = convergence tolerance (def. = 1e-4)

    % Outputs:
    % x     = converged solution
    % res   = norm of the residual error
    % ---------------------------------------------------------------------

    if nargin < 9
        tol = 1e-4;
    end
    
    if nargin < 8
        max_iterations = 1e1;
    end

    res = [];
    L = LipschitzEstimation(grad, x0);
    tau = 10/L;
    alpha = 0.1;
    lastx = x0;
    
    for i = 1 : max_iterations
        d = -grad(lastx);
        while (f(lastx + tau*d)>= f(lastx) - alpha*tau*(norm(d)^2) && tau > 1e-4)
            tau = tau / 2;
        end
        x = lastx + tau*d;
        x = fmincon(f,x,A,b,Aeq,beq);
        if (norm(grad(x)) < norm(grad(x0))*tol)
            break;
        end
        lastx = x;
        res = [res,norm(grad(x))];
    end
end
