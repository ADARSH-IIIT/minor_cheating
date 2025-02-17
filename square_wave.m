% MATLAB script to generate and plot a square wave

% Define parameters
T = 2; % Period of the square wave
fs = 1000; % Sampling frequency (high value for smooth plotting)
t = 0:1/fs:5*T; % Time vector from 0 to 5 periods with small step size

% Generate the square wave using the square() function
% square() generates a waveform with values of -1 and 1
sq_wave = square(2 * pi * (1/T) * t); % Frequency = 1/T

% Plot the square wave
figure; % Open a new figure
plot(t, sq_wave, 'LineWidth', 2);
grid on; % Add grid for better visualization
xlabel('Time (s)');
ylabel('Amplitude');
title('Square Wave Signal');
ylim([-1.5 1.5]); % Set y-axis limits

% Explanation:
% - square() generates a square wave with values switching between -1 and 1.
% - The argument (2*pi*f*t) determines the wave frequency.
% - The time vector 't' ensures high resolution for smooth plotting.
% - A higher sampling frequency (fs) provides better visualization.
