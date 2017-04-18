function [x,k,E] = GaussSeidel(A,b,tol,Maxiter)

if nargin < 3
    tol     = 1e-6;
    Maxiter = 1e3;
end
[n,m]=size(A);
if n ~= m; error('la matriz no es cuadrada'); end
m = length(b);
if n ~= m; error('la matriz y el dato no tienen el mismo size'); end

d = diag(A);
v = d==0;
if sum(v)>0; error('elementos nulos en la diagonal'); end;

k = 0;
x = ones(n,1);
E = tol+1;
while E > tol && k < Maxiter
    k    = k+1;
    x0   = x;
    x(1) = (b(1)-A(1,2:n)*x0(2:n))/A(1,1);
    for i=2:n-1
        x(i) = (b(i)-A(i,1:i-1)*x(1:i-1)-A(i,i+1:n)*x(i+1:n))/A(i,i);
    end
    x(n) = (b(n) - A(n,1:n-1)*x(1:n-1))/A(n,n);
    E = norm(x - x0);
end

end