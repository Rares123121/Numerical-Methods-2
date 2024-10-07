function signal = low_pass(signal, fs, cutoff_freq)
  %signal = 0;

  x_aux = fft(signal);

  for i = 1:length(signal)
    freq(i) = (i - 1) * (fs / length(signal));
  endfor

  for i = 1:length(signal)

    if freq(i) < cutoff_freq
      masca(i) = 1;
    endif
    if freq(i) > cutoff_freq
      masca(i) = 0;
    endif

  endfor

  produs = x_aux .* masca';
  inversa = ifft(produs);

  inversa = inversa / max(abs(inversa));
  signal = inversa;
endfunction

