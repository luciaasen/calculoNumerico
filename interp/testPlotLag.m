%En algun futuro, intenta vectorizarlo para que, por ej, calcule muchas L
% caract a la vez, y te devuelva una matriz de L's, y puedas obtener
% polinomio = L*y
function [p,fx] = testPlotLag(f, a, b, n, m, l)
    
    %Puntos donde interpolamos
    xi = zeros(n,1);
    yi = zeros(n,1);
    
    incr = abs(a-b)/n;
    x1 = a:incr:b
    for i = 1:n
       xi(i) = x1(i);
       yi(i) = f(x1(i));
    end
    
    %Calculamos p(x) para unos pocos puntos
    p = zeros(m, 1);
    incr = ans(a-b)/m;
    x2 = a:incr:b
    for i = 1:m
        p(i) = pLagrange(i, xi, yi);
    end
    
    %Calculamos f(x) en muchos puntos para plottear
    fx = zeros(l, 1);
    incr = ans(a-b)/l;
    x3 = a:incr:b
    for i = 1:l
        fx(i) = f(i);
    end
 
    plot(x2, p);
    hold on
    plot(x3, fx);
   
end