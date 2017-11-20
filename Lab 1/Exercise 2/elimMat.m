function [M,L] = elimMat(A,k)
    [n, n] = size(A);
    M = eye(n);
    
    M(1:n,k) = M(1:n,k) + [zeros(k,1); -A(k+1:n, k)/A(k,k)];
    L = inv(M);
    M = M*A;
end