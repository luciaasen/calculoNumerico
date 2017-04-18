function [x, iter, err] = GaussSeidel(A, b, maxIter, tol))
% Para comprobar si ceros en diagonal
d = diag(A); v = d == 0; 
if sum(v) > 0 
    error('Elmentos nulos en la diagonal');
end


while err > tol && iter < maxIter
   x0 = x;
   for i = 1:n
        x(i) = 1/d(i) * (b(i) - sum(A(i, 1:i-1)*x(i, 1: i-1))
   end
end

end