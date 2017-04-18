function [c,Nit,R] = bisec(f,a,b,t,Nmax)

if nargin < 4
    BOOLE = @(x,y) x > 2^(-50)*y;
    s = 0;
else
    BOOLE = @(x) x > t;
    s = 1;
end
if nargin < 5
    Nmax = 100;
end

if f(a)*f(b) > 0
    error('No se cumplen las condiciones del teorema de Bolzano')
elseif f(a)==0
    c   = a;
    Nit = 0;
    R   = f(c);
    return
elseif f(b)==0
    c = b;
    Nit = 0;
    R   = f(c);
    return
end

Nit = 1;
I = b-a;
c = 0.5*(b+a);
if s
    S = BOOLE(I);
else
    S = BOOLE(I,abs(c));
end

while S && (Nit <= Nmax)
    if f(c) == 0
        R = f(c);
        return
    elseif f(a)*f(c) < 0
        b = c;
    else
        a = c;
    end
    Nit = Nit + 1;
    I = b-a;
    c = 0.5*(b+a);
    if s
        S = BOOLE(I);
    else
        S = BOOLE(I,abs(c));
    end    
end

R = f(c);

end