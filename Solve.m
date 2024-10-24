function x=Solve(A,b)

% solves Ax = b using Gaussian elimination with partial pivoting

[P,L,U]=lupp(A);

% Ax=b means PLUx = b, i.e., Ux=y, PLy=b, Ly = P^Tb

y=LowerTriangularSolver(L,P'*b);
x=UpperTriangularSolver(U,y);
