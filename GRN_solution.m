clear all; close all; clc;
[y, Fs] = audioread('GNR.m4a');
%% Setup
S = y'; n = length(S); % Number of data points in sample chunk
L = n/Fs; % record time in seconds. This is time of *chunk*, not entire recording
t2 = linspace(0,L,n+1); t = t2(1:n);
k = (2*pi/L)*[0:n/2-1, -n/2:-1]; ks = fftshift(k);
Sgt_spec = []; max_freq = [];% Setup emptry spectrogram and maximum frequency list
zero_freq_ind = length(ks)/2+1; % Start at lowest freq possible
ks_cut = ks(zero_freq_ind:length(ks));
plausible_freq_max = 12000;
ks_plausible = ks_cut(1:floor(plausible_freq_max*L/(2*pi))) / (2*pi);
%% Perform Gabor Transform
filter_width = 250; translation_jump = 0.1;
tslide = 0:translation_jump:L;
for i=1:length(tslide)
    g=exp(-filter_width*(t-tslide(i)).^2); % Define Gabor filter
    Sg = g.*S; % Apply filter to signal
    Sgt = fft(Sg); % FFT the filtered signal
    Sgt_abs = abs(fftshift(Sgt)); Sgt_cut = Sgt_abs(zero_freq_ind:length(ks));
    Sgt_plausible = Sgt_cut(1:floor(plausible_freq_max*L/(2*pi)));
    Sgt_spec = [Sgt_spec; Sgt_plausible]; % Add to spectrogram
    % Determine max frequency
    [~, max_freq_sample] = max(Sgt_plausible);
    max_freq = [max_freq; ks_plausible(max_freq_sample)]; 
end
%% Presentation
num_freqs = 0:61; freq_list = 41.21 .* (2^(1/12)).^num_freqs;
name_list = ["E1","F1","F#1","G1","G#1","A1","A1#","B1","C1","C#1","D1","D#1",...
             "E2","F2","F#2","G2","G#2","A2","A2#","B2","C2","C#2","D2","D#2",...
             "E3","F3","F#3","G3","G#3","A3","A3#","B3","C3","C#3","D3","D#3",...
             "E4","F4","F#4","G4","G#4","A4","A4#","B4","C4","C#4","D4","D#4",...
             "E5","F5","F#5","G5","G#5","A5","A5#","B5","C5","C#5","D5","D#5",...
             "E6","F6"];
bpm = 123; bps = 60/bpm;
figure(1); subplot(2,1,1), pcolor(tslide,ks_plausible,Sgt_spec.'), shading interp; hold on;
set(gca,'Ylim', [0 max(ks_plausible)]);
colormap(hot), title("Spectrogram of 'Sweet Child 'O Mine' Intro", 'FontSize',14), xlabel('Time [sec]'), ylabel('Frequency [Hz]');
for i=1:length(name_list) % Add horizontal lines for each note
    yline(freq_list(i),'c',name_list(i));
end
for b=0:floor(L/bps) % Add vertical lines for each beat
    xline(bps*b,'m'); xline(bps*b+(bps/2),'y');
end
subplot(2,1,2), plot(tslide,max_freq);  % Plot maximum frequencies
title("Maximum Frequencies At Each Time Step", 'FontSize',14), xlabel('Time [sec]'), ylabel('Frequency [Hz]');
for i=1:length(name_list) % Add horizontal lines for each note
    yline(freq_list(i),'c',name_list(i));
end
for b=0:floor(L/bps) % Add vertical lines for each beat
    xline(bps*b,'m'); xline(bps*b+(bps/2),'y')
end
note_map(max_freq)