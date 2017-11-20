function Y_new = polynomial_interp(X,Y,X_new,n)
    A = [];
    for t = 0:n-1
        A = [A X.^t'];
    end
    p = flipud(A\Y')';
    
    Y_new = zeros(size(Y,1),size(X_new,2));
    for i = 1:size(Y,1)
        Y_new(i,:) = polyval(p(i,:),X_new);
    end
end