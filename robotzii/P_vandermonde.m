function y_interp = P_vandermonde (coef, x_interp)
	% P_vandermonde(x) = a0 + a1 * x + a2 * x^2 + ... + an * x^n
	% coef = [a0, a1, a2, ..., an]'
	% y_interp(i) = P_vandermonde(x_interp(i)), i = 0 : length(x_interp) - 1
	
	% Nr coeficienti
	n=length(coef);

	% Nr de puncte de interpolare
	m=length(x_interp);

	% Initializare vector de iesire
	y_interp=zeros(m, 1);

	for i=1:m
		% Initializare suma
		y_interp(i)=0;
		for j=1:n
			% Calculez termenul j al polinomului
			y_interp(i)=y_interp(i)+coef(j)*x_interp(i)^(j-1);
		endfor
	endfor
endfunction
