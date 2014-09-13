% regular falsi method
function [zero_pt, seq] = regular_falsi(J, a, b, varargin)
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
    % Memory pre-allocation and starting point initialize
    x = zeros(2, maxit+2);
    J_sign = zeros(1, maxit+2);
    J_buffer = zeros(1, maxit+2);
    x(1:2) = [a, b];
    J_buffer(1:2) = [J(a), J(b)];
    J_sign(1: 2) = sign(J_buffer(1:2));
    % Start iterating
    assert(J_sign(1) ~= J_sign(2), 'Multiply of starting points should be negative.')
    disp('Iterates start.')
    for i = 3:maxit+2
        idx = find(J_sign ~= J_sign(i-1) & J_sign ~= 0, 1, 'last');
        x(i) = x(i-1) - J_buffer(i-1)*(x(i-1)-x(idx))/(J_buffer(i-1)-J_buffer(idx));
        J_buffer(i) = J(x(i));
        J_sign(i) = sign(J_buffer(i));
        if verbose
            format long e
            str = ['iter: ', num2str(i), ' -> x: ', num2str(x(i), '%e'), ' -> y: ', num2str(J_buffer(i), '%e')];
            disp(str)
        end
        if abs(J_buffer(i)) == 0 | abs(x(i) - x(i-1)) < tol
            break
        end
    end
    disp('Iterates done.')
    seq = x(1:i);
    zero_pt = seq(end);
end
