clc; clear; close all; % Clear command window, workspace, and close figures

% Define the range of trunked channels (N) and traffic intensities (A)
trunked_channels = [5, 10, 15, 20 , 25]; % Different numbers of trunked channels
traffic_intensity = linspace(0.1, 50, 200); % Traffic intensity in Erlangs (0.1 to 50)

% Create a figure for plotting
figure; 

% Loop through each trunked channel value and plot the corresponding curve
hold on; % Hold the plot to overlay multiple curves
for i = 1:length(trunked_channels)
    N = trunked_channels(i); % Number of channels
    
    % Compute Erlang-B formula for each traffic intensity (A)
    B = zeros(size(traffic_intensity)); % Initialize blocking probability array
    for j = 1:length(traffic_intensity)
        A = traffic_intensity(j); % Traffic intensity in Erlangs
        numerator = (A^N) / factorial(N); % A^N / N!
        denominator = sum(arrayfun(@(k) (A^k)/factorial(k), 0:N)); % Summation in denominator
        B(j) = numerator / denominator; % Blocking probability
    end
    
    % Plot the Erlang-B curve for the current number of channels
    plot(traffic_intensity, B, 'LineWidth', 2); 
end

% Customize the plot
xlabel('Traffic Intensity (Erlangs)'); % X-axis label
ylabel('Blocking Probability (GoS)'); % Y-axis label
title('Erlang-B Blocking Probability vs. Traffic Intensity'); % Title

% Add a legend to distinguish between different N values
legend(arrayfun(@(x) sprintf('%d Channels', x), trunked_channels, 'UniformOutput', false)); 

grid on; % Enable grid
hold off; % Release the plot hold
