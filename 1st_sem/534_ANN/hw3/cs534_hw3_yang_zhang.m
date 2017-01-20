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

degree = 1;
V = ones(25, degree + 1);
V(:,2) = x25;
%disp(V)

A=V'*V;
b= V'*y25;
x=A\b;
fit1=V*x;
%disp(fit);
Ein(degree) = (fit1-y25)'*(fit1-y25);
disp(Ein(degree))
D = ones(75, degree+1);
D(:,2) = x75;
valFit = D*x;
Eval(degree) = (valFit-y75)'*(valFit-y75);
disp(Eval(degree))



degree = 2;
V = ones(25, degree + 1);
V(:,2) = x25;
V(:,3) = V(:,2).*x25;
%disp(V)

A=V'*V;
b= V'*y25;
x=A\b;
fit2=V*x;
%disp(fit);
Ein(degree) = (fit2-y25)'*(fit2-y25);
disp(Ein(degree))
D = ones(75, degree+1);
D(:,2) = x75;
D(:,3) = D(:,2).*x75;
valFit = D*x;
Eval(degree) = (valFit-y75)'*(valFit-y75);
disp(Eval(degree))



degree = 3;
V = ones(25, degree + 1);
V(:,2) = x25;
V(:,3) = V(:,2).*x25;
V(:,4) = V(:,3).*x25;
%disp(V)

A=V'*V;
b= V'*y25;
x=A\b;
fit3=V*x;
%disp(fit);
Ein(degree) = (fit3-y25)'*(fit3-y25);
disp(Ein(degree))
D = ones(75, degree+1);
D(:,2) = x75;
D(:,3) = D(:,2).*x75;
D(:,4) = D(:,3).*x75;
valFit = D*x;
Eval(degree) = (valFit-y75)'*(valFit-y75);
disp(Eval(degree))



degree = 4;
V = ones(25, degree + 1);
V(:,2) = x25;
V(:,3) = V(:,2).*x25;
V(:,4) = V(:,3).*x25;
V(:,5) = V(:,4).*x25;
%disp(V)

A=V'*V;
b= V'*y25;
x=A\b;
fit4=V*x;
%disp(fit);
Ein(degree) = (fit4-y25)'*(fit4-y25);
disp(Ein(degree))
D = ones(75, degree+1);
D(:,2) = x75;
D(:,3) = D(:,2).*x75;
D(:,4) = D(:,3).*x75;
D(:,5) = D(:,4).*x75;
valFit = D*x;
Eval(degree) = (valFit-y75)'*(valFit-y75);
disp(250)
disp(Eval(degree))



degree = 5;
V = ones(25, degree + 1);
V(:,2) = x25;
V(:,3) = V(:,2).*x25;
V(:,4) = V(:,3).*x25;
V(:,5) = V(:,4).*x25;
V(:,6) = V(:,5).*x25;
%disp(V)

A=V'*V;
b= V'*y25;
x=A\b;
fit5=V*x;
%disp(fit);
Ein(degree) = (fit5-y25)'*(fit5-y25);
disp(Ein(degree))
D = ones(75, degree+1);
D(:,2) = x75;
D(:,3) = D(:,2).*x75;
D(:,4) = D(:,3).*x75;
D(:,5) = D(:,4).*x75;
D(:,6) = D(:,5).*x75;
valFit = D*x;
Eval(degree) = (valFit-y75)'*(valFit-y75);
disp(Eval(degree))





degree = 1;
V = ones(100, degree + 1);
V(:,2) = x100;
%disp(V)

A=V'*V;
b= V'*y100;
x=A\b;
fit3=V*x;

Ein3all = (fit3-y100)'*(fit3-y100);
figure(1)
plot(xeq, f(xeq))
hold on
plot(x100,fit3,'b*')
plot(x100,y100,'r+')
hold off

meany = sum(y100)/100;
Ein0 = (y100-meany)'*(y100-meany);
rsq = 1-(Ein3all/Ein0);
disp([Ein3all, Ein0, rsq])

degree = 2;
V = ones(100, degree + 1);
V(:,2) = x100;
V(:,3) = V(:,2).*x100;
%disp(V)

A=V'*V;
b= V'*y100;
x=A\b;
fit3=V*x;

Ein3all = (fit3-y100)'*(fit3-y100);
figure(2)
plot(xeq, f(xeq))
hold on
plot(x100,fit3,'b*')
plot(x100,y100,'r+')
hold off

meany = sum(y100)/100;
Ein0 = (y100-meany)'*(y100-meany);
rsq = 1-(Ein3all/Ein0);
disp([Ein3all, Ein0, rsq])


degree = 3;
V = ones(100, degree + 1);
V(:,2) = x100;
V(:,3) = V(:,2).*x100;
V(:,4) = V(:,3).*x100;
%disp(V)

A=V'*V;
b= V'*y100;
x=A\b;
fit3=V*x;

Ein3all = (fit3-y100)'*(fit3-y100);
figure(3)
plot(xeq, f(xeq))
hold on
plot(x100,fit3,'b*')
plot(x100,y100,'r+')
hold off

meany = sum(y100)/100;
Ein0 = (y100-meany)'*(y100-meany);
rsq = 1-(Ein3all/Ein0);
disp([Ein3all, Ein0, rsq])


degree = 4;
V = ones(100, degree + 1);
V(:,2) = x100;
V(:,3) = V(:,2).*x100;
V(:,4) = V(:,3).*x100;
V(:,5) = V(:,4).*x100;
%disp(V)

A=V'*V;
b= V'*y100;
x=A\b;
fit3=V*x;

Ein3all = (fit3-y100)'*(fit3-y100);
figure(4)
plot(xeq, f(xeq))
hold on
plot(x100,fit3,'b*')
plot(x100,y100,'r+')
hold off

meany = sum(y100)/100;
Ein0 = (y100-meany)'*(y100-meany);
rsq = 1-(Ein3all/Ein0);
disp([Ein3all, Ein0, rsq])

degree = 5;
V = ones(100, degree + 1);
V(:,2) = x100;
V(:,3) = V(:,2).*x100;
V(:,4) = V(:,3).*x100;
V(:,5) = V(:,4).*x100;
V(:,6) = V(:,5).*x100;
%disp(V)

A=V'*V;
b= V'*y100;
x=A\b;
fit3=V*x;

Ein3all = (fit3-y100)'*(fit3-y100);
figure(5)
plot(xeq, f(xeq))
hold on
plot(x100,fit3,'b*')
plot(x100,y100,'r+')
hold off

meany = sum(y100)/100;
Ein0 = (y100-meany)'*(y100-meany);
rsq = 1-(Ein3all/Ein0);
disp([Ein3all, Ein0, rsq])
