function [x,err]=resuelvesistema(A,b)

[n,m]=size(A);
[P,L,U] = gaussLU(A);
m = length(b);
if n ~= m
    error('El vector b no tiene la dimension de A')
end

z = P*b;
for i = 2:n
    z(i) = z(i) - L(i,1:i-1)*z(1:i-1);
end

% for k = 1:n
%     x(k) = z(k)/U(k,k);
% end
x = z./diag(U);
for i=n-1:-1:1
    x(i) = x(i) - (U(i,i+1:n)*x(i+1:n))/U(i,i);
end

err = max(abs(A*x-b));

end