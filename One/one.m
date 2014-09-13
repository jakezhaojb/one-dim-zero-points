% ============================================================
% This code is First Assignment for Numerical Optimization class.
% *** Exercise 1.1 ***
% You could use this script as main function.
% One-d Zero finding problem.
% ============================================================
% 

clc
clear

% Set start points
a = 0.5;
b = 3.1;
% User input function
str = input('Input your function use variable "x"\n', 's');
fun = inline(str);
% Bisection 
[sln, seq] = bisection(fun, a, b, 1e-10, 12, true);
disp(['Solution is: ', num2str(sln)]);
