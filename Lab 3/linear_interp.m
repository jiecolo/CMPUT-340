function Y_new = linear_interp(X,Y,X_new)
    Y_new = spline(X,Y,X_new);
end