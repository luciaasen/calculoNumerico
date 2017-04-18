% l1...l1n autovalores de mayor a menor, v1...vn sus avectores
% Encontrar l1, v1

function[lambda, u, Elambda] = iteracionSpectral(T, maxIter, ERR)
[n,m] = size(T);
if(n ~= m)
    error('Matriz no cuadrada');
end
u =randn(m, 1);
uanterior = zeros(m, 1);
niter = 0;
Err_act = norm(uanterior - u);
while(niter < maxIter && Err_act > ERR)
    uanterior = u;
    mult = (T*u);
    u = mult/norm(mult);
    Err_act = norm(uanterior-u);
    niter = niter + 1;
end
mult = T*u;
lambda = norm(mult)/norm(u);
Elambda = norm(mult - lambda*u);
end