function x = LowerTriangularSolver(L,b)

% solves Lx=b for a lower triangular matrix L

n=size(L,1);

x=zeros(n,1);

for i=1:n
    x(i)=b(i);
    for j=1:i-1
        x(i)=x(i)-L(i,j)*x(j);
    end
    x(i)=x(i)/L(i,i);
end

