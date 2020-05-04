%% This file is distributed under BSD (simplified) license
%% Author: Behrad Soleimani <behrad@umd.edu>

function [f,grad,X,y] = DualSVM(N,m)
    % This function generates objective function of dual soft-SVM problem
    % along with its gradient.
    
    % Inputs:
    % N  = # of data points
    % m  = # of features/parameters 

    % Outputs:
    % f     = logistic regression function
    % grad  = gradient of logistic regression function
    % X     = data points
    % y     = labels
    % ---------------------------------------------------------------------


    c = 2;
    X = [c*ones(m,1) + randn(m,N/2) , -c*ones(m,1) + randn(m,N/2)];
    y = [-ones(1,N/2),ones(1,N/2)];
    
    ftemp = @(w) repmat(w'.*y,m,1).*X;    
    f = @(w) 0.5*sum(sum(ftemp(w)'*ftemp(w))) - sum(w);
    
    
    gtemp = @(w) 0.5*sum(ftemp(w),2);

    grad  = @(w) ftemp(ones(N,1))'*gtemp(w) + sum(w'.*(X.^2) , 1)' - 1;
end

