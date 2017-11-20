function y = backSubst(U,b,k)
    [m,n] = size(U);
    if ~exist('k')  % If first call no k param given, but k=n
        k = n;
    end
  
    y = b(k) / U(k,k);
    if k > 1 % Recursion step
        u = [U(1:k-1,k); zeros(m-k+1,1)];
        y = [y; backSubst(U,b-y*u,k-1)];
    end
end