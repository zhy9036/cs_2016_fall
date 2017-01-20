f = inline('1+9*x.^2');
xeq = linspace(-1,1);
x5 = 2*rand(5,1)-1;
e5 = randn(5,1);
y5 = f(x5) + e5;

x50 = 2*rand(50,1)-1;
e50 = randn(50,1);
y50 = f(x50)+e50;

x55 = x5;
y55 = y5;
for i = 1:50
    x55(i+5) = x50(i);
    y55(i+5) = y50(i);
end

degree = 4;
V = ones(5, degree + 1);
V(:,2) = x5;
V(:,3) = V(:,2).*x5;
V(:,4) = V(:,3).*x5;
V(:,5) = V(:,4).*x5;
D = ones(50, degree + 1);
D(:,2) = x50;
D(:,3) = D(:,2).*x50;
D(:,4) = D(:,3).*x50;
D(:,5) = D(:,4).*x50;
%disp(V)
lam = 0;
A=V'*V + lam.*eye(5,5);
b= V'*y5;
x=A\b;
fit4=V*x;
fit4e=D*x;
Ein(1) = (fit4-y5)'*(fit4-y5);
Eval(1) = (fit4e-y50)'*(fit4e-y50);
%disp(Eval)
y = x(1) + x(2)*xeq + x(3)*xeq.^2 + x(4)*xeq.^3 + x(5)*xeq.^4;
figure();
plot(xeq, f(xeq))
hold on
plot(x5,y5,'rs','MarkerFaceColor', 'r')
plot(xeq, y, 'r')
hold off

ary(1) = 0;
lam = 0.0001;
for i = 1:6
    ary(1+i) = lam;
    A=V'*V + lam.*eye(5,5);
    b= V'*y5;
    x=A\b;
    fit4=V*x;
    fit4e=D*x;
    Ein(1+i) = (fit4-y5)'*(fit4-y5);
    Eval(1+i) = (fit4e-y50)'*(fit4e-y50);
    %disp(Eval)
    y = x(1) + x(2)*xeq + x(3)*xeq.^2 + x(4)*xeq.^3 + x(5)*xeq.^4;
    figure();
    plot(xeq, f(xeq))
    hold on
    plot(x5,y5,'rs','MarkerFaceColor', 'r')
    plot(xeq, y, 'r')
    hold off
    lam = lam*10;
end

figure();
plot(Ein,'red');
figure();
plot(Eval);



