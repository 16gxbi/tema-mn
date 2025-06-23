function x = oscillator(freq, fs, dur, A, D, S, R)
  % Creeaza vectorul de timp de la 0 pana la durata totala
  t=0:1/fs:dur;
  t=t(1:end-1);

  % Numarul total de esantioane
  total_samples=length(t);

  % Genereaza unda sinusoidala
  sine_wave=sin(2*pi*freq*t)';

  % Calculeaza numarul de esantioane pentru fiecare faza a envolopei
  attack_samples=floor(A*fs);
  decay_samples=floor(D*fs);
  release_samples=floor(R*fs);

  % Calculeaza numarul de esantioane pentru sustinere
  sustain_samples=total_samples-(attack_samples+decay_samples+release_samples);

  % Ajusteaza in caz ca ADSR depaseste durata totala
  if sustain_samples<0
    sustain_samples=0;
    total_env_samples=attack_samples+decay_samples+release_samples;
    if total_env_samples>total_samples
      ratio=total_samples/total_env_samples;
      attack_samples=floor(attack_samples*ratio);
      decay_samples=floor(decay_samples*ratio);
      release_samples=total_samples-(attack_samples+decay_samples);
    endif
  endif

  % Creeaza vectorul de envolope ADSR
  attack_env=linspace(0, 1, attack_samples);
  decay_env=linspace(1, S, decay_samples);
  sustain_env=S*ones(1, sustain_samples);
  release_env=linspace(S, 0, release_samples);

  % Combină toate fazele envolopei
  env=[attack_env, decay_env, sustain_env, release_env]';
  env_len=length(env);

  % Ajusteaza dimensiunea envolopei pentru a se potrivi cu numarul total de esantioane
  if env_len<total_samples
    env(end+1:total_samples)=0;
  elseif env_len>total_samples
    env=env(1:total_samples);
  endif

  % Aplica envolopa la unda sinusoidala
  x=sine_wave.*env;
endfunction
