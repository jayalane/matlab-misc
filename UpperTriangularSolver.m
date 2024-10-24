function x=UpperTriangularSolver(U,b)

% solves Ux=b for an upper triangular matrix U

n=size(U,1);

x=zeros(n,1);

for i=n:-1:1
    x(i)=b(i);
    for j=i+1:n
        x(i)=x(i)-U(i,j)*x(j);
    end
    x(i)=x(i)/U(i,i);
end