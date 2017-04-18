function [u,lambda,E,k] = iteracionespectral(A,er,nit)
% [u,lambda,E,k] = iteracionespectral(A) intenta calcular el
% maximo autovalor lambda y el autovector asociado u
% de la matriz T = A'*A con un metodo iterativo.
% El error E mide la distancia entre T*u y lambda*u, y
% k devuelve el numero de iteraciones.
T = A'*A;
n = size(T,1);
b = randn(n,1);

k = 1;
u = T*b/norm(T*b);
% E = norm(u-b);
% while (E > er) && (k <= nit)
%     k = k+1;
%     v = u;
%     u = T*u/norm(T*u);
%     E = norm(v-u);
% end
% lambda = norm(T*u)/norm(u);
% E = norm(T*u - lambda*u);
lambda = norm(T*u)/norm(u);
E = norm(T*u - lambda*u);
while (E > er) && (k <= nit)
    k = k+1;
    u = T*u/norm(T*u);
    lambda = norm(T*u)/norm(u);
    E = norm(T*u - lambda*u);
end

end