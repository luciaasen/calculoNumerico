function E = testLagrange(f,v,a,b)

N = 1000;

a = min(a,min(v));
b = max(b,max(v));

x = a:(b-a)/(N-1):b;
y = f(v);


p = Lagrangepoli(x,v,y);

E = max(abs(f(x)-p'));

figure
plot(x,f(x));
hold on
plot(x,p,'r')

end