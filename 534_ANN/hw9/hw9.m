a = csvread('glassdata16.csv');
dimen = 9;
rows = 99;
for i = 1 : dimen
    mu(i) = sum(a(:,i))/rows;
end
for i = 1 : dimen
    for j = i : dimen
        sig(i,j) = 0;
        for k = 1 : rows
            sig(i,j) = sig(i,j) + (a(k,i)-mu(i))*(a(k,j)-mu(j));
        end
        sig(i,j) = sig(i,j)/rows;
        sig(j,i) = sig(i,j);
    end
end
disp(sig);
[V,D] = eig(sig);
disp(D);
for i = 1 : dimen
    j = dimen-i+1;
    eigenvals(i)=D(j,j);
end
disp(eigenvals')

norm = sum(eigenvals);
pov(1) = eigenvals(1);
for i = 2 : dimen
    pov(i) = pov(i-1) + eigenvals(i);
end

pov = pov/norm;
disp(pov(3));
figure(1);
plot(pov);



figure();
plot(a(:,1),a(:,2),'r*')