f = inline('800*log(40*(2*x)^3)<=x');
ff = @(x) 800*log(40*(2*x)^3)<=x;
y = fzero(ff,10.1111);
%y = solve(800*log(40*(2*x)^3)-x<=0,x);
%yy = solve(,x);
disp(y);