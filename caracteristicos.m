% Devuelve un vector con todos los L1....Ln
function L = caracteristicos(x, xi)
    [n, m] = size(xi);
    if m~= 1
        error('Dimension del vector xi no es n*1')
    end
    L = diag(eye(n));
    for j = 1:n
        for k = 1:n
            if j~=k
                L(j) = L(j) * (x - xi(k))/(xi(j) - xi(k));
            end
        end
    end
end