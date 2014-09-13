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
a = -4;
b = 4;

addpath('./solver')
% Newton's method
[sln, seq] = newton(@cuberoot, a, 1e-10, 100, true);
disp(['Newton method solution: ', num2str(sln)]);

%% Secant
%[sln, seq] = secant(@cuberoot, a, b, 1e-10, 100, true);
%disp(['Secant method solution: ', num2str(sln)]);
%
%% Regula falsi
%[sln, seq] = regula_falsi(@cuberoot, a, b, 1e-10, 100, true);
%disp(['Regula falsi method solution: ', num2str(sln)]);
%
%% Wheeler's method
%[sln, seq] = wheeler(@cuberoot, a, b, 1e-10, 100, true);
%disp(['Wheeler method solution: ', num2str(sln)]);
