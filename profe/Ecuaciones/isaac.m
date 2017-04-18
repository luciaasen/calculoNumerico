function [x,E1,E2,N] = isaac(f,df,x0,t1,t2,Nmax)

x = x0;
N = 0;
E1 = 1+t1;
E2 = 1+t2;
while (N < Nmax) && ( (E1 > t1) || (E2 > t2) )
    y = x;
    x = x - f(x)/df(x);

    E1 = abs(y - x);
    E2 = abs(f(x));
    
    N = N + 1;
end

end