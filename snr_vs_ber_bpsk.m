% MATLAB script to simulate BPSK modulation and plot SNR vs BER

clc; clear; close all; % Clear command window, variables, and close figures

% Define parameters
numBits = 10^6; % Total number of bits to simulate (large for accuracy)
SNR_dB = 0:1:10; % Define SNR range in dB (0 dB to 10 dB in steps of 1)
BER = zeros(size(SNR_dB)); % Initialize BER array to store values for each SNR

% Step 1: Generate random binary data (0s and 1s)
dataBits = randi([0 1], 1, numBits); 

% Step 2: BPSK Modulation
% BPSK maps 0 to -1 and 1 to +1
bpskSymbols = 2*dataBits - 1; % Convert bits: 0 -> -1, 1 -> +1

% Step 3: Simulate the effect of noise for different SNR values
for i = 1:length(SNR_dB)
    % Step 3.1: Add AWGN noise based on current SNR
    receivedSymbols = awgn(bpskSymbols, SNR_dB(i), 'measured');
    
    % Step 3.2: BPSK Demodulation (Decision Rule)
    detectedBits = receivedSymbols > 0; % If received signal > 0, interpret as 1, else 0
    
    % Step 3.3: Calculate Bit Error Rate (BER)
    BER(i) = sum(detectedBits ~= dataBits) / numBits; % Count mismatched bits and normalize
end

% Step 4: Plot the results
semilogy(SNR_dB, BER, 'bo-', 'LineWidth', 2); % Plot BER on logarithmic scale
grid on; % Add grid for better visualization
xlabel('SNR (dB)'); % Label x-axis (SNR in decibels)
ylabel('Bit Error Rate (BER)'); % Label y-axis (BER)
title('SNR vs BER for BPSK Modulation'); % Title of the plot
legend('Simulated BPSK'); % Legend for the plot

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       DETAILED EXPLANATION                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% BPSK Modulation and BER Calculation:
% ------------------------------------
% BPSK (Binary Phase Shift Keying) is a digital modulation scheme where:
% - Bit '0' is represented as -1
% - Bit '1' is represented as +1
% This ensures that the signal is always at a fixed amplitude but shifts
% its phase between 0 and 180 degrees.

% Step 1: Random Bit Generation
% ------------------------------
% - We generate `numBits` random bits (0s and 1s).
% - These represent the data to be transmitted.
% - The function `randi([0 1], 1, numBits)` generates a row vector of
%   random 0s and 1s.

% Step 2: BPSK Modulation
% -------------------------
% - We convert 0s to -1 and 1s to +1 using `bpskSymbols = 2*dataBits - 1`.
% - This transformation allows us to simulate BPSK modulation.

% Step 3: Adding Noise (AWGN Channel)
% -----------------------------------
% - The loop runs for each SNR value from 0 dB to 10 dB.
% - The function `awgn()` adds Additive White Gaussian Noise (AWGN).
% - `awgn(bpskSymbols, SNR_dB(i), 'measured')` ensures that the noise 
%   power is adjusted according to the given SNR.

% Step 4: BPSK Demodulation
% --------------------------
% - The receiver applies a **decision rule**:
%   - If received signal > 0, it's detected as '1'.
%   - Otherwise, it's detected as '0'.
% - This is done using `detectedBits = receivedSymbols > 0`.

% Step 5: Bit Error Rate (BER) Calculation
% ----------------------------------------
% - We compare the received bits with the original bits.
% - `sum(detectedBits ~= dataBits)` counts how many bits were incorrectly
%   received.
% - We normalize this by dividing by the total number of bits to get BER.

% Step 6: Plotting the Results
% ----------------------------
% - We use `semilogy()` instead of `plot()` because BER is usually very 
%   small at higher SNRs, and a log scale is better for visualization.
% - The X-axis represents **SNR in dB**.
% - The Y-axis represents **Bit Error Rate (BER)**.
% - As SNR increases, BER decreases, showing the improved signal quality.

% Expected Graph Interpretation:
% -------------------------------
% - At **low SNR (e.g., 0 dB)**, noise is strong, leading to high BER.
% - As **SNR increases**, noise reduces, and fewer errors occur.
% - The curve should drop exponentially, confirming that increasing SNR
%   improves transmission reliability.
