%% This file is distributed under BSD (simplified) license
%% Author: Behrad Soleimani <behrad@umd.edu>

clc
clear
close all

%% Logistic regression

% N = 100;
% m = 3;
% [f,grad] = LogisticRegression(N,m);
% 
% w0 = zeros(m,1);
% 
% [~, res] = GradDescent(f, grad, w0);
% [~, res_BB] = GradDescent_BB(f, grad, w0);
% [~, res_Nesterov] = GradDescent_Nesterov(f, grad, w0);
% 
% figure
% semilogy(res,'k--','LineWidth',2)
% hold on
% semilogy(res_BB,'b-.','LineWidth',2)
% semilogy(res_Nesterov,'r','LineWidth',2)
% legend('Gradient Descent','Gradient Descent-BB','Gradient Descent-Nesterov')
% 
% grid on
% xlabel('# of iterations')
% ylabel('Residual error')


%% Soft-SVM

N = 100;
m = 2;
[f,grad,X,y] = DualSVM(N,m);

if (m <= 2)
    for i = 1 : N
        if (i <= N/2)
            plot(X(1,i),(m-1)*X(m,i),'rX','MarkerSize',7,'Linewidth',2)
        else
            plot(X(1,i),(m-1)*X(m,i),'bO','MarkerSize',7,'Linewidth',2)
        end
        hold on
    end
end
axis('square')
C = 5;
w0 = rand(N,1);
A = [eye(N);-eye(N)];
b = [C*ones(N,1);zeros(N,1)];
Aeq = y;
beq = 0;

[alpha, ~] = ProjGradDescent(f, grad, w0, A, b, Aeq, beq);
w = sum(repmat(alpha'.*y,m,1).*X,2);
if (m == 2)
    hold on
    x = min(X(1,:)):0.1:max(X(1,:));
    y = -w(1)/w(2)*x;
    plot(x,y,'--k','Linewidth',5)
end
set(gca,'xtick',[])
set(gca,'ytick',[])

axis([min(X(1,:)),max(X(1,:)),min(X(2,:)),max(X(2,:))])

xlabel('Feature \#1 $$(x_1)$$', 'Interpreter', 'LaTeX','FontSize',20,'FontWeight','bold')
ylabel('Feature \#2 $$(x_2)$$', 'Interpreter', 'LaTeX','FontSize',20,'FontWeight','bold')

