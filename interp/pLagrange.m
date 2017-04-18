% x es el punto donde hacemos el polinomio (f(x)), v un vector con los xi e
% y un vector con los yi
function  suma = pLagrange(x, v, y)
    [n, m] = size(v);
    [o, p] = size(y);
    if m~=1
        if n == 1
            v = v';
        else
            fprintf('%d %d\n',n,m)
            error('v no es fila ni columna')
        end
    end
    if p~=1
        if o == 1
            y = y';
        else
            fprintf('%d %d\n',o,p)
            error('y no es fila ni columna')
        end
    end
    if length(v) ~= length(y) 
        error('v e y no tiene las mismas filas')
    end
    [n,m] = size(v);
    %fprintf('%d %d \n', n,m);    
    L = caracteristicos(x, v);
    suma = 0;
    for j = 1:n
       suma = suma + y(j)*L(j);
    end
end