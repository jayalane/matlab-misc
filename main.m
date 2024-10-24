function doit()
    timeAndGraph(@(A, x, u) (Alg(A, x, u)), @(A, x, u) (AlgBetter(A, x, u)));
end


doit()


function res = tridiagonMult(A, x)
  n = length(x);
  res = zeros(n);
  for i = 2:n-1
    res(i) = A(i,i-1) * x(i-1) + A(i,i) * x(i) + A(i,i+1) * x(i+1);
  end
  res(1) = A(1,1) * x(1) + A(2,1) * x(2);
  res(n) = A(n,n-1) * x(n-1) + A(n,n) * x(n);
end



function tridiagonScalarMult(AHandle, q)
  n = length(AHandle.Data);
  for i = 2:n-1
    AHandle.Data(i, i-1) = AHandle.Data(i, i-1) * q;
    AHandle.Data(i, i) = AHandle.Data(i, i) * q;
    AHandle.Data(i, i+1) = AHandle.Data(i, i+1) * q;
  end
  AHandle.Data(1,1) = AHandle.Data(1,1) * q;
  AHandle.Data(1,2) = AHandle.Data(1,2) * q;
  AHandle.Data(n,n-1) = AHandle.Data(n, n-1) * q;
  AHandle.Data(n,n) = AHandle.Data(n, n) * q;
end

function res = Alg(A, x,u)
    Q = u.' * x;
    R = A * u;
    res = A * x + R * Q; % the addition is n^2
end

function res = AlgBetter(A, x,u)
    % now the multiplications
	% Q is a number, the following line is O(n)
    Q = u.' * x;
    % A is tri-diagonal
    R = tridiagonMult(A, u);
    aHandle = ArrayHandle();
    aHandle.Data = R;
    tridiagonScalarMult(aHandle, Q);
    T = tridiagonMult(A, x);
    res = R + T;
end
