function mono = stereo_to_mono(stereo)
  if(columns(stereo)==1)
    mono=stereo;
  else
    stereo=stereo';
    mono=mean(stereo);
    mono=mono';
  endif
  mono=mono/max(abs(mono));
endfunction
