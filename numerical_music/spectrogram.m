function [S, f, t] = spectrogram(signal, fs, window_size)
  N=length(signal);

  % Numarul de ferestre
  num_windows=floor(N/window_size);

  % Initializare matrice spectrogramă
  S=zeros(window_size, num_windows);

  % Creeaza o fereastră Hanning
  hann_window=hanning(window_size);

  % Parcurge fiecare fereastră si aplica FFT
  for i=1:num_windows
    start=(i-1)*window_size+1;
    end_idx=start+window_size-1;
    windowed=signal(start:end_idx).*hann_window;

    % FFT si calculul magnitudinii
    fft_result=fft(windowed, 2*window_size);
    magnitude=abs(fft_result(1:window_size));

    % Stocheaza magnitudinea in spectrogramă
    S(:, i)=magnitude;
  endfor

  % Vectorul de frecvențe și timp
  f=(0:window_size-1)'*fs/(2*window_size);
  t=(0:num_windows-1)'*(window_size/fs);
endfunction
