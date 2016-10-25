X = csvread('15.csv');
V = ones(424, 3);
V(:,2) = X(:,1);
V(:,3) = X(:,2);
y = csvread('y.csv');
A=V'*V;
b=V'*y;
x=A\b;
fit=V*x;
%disp(fit);
cnt = 0;
a = 0;
for i = 1 : 424
    bin = 1;
    fiti = V(i,:)*x;
    a = a + fiti;
    if fiti > 3 bin=5;end
    if(bin == y(i)) cnt = cnt+1;end
end
disp(424-cnt);
disp(a/424);

ecvm1=0;
nc=0;
for i=1:424
    jstop = i-1;
    jstart = i+1;
    for j=1:jstop
        Vm1(j,:) = V(j,:);
        ym1(j)=y(j);
    end
    for j=jstart:424
        Vm1(j-1,:) = V(j,:);
        ym1(j-1)=y(j);
    end
    AA=Vm1'*Vm1;
    bb=Vm1'*ym1';
    w = AA\bb;
    fitt = V(i,:)*w;
    risq=(fitt-y(i))^2;
    ecvm1=ecvm1 + risq;
    binn = 1;
    if fitt > 3 binn=5; end
    if (binn == y(i)) nc = nc+1;end
    
end
ecvm1 = ecvm1/424;
disp(ecvm1)
acc = nc/424;
disp(nc)
disp(acc)
xx=linspace(0,0.7);
yy = -2.6496*xx/0.9668-(3-0.8203)/0.9668;
plot(xx,yy,'black','LineWidth',2)
hold on
scatter(V(1:264,2), V(1:264,3),'ro','MarkerFaceColor','r');
scatter(V(264:424,2), V(264:424,3),'bs','MarkerFaceColor','b');
hold off
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        