function y_interp = P_spline (coef, x, x_interp)
	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3, i = 0 : n - 1
	% coef = [a0, b0, c0, d0, a1, b1, c1, d1, ..., an-1, bn-1, cn-1, dn-1]
	% x = [x0, x1, ..., xn]
	% y_interp(i) = P_spline(x_interp(i)), i = 0 : length(x_interp) - 1
	% Be careful! Indexes in Matlab start from 1, not 0

	% Nr de intervale
	n=length(x)-1;

	% Initializare vector de iesire
 	y_interp=zeros(length(x_interp), 1);

	for i=1:length(x_interp)
    	xi=x_interp(i);

		% Gasesc intervalul j astfel incat x(j) <= xi < x(j+1)
    	j=find(xi>=x(1:end-1) & xi<=x(2:end), 1, 'first');

		% Daca xi este in afara intervalului definit de x, il setez la capete
    	if isempty(j)
    		if xi<x(1)
        		j=1;
      		else
        		j=n;
      		endif
    	endif

		% Extrage coeficientii pentru intervalul j
    	a=coef(4*(j-1)+1);
    	b=coef(4*(j-1)+2);
    	c=coef(4*(j-1)+3);
    	d=coef(4*(j-1)+4);

		% Distanta de la xi la x(j)
    	dx=xi-x(j);

		% Calculez valoarea spline-ului in xi
    	y_interp(i)=a+b*dx+c*dx^2+d*dx^3;
  	endfor
endfunction
