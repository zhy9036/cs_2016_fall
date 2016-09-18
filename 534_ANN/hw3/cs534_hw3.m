f = inline('2*sin(1.5*x)');
xeq = linspace(0,5,100);

x25 = 5*rand(25,1);
e25 = randn(25,1);
y25 = f(x25) + e25;

x75 = 5*rand(75,1);
e75 = randn(75,1);
y75 = f(x75)+e75;

x100 = x25;
y100 = y25;
for i = 1:75
    x100(i+25) = x75(i);
    y100(i+25) = y75(i);
end

degree = 2;
V = ones(25, degree + 1);
V(:,2) = x25;
V(:,3) = V(:,2).*x25;
%disp(V)

A=V'*V;
b= V'*y25;
x=A\b;
fit=V*x;
disp(fit);
Ein(degree) = (fit-y25)'*(fit-y25);
disp(Ein(degree))
D = ones(75, degree+1);
D(:,2) = x75;
D(:,3) = D(:,2).*x75;
valFit = D*x;
Eval(degree) = (valFit-y75)'*(valFit-y75);
disp(Eval(degree))