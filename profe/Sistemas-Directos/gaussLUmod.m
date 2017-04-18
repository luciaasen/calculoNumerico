function [L,U,err] = gaussLUmod(A)

[n,m] = size(A);
if n ~= m
    error('La matriz no es cuadrada')
end

L = eye(n);
U = A;

for k = 1:n-1
	if U(k,k) == 0
    	error('El elemento diagonal %d se ha anulado',k)
	end
    for i = k+1:n
        L(i,k) = U(i,k)/U(k,k);
%         for j = k:n
%             U(i,j) = U(i,j) - L(i,k)*U(k,j);
%         end
        U(i,k:n) = U(i,k:n) - L(i,k)*U(k,k:n);
    end
end

err = max(max(abs(A - L*U)));

end