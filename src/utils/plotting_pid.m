function [] = plotting_(T, H, Qout, set_points, name)
    % Consistent figure style
    set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
    set(groot, 'defaultLegendInterpreter','latex');
    
    % Water Level Plotting
    tl = strcat('Output in 4-Tank-System - ', name);
    figure('Name', tl, 'NumberTitle', 'off', 'WindowState', 'maximized');
    sgtitle(tl, 'interpreter', 'latex');

    for i = 1:size(H, 2)
        subplot(2, 2, i);
        plot(T, H(:, i), 'LineWidth', 1.5); hold on;
        yline(set_points(i), 'r--', 'LineWidth', 1.5); % Set point line
        
        % Annotate rise time and overshoot
        % Assuming rise_times and overshoots are vectors with values for each tank
        % Calculate a position for the text that is just above the bottom of the figure
        textYPosition = min(H(:, i)) + 0.15 * (max(H(:, i)) - min(H(:, i)));
     
        
        title(['Tank ', num2str(i)], 'interpreter', 'latex');
        xlabel('Time [sec]', 'interpreter', 'latex');
        ylabel('Water Level [cm]', 'interpreter', 'latex');
        legend('Water Level', 'Set Point');
        grid on; % Add grid
        hold off;
    end

    % Outflow Rate Plotting
    tl2 = strcat('Measurements in 4-Tank-System - ', name);
    figure('Name', tl2, 'NumberTitle', 'off', 'WindowState', 'maximized');
    sgtitle(tl2, 'interpreter', 'latex');

    for i = 1:size(Qout, 2)
        subplot(2, 2, i);
        plot(T, Qout(:, i), 'LineWidth', 1.5);
        yline(set_points(i), 'r--', 'LineWidth', 1.5); % Set point line
        title(['Tank ', num2str(i)], 'interpreter', 'latex');
        xlabel('Time [sec]', 'interpreter', 'latex');
        ylabel('Water Level [cm]', 'interpreter', 'latex');
        grid on; % Add grid
    end
end
