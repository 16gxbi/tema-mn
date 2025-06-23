function instrument_map = create_instruments(file, fs, num_instruments)
  % Initializeaza o celula pentru a stoca datele instrumentelor
  % Fiecare instrument are 7 parametri: nume, frecventa, durata, atac, decaim, sustinere, eliberare
  instruments = cell(num_instruments, 7);

  % Deschide fisierul pentru citire
  for i = 1 : num_instruments
    line = fgetl(file);
    instruments(i, :) = strtrim(strsplit(line, ','));
  end

  % Initializeaza un map pentru a stoca instrumentele
  instrument_map = containers.Map('KeyType', 'char', 'ValueType', 'any');

  % Parcurge fiecare instrument si creeaza un oscilator
  for i = 1 : num_instruments
    name = char(instruments{i, 1});
    freq = str2num(instruments{i, 2});
    duration = str2num(instruments{i, 3});
    attack = str2num(instruments{i, 4});
    decay = str2num(instruments{i, 5});
    sustain = str2num(instruments{i, 6});
    release = str2num(instruments{i, 7});
    
    % Genereaza un oscilator pentru instrument
    osc = oscillator(freq, fs, duration, attack, decay, sustain, release);

    % Adauga oscilatorul in map folosind numele ca cheia
    instrument_map(name) = osc;
  endfor
endfunction
