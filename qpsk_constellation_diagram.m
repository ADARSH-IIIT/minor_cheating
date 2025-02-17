clc; clear; close all;

numSymbols = 1000; % Number of symbols
SNR_dB = [20, 10, 5, 0 , 12]; % Add or remove SNR values as needed

% Generate random bits
dataBits = randi([0 1], 2, numSymbols);

% QPSK Modulation
I = 2*dataBits(1,:) - 1; % Map bits to -1 or +1 (BPSK-style)
Q = 2*dataBits(2,:) - 1;
qpskSymbols = (I + 1j * Q) / sqrt(2); % Normalize to unit power

% Figure setup
figure;
numPlots = length(SNR_dB); % Number of SNR values

for i = 1:numPlots
    % Add AWGN noise based on current SNR
    receivedSymbols = awgn(qpskSymbols, SNR_dB(i), 'measured');

    % Create subplot dynamically
    subplot(ceil(sqrt(numPlots)), ceil(sqrt(numPlots)), i); 
    plot(receivedSymbols, 'bo'); hold on;
    plot(qpskSymbols, 'rx', 'MarkerSize', 10, 'LineWidth', 2); % Ideal positions

    % Formatting
    axis([-1.5 1.5 -1.5 1.5]);
    grid on;
    xlabel('In-phase');
    ylabel('Quadrature');
    title(['QPSK Constellation at SNR = ', num2str(SNR_dB(i)), ' dB']);
    legend('Received Symbols', 'Ideal Symbols');
end
