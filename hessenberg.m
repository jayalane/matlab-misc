function A=hessenberg(A)
% reduces a matrix to Hessenberg form

n=size(A,1);

% we create zeros below the main subdiagonal using Givens similarity 
% transformations

for j=1:n-2 % columns 1 through n-2
    % in column j we kill entries j+2 through n
    for i=j+2:n
        % form the Givens rotaton that creates a zero in position (i,j)
        % using row j+1
        G=givens(A([j+1,i],j));
        % apply the Givens rotation on the left
        A([j+1,i],:) = G*A([j+1,i],:);
        % complete the similarity on the right by rotating colummns j+1,j+2
        A(:,[j+1,i]) = A(:,[j+1,i])*G';
        A(i,j)=0;
    end
end