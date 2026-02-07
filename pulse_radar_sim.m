clc;
clear;
close all;


% Radar Parameters

c = 3e8;          % Speed of light (m/s)
fs = 1e6;         % Sampling frequency (Hz)
Tp = 10e-6;       % Pulse width (seconds)
PRF = 1e3;        % Pulse repetition frequency
fc = 5e9;         % Carrier frequency (Hz)

R_target = 1500;  % Target range (meters)
v_target = 30;    % Target velocity (m/s)


% Time Axis

t = 0:1/fs:Tp;

% Transmitted Pulse (NO rectpuls)

tx_pulse = double(abs(t - Tp/2) <= Tp/2);

% Time Delay Calculation

tau = 2 * R_target / c;
delay_samples = round(tau * fs);

% Received Echo

rx = zeros(1, length(tx_pulse) + delay_samples);
rx(delay_samples+1 : delay_samples+length(tx_pulse)) = tx_pulse;


% Doppler Effect

fd = (2 * v_target * fc) / c;
t_rx = (0:length(rx)-1)/fs;
rx = rx .* cos(2*pi*fd*t_rx);


% Add Noise
rx = rx + 0.05*randn(size(rx));


% Matched Filter

matched_filter = fliplr(tx_pulse);
mf_output = conv(rx, matched_filter)
% Target Detection

[~, peak_index] = max(mf_output);
time_delay_est = peak_index/fs;
range_estimated = (time_delay_est*c)/2;

% Range Resolution
range_resolution = c*Tp/2;


% Doppler Spectrum
doppler_spectrum = abs(fft(rx));

% Display Results
fprintf('\nEstimated Target Range = %.2f meters\n', range_estimated);
fprintf('Range Resolution = %.2f meters\n', range_resolution);
fprintf('Doppler Frequency = %.2f Hz\n', fd);
% Plots
figure

subplot(4,1,1)
plot(t,tx_pulse)
title('Transmitted Pulse')
xlabel('Time (s)')
ylabel('Amplitude')
grid on

subplot(4,1,2)
plot(rx)
title('Received Signal')
xlabel('Samples')
ylabel('Amplitude')
grid on

subplot(4,1,3)
plot(mf_output)
title('Matched Filter Output')
xlabel('Samples')
ylabel('Amplitude')
grid on

subplot(4,1,4)
plot(doppler_spectrum)
title('Doppler Spectrum')
xlabel('Frequency Bin')
ylabel('Magnitude')
grid on