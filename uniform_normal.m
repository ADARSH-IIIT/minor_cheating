clc; clear; close all;

% Parameters
n = 1e6; % Number of samples

% Uniform Distribution Parameters
a = 0; % Lower bound
b = 1; % Upper bound
uniform_data = a + (b - a) * rand(n, 1);

% Compute Mean and Variance for Uniform Distribution
mean_uniform = mean(uniform_data);
variance_uniform = var(uniform_data);

% Normal Distribution Parameters
mu = 0; % Mean
sigma = 1; % Standard Deviation
normal_data = mu + sigma * randn(n, 1);

% Compute Mean and Variance for Normal Distribution
mean_normal = mean(normal_data);
variance_normal = var(normal_data);

% Display Results
fprintf('Uniform Distribution\nMean: %.4f, Variance: %.4f\n', mean_uniform, variance_uniform);
fprintf('\nNormal Distribution\nMean: %.4f, Variance: %.4f\n', mean_normal, variance_normal);

% Plot Distributions
figure;

% Plot Uniform Distribution
subplot(2, 1, 1);
histogram(uniform_data, 50, 'Normalization', 'pdf');
hold on;
x_uniform = linspace(a, b, 100);
y_uniform = ones(size(x_uniform)) / (b - a);
plot(x_uniform, y_uniform, 'r', 'LineWidth', 2);
hold off;
title('Uniform Distribution');
xlabel('Value');
ylabel('Probability Density');
grid on;

% Plot Normal Distribution
subplot(2, 1, 2);
histogram(normal_data, 50, 'Normalization', 'pdf');
hold on;
x_normal = linspace(mu - 4*sigma, mu + 4*sigma, 100);
y_normal = (1 / (sigma * sqrt(2 * pi))) * exp(-0.5 * ((x_normal - mu) / sigma).^2);
plot(x_normal, y_normal, 'r', 'LineWidth', 2);
hold off;
title('Normal Distribution');
xlabel('Value');
ylabel('Probability Density');
grid on;

