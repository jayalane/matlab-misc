function [L,U] = lunpexpert(A)
% computes the LU decomposition with no pivoting of a matrix A and 
% stores the result in the original matrix A
% U is triu(A) and L is eye(n) + tril(A,-1)

n=size(A,1);

for j=1:n-1
    for i=j+1:n
        % we eliminate the entry (i,j) using the entry (j,j) in row j
        A(i,j) = A(i,j)/A(j,j); % the multiplier
        % we subtract L(i,j) times row j from row i
        for k=j+1:n
            A(i,k) = A(i,k) - A(i,j)*A(j,k);
        end
    end
end

U=triu(A);
L=tril(A,-1)+eye(n);