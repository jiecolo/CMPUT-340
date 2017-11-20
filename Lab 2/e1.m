m = [0.5 1 2 3];
n = 11;  % n = 11 is nearly optimal
for i = 1:size(m,2)
    X = 0:0.5:m(i)*pi;
	Y = sin(X);
    X_new = (0:0.1:2^(1/n)*m(i)*pi)';
    
    Y_new = polynomial_interp(X,Y,X,n);
    errorX = max(abs(Y_new - sin(X)))
    
    Y_new = polynomial_interp(X,Y,X_new,n);
    errorX_new = max(abs(Y_new - sin(X_new)))
    
    subplot(2,2,i);
    plot(X,Y,':',X_new,Y_new,'-');
end

% 1. For smaller m, and for larger n (roughly 9 <= n <= 15)
%    it fits better
% 2. The error in ground truth of x is likely 
%    smaller than X_new
% 3. The polynomial fits well in between the sample points
% 4. Not well outside the samples interval