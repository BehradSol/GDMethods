# GDMethods
Gradient Descent Methods

Description: This repository contains implementations of different verions of gradient descent algorithms.

Copyright (c) 2020 Behrad Soleimani All Rights Reserved

Contact: behrad@umd.edu

Date: April 25, 2020

Requirements: implemented in Matlab R2019a version, but should run on most versions.

Contents: 
> main.m:       Master script. 

> GradDescent.m:       *Gradient descent with (beacktracking) line search*.

> GradDescent_BB.m:  Gradient descent with Barzilai-Borwein update.

> GradDescent_Nesterov.m:  Nesterov accelerated gradient descent.

> LipschitzEstimation.m:  Lipschitz constant estimation function.

> LogisticRegression.m:  Logistic regression objective function.

> GDMethods.pdf: Derivation and details.

Instructions: Simple and easy. Download all the codes in a directory and run main.m, that will generate one example described below. To use the functions individually, please look at the function descriptions. The derivations and details are also explained in .pdf file.

Example:

In this example, we assume that there are N<sub>y</sub>=3 observations, N<sub>x</sub>=5 sources, and T=50 time samples. The underlying source dynamic is considered as an vector auto-regressive process with 1 lag, i.e. VAR(1). The noise covariance matrix is also assumed to be diagonal.

In Fig.1, the estimated verions of the source #1, i.e. non-causal belifes p(x<sub>t</sub> | y<sub>1:T</sub>), and ground truth are compared. As it can be seen, the performance of the conventional filtering scheme (Kalman filtering) is almost the same as the EfficientFFBS. 


| ![](Figs/GD.png) | 
|:--:| 
| Fig 1. Comparison of the conventional filtering and EfficientFFBS |

