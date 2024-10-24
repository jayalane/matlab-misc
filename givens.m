function G=givens(x)
% function G=givens(x)
% returns the Givens rotation that kills the second entry of the 2-vector x

if x(2) == 0 
    c=1; s=0;
else 
    t=1/sqrt(abs(x(1))^2+abs(x(2))^2);
    c=x(1)*t;
    s=x(2)*t;
end
G = [conj(c) conj(s); -s c];
    
    