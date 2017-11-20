function [L,U] = myLU(A)
    [n,n] = size(A);
    L = eye(n);
    U = A;
    
    for k = 1:n
        [U,B] = elimMat(U,k);
        L = L*B;
    end
end