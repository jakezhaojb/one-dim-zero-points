% Secant method
function [zero_pt, seq] = secant(J, a, b, varargin)
    % Parameter parsing
    n = numel(varargin);
    if n > 3
        disp('You can only input "maxit" and "tol" as parameters');
        return
    end
    if n > 2
        verbose = varargin{3};
    end
    if n > 1
        maxit = varargin{2};
    end
    if n > 0
        tol = varargin{1};
    else
        tol = 0.00001;
        maxit = 1000;
    end
    % Memory pre-allocation and starting point
    x = zeros(2, maxit+2);
    x(1:2) = [a, b];
    J_buffer = [J(a), J(b)]; % initialize a buffer avoiding compute twice for a same point.
    % Start iterating
    disp('Iterates start.')
    for i = 3:maxit+2
        x(i) = x(i-1) - J_buffer(2)*(x(i-1)-x(i-2))/(J_buffer(2)-J_buffer(1));
        J_buffer = [J(x(i-1)), J(x(i))];
        if verbose
            format long e
            str = ['iter: ', num2str(i), ' -> x: ', num2str(x(i), '%e'), ' -> y: ', num2str(J_buffer(2), '%e')];
            disp(str)
        end
        if abs(J_buffer(2)) == 0 | abs(x(i) - x(i-1)) < tol
            break
        end
    end
    disp('Iterates done.')
    seq = x(1:i);
    zero_pt = seq(end);
end
