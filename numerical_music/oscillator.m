function x = oscillator(freq, fs, dur, A, D, S, R)

   samples = round(fs * dur);
   timp = linspace(0, dur, samples);

   wave = sin(2 * pi * freq * timp);

   attack_n = floor(fs * A);
   decay_n = floor(fs * D);
   release_n = floor(fs * R);
   sustain_n = samples - (attack_n + decay_n + release_n);

   attack_a = linspace(0, 1, attack_n);
   decay_a = linspace(1, S, decay_n);
   release_a = linspace(S, 0, release_n);

   sustain_n = round(sustain_n);
   sustain_a = S * ones(1, sustain_n);

   rezultat = [attack_a, decay_a, sustain_a, release_a];
   x = (wave .* rezultat)';

endfunction

