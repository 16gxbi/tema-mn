function signal = apply_reverb(signal, impulse_response)
  signal = signal(:);

  % Dacă impulse_response este stereo, convertește-l în mono
  if size(impulse_response, 2) == 2
    impulse_response = mean(impulse_response, 2);
  endif
  impulse_response = impulse_response(:);  % coloană

  % Convoluție folosind FFT (metoda rapidă)
  N = length(signal) + length(impulse_response) - 1;
  Y = ifft(fft(signal, N) .* fft(impulse_response, N));

  % Normalizare
  max_val = max(abs(Y));
  if max_val > 0
    signal= Y/ max_val;
  else
    signal= Y;
  endif
endfunction
