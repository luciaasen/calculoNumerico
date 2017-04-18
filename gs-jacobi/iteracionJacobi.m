function x = iteracionJacobi(A, b, x, n)    
    for i = 1:n
        ai = A(i, :);
        s = sum(ai*x) - ai(i)*x(i);
        x(i) = 1/ai(i)*(b(i) - s);
    end
end