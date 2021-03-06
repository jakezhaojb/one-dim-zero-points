% ===================================================
% Usage
% regula_falsi(@fun, a, b, tol, maxit, verbose, plot)
% - @fun -> the handle of function to be resolved
% - a, b -> initial guesses
% - tol ->  the tolerence of uncertainty; 
%       iteration stops if |x(k+1)-x(k)| < tol
% - maxit -> maximum iterations;
% - verbose
% - plot -> show optimization process in graphs.
% ===================================================
% regular falsi method
function [zero_pt, seq] = regular_falsi(J, a, b, varargin)
    % Parameter parsing
    n = numel(varargin);
    if n > 4
        disp('You can only input "maxit" and "tol" as parameters');
        return
    end
    if n > 3
        vis = varargin{4};
        if ~exist('visual', 'dir')
            mkdir('visual');
        end
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
    % Visualize
    if vis
        h = figure('visible','off');
        v_x = linspace(-6, 6, 2000);
        v_y = zeros(size(v_x));
        for i = 1: length(v_y)
            v_y(i) = J(v_x(i));
        end
        plot(v_x, v_y, 'color', 'm', 'LineWidth', 2);
        xL = xlim;
        yL = ylim;
        %line([0 0], yL);
        line(xL, [0 0], 'color', 'g');
    end
    % Start iterating
    assert(J_sign(1) ~= J_sign(2), 'Multiply of starting points should be negative.')
    disp('Iterates start.')
    for i = 3:maxit+2
        idx = find(J_sign ~= J_sign(i-1) & J_sign ~= 0, 1, 'last');
        x(i) = x(i-1) - J_buffer(i-1)*(x(i-1)-x(idx))/(J_buffer(i-1)-J_buffer(idx));
        if vis
            line([x(idx), x(i-1)], [J_buffer(idx), J_buffer(i-1)], 'color', 'r', 'linewidth', 2);
        end
        J_buffer(i) = J(x(i));
        if vis
            line([x(i), x(i)], [J_buffer(i), 0], 'linestyle', '--');
        end
        J_sign(i) = sign(J_buffer(i));
        if verbose
            format long e
            str = ['iter: ', num2str(i-2), ' -> x: ', num2str(x(i), '%e'), ' -> y: ', num2str(J_buffer(i), '%e')];
            disp(str)
        end
        if abs(J_buffer(i)) == 0 | abs(x(i) - x(i-1)) < tol
            break
        end
    end
    if vis
        tri_x = [x(i)-0.2;x(i)+0.2;x(i)];
        tri_y = [-3; -3; 6];
        tri_z = [0, 0, 0];
        hold on
        patch(tri_x, tri_y, tri_z);
        saveas(h, 'visual/regula_falsi','jpg')
    end
    disp('Iterates done.')
    seq = x(1:i);
    zero_pt = seq(end);
end
