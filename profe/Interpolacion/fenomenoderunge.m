% Fenomeno de Runge: con la función
f = @(x) 1./(1+x.^2)

% para N nodos equiespaciados entre -5 y 5
N = 7;

a = -5;
b = 5;
v = a:(b - a)/(N-1):b;

% se tiene un error que crece con N
E = testLagrange(f,v,a,b)

% observar en azul la función f, y en rojo el polinomio
% interpolador de orden N

% si elegimos otro intervalo, por ejemplo -1.5:1.5
a = -1.5;
b = 1.5;
v = a:(b - a)/(N-1):b;

% no se observa un tal error
E = testLagrange(f,v,a,b)
