function [x, err, iter] = Jacobi(A, b, maxIter, tol)
[n,m] = size(A);
if n ~= m
    error('kk de la vaca');
end
for i = 1: n
    if sum(abs(A)')' > 2*A(i,i)
        error('No dominante');
    end
end

x = randn(n, 1);
err = norm(A*x - b);
iter = 0;
while(iter < maxIter && tol < err)
    x = iteracionJacobi(A, b, x, n);
    err = norm(A*x - b);
    iter = iter + 1;
end
end