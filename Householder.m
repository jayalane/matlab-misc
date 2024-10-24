function u = Householder(x)

u=x;
u(1)=u(1)-sign(u(1))*norm(x);
u=u/norm(u);