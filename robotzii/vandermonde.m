function coef = vandermonde(x, y)
    % x = [x0, x1, ..., xn]'
    % y = [y0, y1, ..., yn]'
    % coef = [a0, a1, a2, ..., an]'

    % Numarul de intervale
    n=length(x);

    % Matricea Vandermonde
    V=zeros(n);
    
    % Umple matricea Vandermonde
    for i=1:n
        for j=1:n
            V(i,j)=x(i)^(j-1);
        endfor
    endfor

    % Rezolvam sistemul V * coef = y
    coef=V\y;
endfunction
