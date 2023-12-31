function [] = plotting(T, H, Qout, name)
    % Consistent figure style
    set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
    set(groot, 'defaultLegendInterpreter','latex');
    
    % Water Level Plotting
    tl = strcat('Water Level in 4-Tank-System - ', name);
    figure('Name', tl, 'NumberTitle', 'off', 'WindowState', 'maximized');
    sgtitle(tl, 'interpreter', 'latex');

    for i = 1:size(H, 2)
        subplot(2, 2, i);
        plot(T, H(:, i), 'LineWidth', 1.5);
        title(['Tank ', num2str(i)], 'interpreter', 'latex');
        xlabel('Time [sec]', 'interpreter', 'latex');
        ylabel('Water Level [cm]', 'interpreter', 'latex');
        grid on; % Add grid
    end

    % Outflow Rate Plotting
    tl2 = strcat('Outflow Rate in 4-Tank-System - ', name);
    figure('Name', tl2, 'NumberTitle', 'off', 'WindowState', 'maximized');
    sgtitle(tl2, 'interpreter', 'latex');

    for i = 1:size(Qout, 2)
        subplot(2, 2, i);
        plot(T, Qout(:, i), 'LineWidth', 1.5);
        title(['Tank ', num2str(i)], 'interpreter', 'latex');
        xlabel('Time [sec]', 'interpreter', 'latex');
        ylabel('Flow rate [cm$^3$/s]', 'interpreter', 'latex');
        grid on; % Add grid
    end
end
