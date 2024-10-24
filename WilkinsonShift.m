function s = WilkinsonShift(A)
% produces the Wilkinson shift for a 2x2 matrix A, which is the eigenvalue
% of A closest to A(2,2)

z=(A(1,1)-A(2,2))/2;
s=sqrt(z^2+A(2,1)*A(1,2));
z=z+A(2,2);
e1=z+s;
e2=z-s;

if abs(e1-A(2,2))<abs(e2-A(2,2)) 
    s=e1;
else
    s=e2;
end