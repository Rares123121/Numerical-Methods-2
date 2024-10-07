function signal = apply_reverb(signal, impulse_response)
  %signal = 0;
  mono_rez = stereo_to_mono(impulse_response);
  convolutie = fftconv(signal, mono_rez);
  convolutie = convolutie / max(abs(convolutie));
  signal = convolutie;
endfunction

