%% This file is distributed under BSD (simplified) license
%% Author: Behrad Soleimani <behrad@umd.edu>

function [x, res] = GradDescent_BB(f, grad, x0, MaxIterations, Tol)
    if nargin < 5
        Tol = 1e-4;
    end
    
    if nargin < 4
        MaxIterations = 1e4;
    end

    res = [];
    L = LipschitzEstimation(grad, x0);
    tau = 10/L;
    alpha = 0.1;
    lastx = x0;
    
    for i = 1 : MaxIterations
        d = -grad(lastx);

        while (f(lastx + tau*d)>= f(lastx) - alpha*tau*(norm(d)^2) && tau > 1e-20)
            tau = tau / 2;
        end
        x = lastx + tau*d;

        if (norm(grad(x)) < norm(grad(x0))*Tol)
            break;
        end

        tau = tau*norm(d)^2 / sum(d.*(grad(x)+d));
        
        lastx = x;
        
        res = [res,norm(grad(x))];
    end
end

function [L] = LipschitzEstimation(g, x)
    L = 1e10;
    for i = 1 : 100
        y = x + randn(size(x));
        Ltemp = norm(g(x) - g(y))/norm(x-y);
        if (Ltemp < L)
            L = Ltemp;
        end
    end
end