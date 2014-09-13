% Newton's method
function [zero_pt, seq] = newton(J, a, varargin)
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
    x = zeros(1, maxit+1);
    x(1) = a;
    % gradient computing function, nested
    function grad = cubegrad(pt)
        grad = 3*pt^2;
    end
    J_buffer = J(a); % initialize a buffer avoiding compute twice for a same point.
    % Start iterating
    disp('Iterates start.')
    for i = 2:maxit+1
        x(i) = x(i-1) - J_buffer/cubegrad(x(i-1));
        J_buffer = J(x(i));
        if verbose
            format long e
            str = ['iter: ', num2str(i), ' -> x: ', num2str(x(i), '%e'), ' -> y: ', num2str(J_buffer, '%e')];
            disp(str)
        end
        if abs(J_buffer) == 0 | abs(x(i) - x(i-1)) < tol
            break
        end
    end
    disp('Iterates done.')
    seq = x(1:i);
    zero_pt = seq(end);
end
