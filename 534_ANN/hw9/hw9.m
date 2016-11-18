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

for i=1:rows
   xt=[a(i,1),a(i,2),a(i,3),a(i,4),a(i,5),a(i,6),a(i,7),a(i,8),a(i,9)]; 
   z1(i) = xt*V(:,9);
   z2(i) = xt*V(:,8);
end

figure();
plot(z1,z2,'r*')