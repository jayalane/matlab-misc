function [L,U] = lunp(A)
% computes the LU decomposition with no pivoting of a matrix A

n=size(A,1);
L=eye(n);

for j=1:n-1
    for i=j+1:n
        % we eliminate the entry (i,j) using the entry (j,j) in row j
        L(i,j) = A(i,j)/A(j,j); % the multiplier
        % we subtract L(i,j) times row j from row i
        A(i,j)=0;
        for k=j+1:n
            A(i,k) = A(i,k) - L(i,j)*A(j,k);
        end
    end
end
U=A;