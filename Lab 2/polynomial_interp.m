function Y_new = polynomial_interp(X,Y,X_new,n)
    A = [];
    for time = 0:n-1
        A = [A X.^time'];
    end
    p = flipud(A\Y')';
    Y_new = polyval(p, X_new);
end