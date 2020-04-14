%% This file is distributed under BSD (simplified) license
%% Author: Behrad Soleimani <behrad@umd.edu>

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