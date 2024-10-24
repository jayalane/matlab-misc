function U = cholesky(A)
% computes the Cholesky decomposition of a s.p.d. matrix A

n=size(A,1);

for j=1:n-1
    for i=j+1:n
        % we eliminate the entry (i,j) using the entry (j,j) in row j
        t = A(j,i)/A(j,j); % the multiplier, also A(i,j)=A(j,i)
        % we subtract t times row j from row i
        for k=i:n      % only from the diagonal to the right
            A(i,k) = A(i,k) - t*A(j,k);
        end
    end
end
% have DU thus far, we need to produce D^(1/2)*U
for i=1:n
    t=1/sqrt(A(i,i));
    for j=i:n
        A(i,j)=A(i,j)*t;
    end
end
U=triu(A);