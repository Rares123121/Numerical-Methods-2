function mono = stereo_to_mono(stereo)
  % mono = stereo;
  mono = zeros(rows(stereo), 1);

  for i = 1:rows(stereo)
    suma = 0;
    for j = 1:columns(stereo)
      suma = suma + stereo(i, j);
    endfor
    mono(i) = suma / rows(stereo);
  endfor


  % Normalize
  mono = mono / max(abs(mono));
endfunction

