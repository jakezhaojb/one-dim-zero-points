% ============================================================
% This code is First Assignment for Numerical Optimization class.
% *** Exercise 1.1 ***
% You could use this script as main function.
% One-d Zero finding problem.
% ============================================================
% 

clc
%clear

% Set start points
a = 0.95;
b = 1.01;
% User input function
str = input('Input your function use variable "x"\n', 's');
fun = inline(str);
% Bisection 
[sln, seq] = bisection(fun, a, b, 1e-10, 12, true);
format long e
disp(['Solution is: ', num2str(sln, '%e')]);
disp(['Uncertainty: ', num2str(abs(seq(end)-seq(end-1)), '%e')]);
