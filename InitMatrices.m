function [A, x, u] = InitMatrices(n)
    x = rand(n,1);
    u = rand(n,1);
    A0 = rand(n,1);
    A1 = rand(n-1,1);

    A = zeros(n, n);
    for i = 1:n-1
        A(i,i) = A0(i);
        A(i, i+1) = A1(i);
        A(i+1,i) = A1(i);
    end
    A(n,n)= A0(n);
end    
