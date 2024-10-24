function [Q,R]=qr243M(A)
% computes the QR decomposition of a matrix A

[m,n]=size(A);
Q=eye(m);

for j=1:n
    for i=j+1:m
        % we will create a zero in position (i,j) using (j,j)
        G=givens([A(j,j);A(i,j)]);
        A([j,i],j:n)=G*A([j,i],j:n);
        A(i,j)=0;
        Q(:,[j,i])=Q(:,[j,i])*G';
    end
end
Q=Q(:,1:n);
R=A(1:n,:);
       
