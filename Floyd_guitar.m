clear all; close all; clc;
[y, Fs] = audioread('Floyd.m4a');
%% Setup
S = y'; n = length(S); % Number of data points
L = n/Fs; % record time in seconds
t2 = linspace(0,L,n+1); t = t2(1:n);
k = (2*pi/L)*[0:n/2-1, -n/2:-1]; ks = fftshift(k); 
St = fft(S); % FFT of signal
Sgt_spec_guitar = []; % Setup emptry spectrogram for guitar
max_guitar = []; % maximum frequency for guitar
zero_freq_ind = length(ks)/2+1; 
ks_cut = ks(zero_freq_ind:length(ks));
plausible_guitar_low = 164.81; plausible_freq_min = 65.41; plausible_freq_max = 1760;
ks_guitar = ks_cut(floor(plausible_guitar_low*L):floor(plausible_freq_max*L))/(2*pi);
%% Perform Gabor Transform
filter_width = 250; translation_jump = 0.05; tslide = 0:translation_jump:L;
for i=1:length(tslide)
    g=exp(-filter_width*(t-tslide(i)).^2);
    Sg = g.*S; Sgt = fft(Sg);
    Sgt_abs = abs(fftshift(Sgt)); Sgt_cut = Sgt_abs(zero_freq_ind:length(ks));
    Sgt_guitar_plausible = Sgt_cut(floor(plausible_guitar_low*L):floor(plausible_freq_max*L));
    Sgt_spec_guitar = [Sgt_spec_guitar; Sgt_guitar_plausible]; % Add to spectrogram  
    [~, max_guitar_sample] = max(Sgt_guitar_plausible);
    max_guitar = [max_guitar; ks_guitar(max_guitar_sample)]; 
end
%% Presentation
num_freqs = 0:49; freq_list = 65.41 .* (2^(1/12)).^num_freqs; % Music Notes Setup
name_list = ["C2","C#2","D2","D#2","E2","F2","F#2","G2","G#2","A2","A#2","B2",...
             "C3","C#3","D3","D#3","E3","F3","F#3","G3","G#3","A3","A#3","B3",...
             "C4","C#4","D4","D#4","E4","F4","F#4","G4","G#4","A4","A#4","B4",...
             "C5","C#5","D5","D#5","E5","F5","F#5","G5","G#5","A5","A#5","B5",...
             "C6","C#6"];
bpm = 61; bps = 60/bpm;
figure(1); subplot(2,1,1),pcolor(tslide,ks_guitar,log(abs(Sgt_spec_guitar.')+1)), shading interp;
set(gca,'Ylim', [min(ks_guitar) max(ks_guitar)]);
colormap(hot), title("High Pass Filter of Spectrogram of 'Comfortably Numb' Solo", 'FontSize',14), ...
    xlabel('Time [sec]'), ylabel('Frequency [Hz]');
for n=1:length(name_list)
    yline(freq_list(n),'c',name_list(n));
end
for b=0:floor(L/bps)
    xline(bps*b,'m'); xline(bps*b+(bps/2),'y')
end
subplot(2,1,2), plot(tslide,max_guitar);
title("Maximum High Frequencies At Each Time Step",'FontSize',14), xlabel('Time [sec]'), ylabel('Frequency [Hz]');
yline(311.13,'c','Bass High');
for n=26:length(name_list)
    yline(freq_list(n),'c',name_list(n));
end
for b=0:floor(L/bps)
    xline(bps*b,'m'); xline(bps*b+(bps/2),'y')
end
guitar_notes = note_map(max_guitar)