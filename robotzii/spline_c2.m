function coef = spline_c2 (x, y)
	% Remember that the indexes in Matlab start from 1, not 0

	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3
	% si'(x)  =      bi         + 2ci(x - xi)  + 3di(x - xi)^2
	% si''(x) =                   2ci          + 6di(x - xi)

	% Numar de intervale
  	n=length(x)-1;

	% Lungimile intervalelor
  	h=diff(x);

	% Matricea sistemului pentru valorile derivatei secunde M
  	A=zeros(n+1);
  	rhs=zeros(n+1, 1);

	% Conditii de margine
  	A(1,1)=1;
  	A(end,end)=1;

	% Umple matricea A si vectorul rhs
  	for i=2:n
    	A(i,i-1)=h(i-1);
    	A(i,i)=2*(h(i-1)+h(i));
    	A(i,i+1)=h(i);
    	rhs(i)=6*((y(i+1)-y(i))/h(i)-(y(i)-y(i-1))/h(i-1));
  	endfor

	% Rezolvam sistemul
  	M=A\rhs;

	% Coeficientii pentru fiecare interval
  	coef=[];
  	for i=1:n
    	a=y(i);
    	b=(y(i+1)-y(i))/h(i)-h(i)*(2*M(i)+M(i+1))/6;
    	c=M(i)/2;
    	d=(M(i+1)-M(i))/(6*h(i));
    	coef=[coef; a; b; c; d];
  	endfor
endfunction
