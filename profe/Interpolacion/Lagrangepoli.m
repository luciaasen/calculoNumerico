function p = Lagrangepoli(x,v,y)

[m,n] = size(y);
if n > m; y = y'; end;

n=length(v);
m=length(y);
if n~=m; error('datos no compatibles'); end;

L = caracteristicos(x,v);

p = L*y;

end