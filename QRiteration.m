function [A,iterations] = QRiteration(A)

n=size(A,1);
A=hessenberg(A);
convergence = 10^(-16)*norm(A,1);
iterations = zeros(n,1); % how many iterations per eigenvalue

% we allocate the space to store our Givens rotations

StoredGivens = zeros(2,2,n-1);

i=n;
% we work on eigenvalue i
while i>1 % while we still have eigenvalues left to compute
    iterations(i)=iterations(i)+1;
    
    % we work on the matrix A(1:i,1:i)
    shift = WilkinsonShift(A(i-1:i,i-1:i));
    % we shift the matrix
    for k=1:i
        A(k,k)=A(k,k)-shift;
    end
    
    % We compute the QR decomposition by killing entries
    % (2,1), (3,2), ..., (n,n-1) using Givens rotations
    
    for k=2:n
        % we kill entry (k,k-1) using the one just above it
        G=givens(A(k-1:k,k-1));
        A(k-1:k,:)=G*A(k-1:k,:);
        A(k,k-1)=0;
        StoredGivens(:,:,k-1)=G;
    end
    
    % Next, we complete the similarity transformation on the right
    for k=2:n
        G=StoredGivens(:,:,k-1);
        A(:,k-1:k)=A(:,k-1:k)*G';
    end
    
    for k=1:i
        A(k,k)=A(k,k)+shift;
    end
    
    % detect convergence
    if abs(A(i,i-1))<convergence 
        A(i,i-1)=0;
        i=i-1;
        
        % moving on to the next eigenvalue
    end
end