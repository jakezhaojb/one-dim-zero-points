function [zero_pt, seq] = bisection(J, a, b, varargin)
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
    % Memory pre-allocation and starting points
    x = zeros(1, maxit+2);
    x(1: 2) = [a, b];
    % Initialize J and x buffers avoiding of computing twice a point.
    x_buffer = [a, b];
    J_buffer = [J(x(1)), J(x(2))];
    assert((J_buffer(1) * J_buffer(2)) < 0, 'muitiply of two starting points should be negative')
    % Start iterating
    disp('Iterates start.')
    for i = 3:maxit+2
        x(i) = sum(x_buffer) / 2;
        J_cur = J(x(i));
        idx = sign(J_cur) == sign(J_buffer);
        x_buffer = [x_buffer(idx==0), x(i)];
        J_buffer = [J_buffer(idx==0), J_cur];
        if verbose
            format long e
            str = strcat('x: ', num2str(x(i), '%e'), ' -> y: ', num2str(J_cur, '%e'));
            disp(str);
        end
        if J_cur == 0 | abs(x_buffer(1)-x_buffer(2)) < tol
            break
        end
    end
    disp('Iterates done.')
    seq = x(1:i);
    zero_pt = seq(end);
end
