function [x,E,N] = pfix(g,x0,t,Nmax)

% t    = 1e-6;
% Nmax = 100;

x = x0;
N = 0;
E = 1+t;
while (N < Nmax) && (E > t)
    y = x;
    x = g(x);
    E = abs(y - x);
    N = N + 1;
end

end