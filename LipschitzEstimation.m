%% This file is distributed under BSD (simplified) license
%% Author: Behrad Soleimani <behrad@umd.edu>

function [L] = LipschitzEstimation(g, x)
    % This function estimates Lipschitz constant of function g.
    
    % Inputs:
    % g  = the function
    % x  = an initial vector on the domain of the function g 

    % Outputs:
    % L  = estimated Lipschitz constant
    % ---------------------------------------------------------------------

    L = 1e10;
    for i = 1 : 100
        y = x + randn(size(x));
        Ltemp = norm(g(x) - g(y))/norm(x-y);
        if (Ltemp < L)
            L = Ltemp;
        end
    end
end