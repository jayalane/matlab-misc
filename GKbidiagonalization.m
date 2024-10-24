function A=GKbidiagonalization(A)
% reduces a matrix to bidigonal form using Givens rotations

[m,n]=size(A);

for j=1:n
    for i=j+1:m
        % set entry A(i,j) to zero using row j
        G=givens(A([j,i],j));
        A([j,i],:)=G*A([j,i],:);
        A(i,j)=0;
    end
    for i=j+2:n
        % set entry A(j,i) to zero using column j+1
        G=givens(A(j,[j+1,i]));
        A(:,[j+1,i])=A(:,[j+1,i])*G';
        A(j,i)=0;
    end
end
