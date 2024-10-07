function [S f t] = spectrogram(signal, fs, window_size)
	%S = 0;
  %f = 0;
  %t = 0;
  lungime = length(signal);
  nr_ferestre = floor(lungime / window_size);

  S = zeros(window_size, nr_ferestre);
  f = zeros(window_size, 1);
  t = zeros(nr_ferestre, 1);

  for i = 1:nr_ferestre
    start_sec = (i - 1) * window_size + 1;
    final_sec = start_sec + window_size - 1;
    fereastra = signal(start_sec:final_sec);

    fereastra2 = fereastra .* hanning(window_size);
    fereastra3 = fft(fereastra2, window_size * 2);
    fereastra3 = fereastra3(1:window_size);

    S(:, i) = abs(fereastra3);
  endfor

  for i = 1:window_size
    f(i) = (i - 1) * (fs / (2 * window_size));
  endfor

  for i = 1:nr_ferestre
    t(i) = (i - 1) * (window_size / fs);
  endfor
endfunction

