clear all; close all; clc;
[y, Fs] = audioread('Floyd.m4a');
%% Setup
S = y'; n = length(S); % Number of data points in sample chunk
L = n/Fs; % record time in seconds
t2 = linspace(0,L,n+1); t = t2(1:n); 
k = (2*pi/L)*[0:n/2-1, -n/2:-1]; ks = fftshift(k); 
St = fft(S); % FFT of signal
Sgt_spec_bass = []; max_bass = []; % Setup emptry spectrogram and max frequency list for bass
zero_freq_ind = length(ks)/2+1; ks_cut = ks(zero_freq_ind:length(ks));
plausible_bass_high = 300; plausible_freq_min = 1/L; plausible_freq_max = 1400;
ks_bass = ks_cut(floor(plausible_freq_min*L):floor(plausible_bass_high*L))/(2*pi);
%% Perform Gabor Transform
filter_width = 250; translation_jump = 0.01; tslide = 0:translation_jump:L;
for i=1:length(tslide)
    g=exp(-filter_width*(t-tslide(i)).^2); % Define Gabor filter
    Sg = g.*S; % Apply filter to signal
    Sgt = fft(Sg); % FFT the filtered signal
    Sgt_abs = abs(fftshift(Sgt)); Sgt_cut = Sgt_abs(zero_freq_ind:length(ks));
    Sgt_bass_plausible = Sgt_cut(floor(plausible_freq_min*L):floor(plausible_bass_high*L));
    Sgt_spec_bass = [Sgt_spec_bass; Sgt_bass_plausible]; % Add to spectrogram
    [~, max_bass_sample] = max(Sgt_bass_plausible);
    max_bass = [max_bass; ks_bass(max_bass_sample)]; 
end
%% PRESENTATION
num_freqs = 0:61;freq_list = 32.7 .* (2^(1/12)).^num_freqs; % Music Notes Setup
name_list = ["C1","C#1","D1","D#1","E1","F1","F#1","G1","G#1","A1","A1#","B1",...
             "C2","C#2","D2","D#2","E2","F2","F#2","G2","G#2","A2","A2#","B2",...
             "C3","C#3","D3","D#3","E3","F3","F#3","G3","G#3","A3","A3#","B3",...
             "C4","C#4","D4","D#4","E4","F4","F#4","G4","G#4","A4","A4#","B4",...
             "C5","C#5","D5","D#5","E5","F5","F#5","G5","G#5","A5","A5#","B5",...
             "C6","C#6"];
bpm = 61; bps = 60/bpm;
figure(1); subplot(2,1,1), pcolor(tslide,ks_bass,Sgt_spec_bass.'), shading interp;
set(gca,'Ylim', [0 max(ks_bass)]);
colormap(hot), title("Low Pass Filter of Spectrogram of 'Comfortably Numb' Solo", ...
    'FontSize',14), xlabel('Time [sec]'), ylabel('Frequency [Hz]');
yline(800,'c','Bass High');
for n=1:30
    yline(freq_list(n),'c',name_list(n));
end
for b=0:floor(L/bps) % Add vertical lines for each beat
    xline(bps*b,'m'); xline(bps*b+(bps/2),'y')
end
subplot(2,1,2), plot(tslide,max_bass);
title("Maximum Low Frequencies At Each Time Step", 'FontSize',14), xlabel('Time [sec]'), ylabel('Frequency [Hz]');
for n=1:30
    yline(freq_list(n),'c',name_list(n));
end
for b=0:floor(L/bps) % Add vertical lines for each beat
    xline(bps*b,'m'); xline(bps*b+(bps/2),'y')
end
bass_notes = note_map(max_bass)