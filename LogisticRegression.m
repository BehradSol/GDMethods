%% This file is distributed under BSD (simplified) license
%% Author: Behrad Soleimani <behrad@umd.edu>

function [f,grad] = LogisticRegression(N,m)
    % This function generates objective function of a logistic regression
    % problem along with its gradient.
    
    % Inputs:
    % N  = # of data points
    % m  = # of features/parameters 

    % Outputs:
    % f     = logistic regression function
    % grad  = gradient of logistic regression function
    % ---------------------------------------------------------------------


    c = 1;
    X = [c*ones(m,1) + randn(m,N/2) , -c*ones(m,1) + randn(m,N/2)];
    y = [zeros(1,N/2),ones(1,N/2)];
    
     
    if (m <= 2)
        figure
        for i = 1 : N
            if (i <= N/2)
                plot(X(1,i),(m-1)*X(m,i),'rX')
            else
                plot(X(1,i),(m-1)*X(m,i),'bO')
            end
            hold on
        end
    end
    
    g = @(z) 1./(1 + exp(-z));

    f = @(w) -sum(y.*mylogg(g(w'*X))+(1-y).*mylogg(1-g(w'*X)));
    grad  = @(w) -sum( repmat(y - g(w'*X),m,1) .* X , 2);
end

function [gz] = mylogg(z)
    if (z <= 0)
        gz = z-log(exp(z) + 1);
    else
        gz = -log(1+exp(-z));
    end
end