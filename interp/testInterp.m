function y = testInterp(f, a, b, n, x)
    xi = zeros(n,1);
    yi = zeros(n,1);
    for i = 1:n
        % generamos n puntos equidistantes en [a,b], y calculamos f(xi)
        % Esos seran los pares (x,y) que pasaremos a pLagrange
        xi(i) = a + (i-1)*b/(n-1);
        yi(i) = f(xi(i));
    end
    %Comprobamos que el resultado es correcto en todos los xi, al menos
    for i = 1:n
        k = pLagrange(xi(i), xi, yi);
        if yi(i) ~= k
            error('f(x %d ) es distinto al polinomio de Lagrange en xi',i)
        end
    end
    y = pLagrange(x, xi, yi);
end