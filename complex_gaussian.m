clc; clear; close all;

% Number of samples
numSamples = 1000;  

% Mean and variance settings
mu = 0;    % Mean (0)
sigma1 = sqrt(1);  % Standard deviation for variance = 1
sigma2 = sqrt(3);  % Standard deviation for variance = 3

% Generate complex Gaussian random variables with mean = mu
X1 = mu + sigma1 * (randn(1, numSamples) + 1j * randn(1, numSamples)); % Variance = 1
X2 = mu + sigma2 * (randn(1, numSamples) + 1j * randn(1, numSamples)); % Variance = 3

% Plot in complex plane
figure;
hold on;
plot(real(X1), imag(X1), 'b.', 'DisplayName', 'Variance = 1');  % Blue for Variance = 1
plot(real(X2), imag(X2), 'r.', 'DisplayName', 'Variance = 3');  % Red for Variance = 3

% Labels and legend
xlabel('Real Part');
ylabel('Imaginary Part');
title('Complex Gaussian Random Variables in Complex Plane');
legend;
grid on;
axis equal;
hold off;
