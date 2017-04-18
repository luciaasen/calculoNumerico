function err = errRunge(nNodos, nPuntos)
   f = @(x) 1./(1+(x.^2));
   
   % Hallamos los {(x,y)} donde interpolar
   a = -5;
   b = 5;
   int1 = (b - a)/nNodos;
   xnodos = [a:int1:b];
   ynodos = f(xnodos);
   g1=sprintf('%d ', xnodos);
   g2=sprintf('%d ', ynodos);
   fprintf('xnodos %s\nynodos: %s\n', g1, g2)
   
   % Hallamos los puntos donde plotear
   int2 = (b-a)/nPuntos;
   puntos = [a:int2:b];
   
   % Hallamos el valor del polinomio en estos puntos
   p = zeros(length(puntos),1);
   for i = 1:length(puntos)
       p(i) = pLagrange(puntos(i), xnodos, ynodos);
   end
   
   %Dibujamos
   plot(puntos, f(puntos), 'r');
   hold on
   plot(puntos, p)
   hold off
   
   %[n, m] = size(f(puntos));
   %[o, p2] = size(p);
   %fprintf('%d %d \n %d %d \n', n,m, o,p2); 
   
   err = max(abs(f(puntos) - p'));
                                
end