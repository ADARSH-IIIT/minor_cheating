clc; clear; close all; % Clear command window, workspace, and close figures

% Define the range for x, including negative values
x = linspace(-10 , 10, 100); % X range for plotting PDFs
k = 0:10; % Range for discrete distributions (Poisson)

%% 1. Gaussian Distribution
mu = 0;        % Mean
sigma = 1;     % Standard Deviation
y_gaussian = (1/(sigma*sqrt(2*pi))) * exp(-(x - mu).^2 / (2 * sigma^2)); % Normal distribution PDF using formula
mean_gaussian = mu; % Mean of Gaussian distribution
variance_gaussian = sigma^2; % Variance of Gaussian distribution

%% 2. Exponential Distribution
lambda = 1; % Rate parameter
y_exponential = lambda * exp(-lambda * x); % Exponential distribution PDF using formula
y_exponential(x < 0) = 0; % Set negative x values to 0 for Exponential distribution
mean_exponential = 1 / lambda; % Mean of Exponential distribution
variance_exponential = 1 / (lambda^2); % Variance of Exponential distribution

%% 3. Rayleigh Distribution
sigma_rayleigh = 1; % Scale parameter
y_rayleigh = (x / sigma_rayleigh^2) .* exp(-x.^2 / (2 * sigma_rayleigh^2)); % Rayleigh distribution PDF using formula
y_rayleigh(x < 0) = 0; % Set negative x values to 0 for Rayleigh distribution
mean_rayleigh = sigma_rayleigh * sqrt(pi / 2); % Mean of Rayleigh distribution
variance_rayleigh = (2 - pi / 2) * sigma_rayleigh^2; % Variance of Rayleigh distribution

%% 4. Poisson Distribution
lambda_poisson = 3; % Rate parameter
y_poisson = arrayfun(@(k_val) (lambda_poisson^k_val * exp(-lambda_poisson)) / factorial(k_val), k); % Poisson distribution PMF
mean_poisson = lambda_poisson; % Mean of Poisson distribution
variance_poisson = lambda_poisson; % Variance of Poisson distribution

%% 5. Rician Distribution
K = 1; % Rician factor
sigma_rician = 1; % Scale parameter
y_rician = (x / sigma_rician^2) .* exp(-(x.^2 + K^2) / (2 * sigma_rician^2)) .* besseli(0, (K * x) / sigma_rician^2); % Rician distribution PDF using formula
y_rician(x < 0) = 0; % Set negative x values to 0 for Rician distribution
mean_rician = sigma_rician * sqrt(pi / 2) * (1 + K); % Approximate mean for Rician distribution
variance_rician = sigma_rician^2 * (2 - pi / 2) * (1 + K); % Approximate variance for Rician distribution

%% 6. Uniform Distribution
a = 0; % Lower bound
b = 1; % Upper bound
y_uniform = (x >= a & x <= b) / (b - a); % Uniform distribution PDF using formula
mean_uniform = (a + b) / 2; % Mean of Uniform distribution
variance_uniform = (b - a)^2 / 12; % Variance of Uniform distribution

%% Plot all distributions

figure('Position', [100, 100, 800, 600]);

% Gaussian Distribution
subplot(3, 2, 1);
plot(x, y_gaussian, 'b-', 'LineWidth', 2);
title('Gaussian Distribution');
xlabel('X');
ylabel('Probability Density');
grid on;

% Exponential Distribution
subplot(3, 2, 2);
plot(x, y_exponential, 'r-', 'LineWidth', 2);
title('Exponential Distribution');
xlabel('X');
ylabel('Probability Density');
grid on;

% Rayleigh Distribution
subplot(3, 2, 3);
plot(x, y_rayleigh, 'g-', 'LineWidth', 2);
title('Rayleigh Distribution');
xlabel('X');
ylabel('Probability Density');
grid on;

% Poisson Distribution
subplot(3, 2, 4);
stem(k, y_poisson, 'm-', 'LineWidth', 2);
title('Poisson Distribution');
xlabel('Number of Events');
ylabel('Probability');
grid on;

% Rician Distribution
subplot(3, 2, 5);
plot(x, y_rician, 'c-', 'LineWidth', 2);
title('Rician Distribution');
xlabel('X');
ylabel('Probability Density');
grid on;

% Uniform Distribution
subplot(3, 2, 6);
plot(x, y_uniform, 'k-', 'LineWidth', 2);
title('Uniform Distribution');
xlabel('X');
ylabel('Probability Density');
grid on;

%% Display Means and Variances
fprintf('Gaussian Mean: %.2f, Variance: %.2f\n', mean_gaussian, variance_gaussian);
fprintf('Exponential Mean: %.2f, Variance: %.2f\n', mean_exponential, variance_exponential);
fprintf('Rayleigh Mean: %.2f, Variance: %.2f\n', mean_rayleigh, variance_rayleigh);
fprintf('Poisson Mean: %.2f, Variance: %.2f\n', mean_poisson, variance_poisson);
fprintf('Rician Mean: %.2f, Variance: %.2f\n', mean_rician, variance_rician);
fprintf('Uniform Mean: %.2f, Variance: %.2f\n', mean_uniform, variance_uniform);
