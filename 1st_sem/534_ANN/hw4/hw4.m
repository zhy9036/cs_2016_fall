f1 = @(x) 800*log(40*(2*x)^3)-x;
f2 = @(x) 800*log(40*(2*x)^6)-x;
y1 = fzero(f1,110000);
y2 = fzero(f2,110000);
disp(y1);
disp(y2);