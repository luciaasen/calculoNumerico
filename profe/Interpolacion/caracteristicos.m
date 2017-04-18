function L = caracteristicos(x,v)

[m,n] = size(x);
if n > m; x = x'; end;

m = length(x);
n = length(v);
L = ones(m,n);

for k=2:n;
    L(:,1) = L(:,1).*(x - v(k))/(v(1)-v(k));
end
for j=2:n-1
    for k=1:j-1;
        L(:,j) = L(:,j).*(x - v(k))./(v(j)-v(k));
    end
    for k=j+1:n;
        L(:,j) = L(:,j).*(x - v(k))./(v(j)-v(k));
    end
end
for k=1:n-1;
    L(:,n) = L(:,n).*(x - v(k))./(v(n)-v(k));
end


end