% Newton's method
function [zero_pt, seq] = newton(J, a, varargin)
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
    % Memory pre-allocation and starting point
    x = zeros(1, maxit+1);
    x(1) = a;
    % gradient computing function, nested
    function grad = cubegrad(pt)
        grad = 3*pt^2;
    end
    J_buffer = J(a); % initialize a buffer avoiding compute twice for a same point.
    % Visualize
    if vis
        h = figure('visible','off');
        v_x = linspace(-5, 5, 2000);
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
    disp('Iterates start.')
    for i = 2:maxit+1
        x(i) = x(i-1) - J_buffer/cubegrad(x(i-1));
        if vis
            line([x(i-1), x(i)], [J_buffer, 0], 'color', 'r', 'linewidth', 2);
        end
        J_buffer = J(x(i));
        if vis
            line([x(i), x(i)], [J_buffer, 0], 'linestyle', '--');
        end
        if verbose
            format long e
            str = ['iter: ', num2str(i-1), ' -> x: ', num2str(x(i), '%e'), ' -> y: ', num2str(J_buffer, '%e')];
            disp(str)
        end
        if abs(J_buffer) == 0 | abs(x(i) - x(i-1)) < tol
            break
        end
    end
    if vis
        tri_x = [x(i)-0.2;x(i)+0.2;x(i)];
        tri_y = [-3; -3; 6];
        tri_z = [0, 0, 0];
        hold on
        patch(tri_x, tri_y, tri_z);
        saveas(h, 'visual/newton','jpg')
    end
    disp('Iterates done.')
    seq = x(1:i);
    zero_pt = seq(end);
end
