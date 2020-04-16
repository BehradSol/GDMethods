%% This file is distributed under BSD (simplified) license
%% Author: Behrad Soleimani <behrad@umd.edu>

clc
clear
close all


N = 1000;
m = 3;
[f,grad] = LogisticRegression(N,m);

w0 = zeros(m,1);

[~, res] = GradDescent(f, grad, w0);
[~, res_BB] = GradDescent_BB(f, grad, w0);
[~, res_Nesterov] = GradDescent_Nesterov(f, grad, w0);

figure
semilogy(res,'k--','LineWidth',2)
hold on
semilogy(res_BB,'b-.','LineWidth',2)
semilogy(res_Nesterov,'r','LineWidth',2)
legend('Gradient Descent','Gradient Descent-BB','Gradient Descent-Nesterov')

grid on
xlabel('# of iterations')
ylabel('Residual error')
axis('square')

