function B = TriangularizeDumb(A)
    n = size(A)
    for i = 2:n
        for j = 1:i-1
            A(i,j)  = 0;
        end
    end
    B = A;
end