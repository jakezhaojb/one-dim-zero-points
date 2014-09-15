1-d zero point solver
===

Introduction
----
This repository was built for Class **Numerical Optimization** in NYU.

The folder One involves the basic **bisection** method for the problem; and folder Two gather 4 model-based methods for this problelm, that is, **Newton's methon**, **Secant method**, **Regula_falsi method**, **Wheeler's method**(also known as Illinois method).

Usage
---
To use every function, they have same intefaces and parameter setting. For example, bisection, Secant method, Regula_falsi and Wheeler's method require a pair of initial guesses; usages:
> secant(@fun, a, b, tol, maxit, verbose, plot);<br\ >
> ------------------------------------------------------ <br\ >
> @fun is a handle for function to be optimized.<br\ >
> a, b are initial guesses.<br\ >
> tol is abbreviation for tolenrance of uncertainty.<br\ >
> maxit is maximum number of iterations<br\ >
> verbose is a boolean, make it true and it will present more iterates information.<br\ >
> plot is a boolean, make it true if you want to see optimization track.<br\ >


Newton's method is slightly different, since it needs only one initial guess, thus:
> newton(@fun, a, tol, maxit, verbose, plot);<br\ >
> ------------------------------------------------------ <br\ >
> @fun is a handle for function to be optimized.<br\ >
> a is the initial guess.<br\ >
> tol is abbreviation for tolenrance of uncertainty.<br\ >
> maxit is maximum number of iterations<br\ >
> verbose is a boolean, make it true and it will present more iterates information.<br\ >
> plot is a boolean, make it true if you want to see optimization track.<br\ >

Platform
---
Matlab 2011a or later versions.

Contact
----
j dot zhao @ nyu dot edu 


