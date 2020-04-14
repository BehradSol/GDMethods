%% This file is distributed under BSD (simplified) license
%% Author: Behrad Soleimani <behrad@umd.edu>

function [x, res] = GradDescent_Nesterov(f, grad, x0, MaxIterations, Tol)
    if nargin < 5
        Tol = 1e-4;
    end
    
    if nargin < 4
        MaxIterations = 1e4;
    end

    res = [];
    L = LipschitzEstimation(grad, x0);
    tau = 0.5/L;
%     alpha = 05;
    lastx = x0;
    lasty = x0;
    lastdelta = 1;
    
    for i = 1 : MaxIterations
        d = -grad(lasty);
%         while (f(lasty + tau*d)>= f(lasty) - alpha*tau*(norm(d)^2))
%             tau = tau / 2
%         end

        x = lasty + tau*d;
        delta = (1 + sqrt(1 + 4*lastdelta^2))/2;
        y = x + (lastdelta-1)/(delta)*(x-lastx);
        
        if (norm(grad(x)) < norm(grad(x0))*Tol)
            break;
        end
        
        lastx = x;
        lasty = y;
        lastdelta = delta;
        
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