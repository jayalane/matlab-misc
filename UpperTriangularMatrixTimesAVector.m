function [c, flopcount] = UpperTriangularMatrixTimesAVector(A,x)

n=length(x);

flopcount = 0;

c=zeros(n,1);

for i=1:n
    for j=i:n
        c(i)=c(i)+A(i,j)*x(j);
        flopcount = flopcount + 2;
    end
end

