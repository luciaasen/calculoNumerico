function [P,L,U,err] = gaussLUpivot(A)

[n,m] = size(A);
if n ~= m
    error('La matriz no es cuadrada')
end
P = eye(n);
L = eye(n);
U = A;
for k = 1:n-1
    [M,I] = max(abs(U(k:n,k)));
    r = I + k - 1;
    if r ~= k
       v = U(k,k:n); U(k,k:n) = U(r,k:n); U(r,k:n) = v;
       w = L(k,1:k-1); L(k,1:k-1) = L(r,1:k-1); L(r,1:k-1) = w;
       p = P(k,:); P(k,:) = P(r,:); P(r,:) = p;
    end
    if U(k,k) == 0
    	error('El elemento diagonal %d se ha anulado',k)
	end
    for i = k+1:n
        L(i,k) = U(i,k)/U(k,k);
        for j = k:n
            U(i,j) = U(i,j) - L(i,k)*U(k,j);
        end
    end
end

err = max(max(abs(P*A - L*U)));

end