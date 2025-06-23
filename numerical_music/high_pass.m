function signal = high_pass(signal, fs, cutoff_freq)
  % Asiguram ca semnalul este un vector coloană
  signal=signal(:);

  % Lungimea semnalului
  N=length(signal);

  % Transformata Fourier a semnalului
  X=fft(signal);

  % Vectorul de frecvențe
  f=(0:N-1)'*fs/N;

  % Initializare masca
  mask=ones(N, 1);
  mask(f<cutoff_freq)=0;

  % Ajustare masca pentru simetrie
  for i=2:floor(N/2)
    if mask(i)==0
      mask(N-i+2)=0;
    endif
  endfor

  % Aplicarea filtrului high-pass
  X_filtered=X.*mask;

  % Transformata inversa Fourier pentru a obține semnalul filtrat
  signal=real(ifft(X_filtered));

  % Normalizare semnalului
  max_val=max(abs(signal));
  if max_val>0
    signal=signal/max_val;
  endif
endfunction
