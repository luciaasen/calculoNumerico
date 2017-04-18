n = 100;
b = randn(n, 1);
maxIter = 2000;
tol = 1e-4;
A = randn(n) + 2*n*eye(n);
[x, err, iter] = Jacobi(A, b, maxIter, tol);
iter
err