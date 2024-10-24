function [P,L,U] = lupp(A)
% computes the LU decomposition with partial pivoting of a matrix A:
% A = PLU, where P is a permutation matrix

n=size(A,1);
p=1:n; % 1 through n, the order of the columns of I in P

for j=1:n-1
    % we will find the largest element in column j
    max = abs(A(j,j));
    maxindex = j;
    for k = j+1:n
        if abs(A(k,j))>max
            max = abs(A(k,j));
            maxindex = k;
        end
    end
    
    % we swap row j and row maxindex
    z = A(j,:); 
    A(j,:) = A(maxindex,:);
    A(maxindex,:) = z;
    
    % we also swap the corresponding columns in P
    y = p(j);
    p(j) = p(maxindex);
    p(maxindex) = y;
    
    
    for i=j+1:n
        % we eliminate the entry (i,j) using the entry (j,j) in row j
        A(i,j) = A(i,j)/A(j,j); % the multiplier
        % we subtract L(i,j) times row j from row i
        for k=j+1:n
            A(i,k) = A(i,k) - A(i,j)*A(j,k);
        end
    end
end

P = eye(n);
P = P(:,p); % take the columns of I in order of the permutation p
U=triu(A);
L=tril(A,-1)+eye(n);