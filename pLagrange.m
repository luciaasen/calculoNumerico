% x es el punto donde hacemos el polinomio (f(x)), v un vector con los xi e
% y un vector con los yi
function  suma = pLagrange(x, v, y)
    [n, m] = size(v);
    [o, p] = size(y);
    if m~=1
        error('v no tiene una sola columna')
    end
    if p~=1
        error('y no tiene una sola columna')
    end
    if n~=o
        error('v e y no tiene las mismas filas')
    end
        
    L = caracteristicos(x, v);
    suma = 0;
    for j = 1:n
       suma = suma + y(j)*L(j);
    end
end