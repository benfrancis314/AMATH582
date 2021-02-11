num_freqs = [0:61];
freq_list = 41.21 .* (2^(1/12)).^num_freqs;
name_list = ["E1","F1","F#1","G1","G#1","A1","A1#","B1","C1","C#1","D1","D#1",...
             "E2","F2","F#2","G2","G#2","A2","A2#","B2","C2","C#2","D2","D#2",...
             "E3","F3","F#3","G3","G#3","A3","A3#","B3","C3","C#3","D3","D#3",...
             "E4","F4","F#4","G4","G#4","A4","A4#","B4","C4","C#4","D4","D#4",...
             "E5","F5","F#5","G5","G#5","A5","A5#","B5","C5","C#5","D5","D#5",...
             "E6","F6"];

function f = note_map(max_freq)
    f = [];
    proximity_threshold = 2;
    for i=1:length(max_freq)
        for j=1:length(freq_list)
            if abs(max_freq(i) - freq_list(j)) < proximity_threshold
                if length(f) == 0 
                    f = [f; name_list(j)];
                elseif (f(length(f)) ~= name_list(j))
                    f = [f; name_list(j)];
                end
            end
        end
    end
end