function [x,k,E] = Jacobisolve(A,b,tol)

if nargin < 3
    tol = 1e-6;
end
[n,m]=size(A);
if n ~= m; error('la matriz no es cuadrada'); end
m = length(b);
if n ~= m; error('la matriz y el dato no tienen el mismo size'); end

d = diag(A);
J = (diag(d)-A);

v = abs(d) > sum(abs(J'))';
boole = floor(sum(v)/n);

if ~boole; error('la matriz no es estrictamente diagonal dominante'); end

D = diag(1./d);

x0 = ones(n,1);
x = D*(J*x0 + b);
k = 1;
while norm(x - x0)>tol
    x0 = x;
    x  = D*(J*x + b);
    k  = k+1;
end
E = norm(A*x - b);
end