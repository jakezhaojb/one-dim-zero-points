% Wheeler's method
function [zero_pt, seq] = wheeler(J, a, b, varargin)
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
    x_buffer = x(1: 2);
    J_buffer(1:2) = [J(a), J(b)];
    J_sign(1: 2) = sign(J_buffer(1:2));
    % Visulization
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
    u = 1;
    for i = 3:maxit+2
        x(i) = x(i-1) - J_buffer(2)*(x_buffer(2) - x_buffer(1))/(J_buffer(2) - J_buffer(1)*u);
        if vis
            line([x_buffer(2), x_buffer(1)], [J_buffer(2), J_buffer(1)*u], 'color', 'r', 'linewidth', 2);
        end
        J_cur = J(x(i));
        if sign(J_cur) ~= J_sign(2)
            u = 1;
            J_buffer = [J_buffer(2), J_cur];
            x_buffer = [x_buffer(2), x(i)];
            J_sign = [J_sign(2), sign(J_cur)];
            if vis
                line([x(i), x(i)], [J_cur, 0], 'linestyle', '--');
            end
        else
            u = u / 2;
            if vis
                line([x_buffer(1), x_buffer(1)], [J_buffer(1)*u, J_buffer(1)*u*2], 'linestyle', '--');
            end
        end
        if verbose
            format long e
            str = ['iter: ', num2str(i-2), ' -> x: ', num2str(x(i), '%e'), ' -> y: ', num2str(J_cur, '%e')];
            disp(str)
        end
        if abs(J_cur) == 0 | abs(x(i) - x(i-1)) < tol
            break
        end
    end
    if vis
        tri_x = [x(i)-0.2;x(i)+0.2;x(i)];
        tri_y = [-3; -3; 6];
        tri_z = [0, 0, 0];
        hold on
        patch(tri_x, tri_y, tri_z);
        saveas(h, 'visual/wheeler','jpg')
    end
    disp('Iterates done.')
    seq = x(1:i);
    zero_pt = seq(end);
end
