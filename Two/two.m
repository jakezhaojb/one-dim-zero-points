% ============================================================
% This code is First Assignment for Numerical Optimization class.
% *** Exercise 1.3 ***
% You could use this script as main function.
% One-d Zero finding problem.
% ============================================================
% 

clc
clear

% Set start point
a = 4;
b = 10;

addpath('./solver')
% Newton's method
[sln, seq] = newton(@cuberoot, a, 1e-10, 100, true, true);
disp(['Newton method solution: ', num2str(sln, '%e')]);

% Secant
%[sln, seq] = secant(@cuberoot, a, b, 1e-10, 100, true, true);
%disp(['Secant method solution: ', num2str(sln, '%e')]);
%
%% Regula falsi
%[sln, seq] = regula_falsi(@cuberoot, a, b, 1e-10, 100, true, true);
%disp(['Regula falsi method solution: ', num2str(sln, '%e')]);
%
%% Wheeler's method
%[sln, seq] = wheeler(@cuberoot, a, b, 1e-10, 100, true, true);
%disp(['Wheeler method solution: ', num2str(sln, '%e')]);
