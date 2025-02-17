% MATLAB script to simulate QPSK modulation and plot SNR vs BER

clc; clear; close all; % Clear command window, variables, and close figures

% Define parameters
numBits = 10^6; % Number of bits
SNR_dB = 0:1:10; % SNR range in dB
BER = zeros(size(SNR_dB)); % Initialize BER array

% Step 1: Generate random binary data (0s and 1s)
dataBits = randi([0 1], 1, numBits); 

% Step 2: QPSK Modulation (Mapping bits to QPSK symbols)
% Group bits into pairs (I and Q)
dataBits = reshape(dataBits, 2, []); % Reshape into 2-bit symbols
I = 2*dataBits(1,:) - 1; % Convert first bit to +/-1
Q = 2*dataBits(2,:) - 1; % Convert second bit to +/-1
qpskSymbols = (I + 1j * Q) / sqrt(2); % Normalize power to unit energy

% Step 3: Simulate transmission for different SNR values
for i = 1:length(SNR_dB)
    % Step 3.1: Add AWGN noise based on current SNR
    receivedSymbols = awgn(qpskSymbols, SNR_dB(i), 'measured');
    
    % Step 3.2: QPSK Demodulation (Decision Rule)
    detected_I = real(receivedSymbols) > 0; % Detect in-phase component
    detected_Q = imag(receivedSymbols) > 0; % Detect quadrature component
    
    % Step 3.3: Convert detected I and Q back to bits
    detectedBits = [detected_I; detected_Q];
    detectedBits = detectedBits(:)'; % Convert back to a single bit stream
    
    % Step 3.4: Compute Bit Error Rate (BER)
    BER(i) = sum(detectedBits ~= dataBits(:)') / numBits; 
end

% Step 4: Plot the results
semilogy(SNR_dB, BER, 'ro-', 'LineWidth', 2);
grid on;
xlabel('SNR (dB)');
ylabel('Bit Error Rate (BER)');
title('SNR vs BER for QPSK Modulation');
legend('Simulated QPSK');

