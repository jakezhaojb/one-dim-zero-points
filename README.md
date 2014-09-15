1-d zero point solver
===

Introduction
----
This repository was built for Class **Numerical Optimization** in NYU.

The folder One involves the basic **bisection** method for the problem; and folder Two gather 4 model-based methods for this problelm, that is, **Newton's methon**, **Secant method**, **Regula_falsi method**, **Wheeler's method**(also known as Illinois method).

Usage
---
To use every function, they have same intefaces and parameter setting. For example, bisection, Secant method, Regula_falsi and Wheeler's method require a pair of initial guesses; usages:
> secant(@fun, a, b, tol, maxit, verbose, plot);
> @fun is a handle for function to be optimized.
> a, b are initial guesses.
> tol is abbreviation for tolenrance of uncertainty.
> maxit is maximum number of iterations
> verbose is a boolean, make it true and it will present more iterates information.
> plot is a boolean, make it true if you want to see optimization track.


Newton's method is slightly different, since it needs only one initial guess, thus:
> newton(@fun, a, tol, maxit, verbose, plot);
> @fun is a handle for function to be optimized.
> a is the initial guess.
> tol is abbreviation for tolenrance of uncertainty.
> maxit is maximum number of iterations
> verbose is a boolean, make it true and it will present more iterates information.
> plot is a boolean, make it true if you want to see optimization track.

Platform
---
Matlab 2011a or later versions.

Contact
----
j dot zhao @ nyu dot edu 

