function B=WritingForLoops(A)

n=size(A,1); % number of rows

for i=n:-1:2             % row index of first entry in subdiagonal i-1
    for j=1:n-i+1        % entry j in subdiagonal that started at (i,1)
        A(i+j-1,j)=0     % the entry in subdiagonal i, column j is A(i+j,j)
        pause
    end
end