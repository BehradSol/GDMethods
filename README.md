# GDMethods
Gradient Descent Methods

Description: This repository contains implementations of different verions of gradient descent algorithm.

Copyright (c) 2020 Behrad Soleimani All Rights Reserved

Contact: behrad@umd.edu

Date: April 25, 2020

Requirements: implemented in Matlab R2019a version, but should run on most versions.

Contents: 
> main.m:       **Master script**. 

> GradDescent.m:       **Gradient descent with (backtracking) line search**.

> GradDescent_BB.m:  **Gradient descent with Barzilai-Borwein update**.

> GradDescent_Nesterov.m:  **Nesterov accelerated gradient descent**.

> ProjGradDescent.m:  **Projected Gradient descent**.

> LipschitzEstimation.m:  **Lipschitz constant estimation function**.

> LogisticRegression.m:  **Logistic regression objective function**.

> DualSVM.m :  **Dual soft-SVM objective function**.

> GDMethods.pdf: **Derivation and details**.

Instructions: Simple and easy. Download all the codes in a directory and run main.m, that will generate one example described below. To use the functions individually, please look at the function descriptions. The derivations and details are also explained in .pdf file.

Example:

In this example, we consider a logistic regression problem with binary labels. In order to calssify the samples, we maximize the corss-entropy loss via gradient descent algorithms:

<p align="center">
  <img src="https://user-images.githubusercontent.com/59627073/80921619-3df5cc00-8d45-11ea-9ae9-a354a4eb49e2.jpg">
</p>

where g(*z*) = 1/(1 + *e*<sup> − *z*</sup>). Moreover, **x**<sup>(*i*)</sup> and *y*<sup>(*i*)</sup> ∈ {0, 1} represent the *i*-th data point and label, respectively. 


Fig.1 shows the convergence of three different gradient descent methods over *N=100* data points in a 3-D feature space.

| ![](Figs/GD.png) | 
|:--:| 
| Fig 1. Comparison of the gradient descent algorithms|


As an example of projection gradient descent, we solve a support vector machine (SVM) classification. The dual problem of a soft-SVM is given by

<p align="center">
  <img src="https://user-images.githubusercontent.com/59627073/80931107-d318b500-8d85-11ea-8550-bbab1ececf77.jpg">
</p>

where **x**<sup>(*i*)</sup> and *y*<sup>(*i*)</sup> ∈ {-1, 1} represent the *i*-th data point and label, respectively, and *ϕ(.)* is the kerenl (mapping) function. The classification is expressed as

<p align="center">
  <img src="https://user-images.githubusercontent.com/59627073/80926450-61307380-8d65-11ea-9d3f-92e922e45765.jpg">
</p>

In Fig.2, the soft-SVM classification is demonstrated over *N=100* data points in a 2-D feature space. It is worth mentioning that we exclude the bias term, i.e. *b=0*.

| ![](Figs/SVM.png) | 
|:--:| 
| Fig 2. Soft-SVM for three different types of data (without bias term)|
