% Page 69 Example 2.13
A = [1 2 2; 4 4 2; 4 6 4];
b = [3 6 10]';

[L,U] = myLU(A) % Factorization: L U = A
y = fwdSubst(L,b); % fwdSubst to solve for y in: Ly=b
x = flipud(backSubst(U,y)); % backSubst to solve for x in: Ux = y
                            % but since the return value is reversed
                            % we must use flipud to reverse it back

% Another example
M = [2 4 -2; 4 9 -3; -2 -3 7];
n = [2 8 10]';
[X,Y] = myLU(M); % Factorization: L U = A
z = fwdSubst(X,n); % fwdSubst to solve for y in: Ly=b
w = flipud(backSubst(Y,z)); % backSubst to solve for x in: Ux = y