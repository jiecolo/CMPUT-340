load('EllipsePoints.mat')

% center the data
Y1_center = Y1 - mean(Y1,2) * ones(1,size(Y1,2));   
Y2_center = Y2 - mean(Y2,2) * ones(1,size(Y2,2));
Y3_center = Y3 - mean(Y3,2) * ones(1,size(Y3,2));

% compute the empirical covariance matrix
C1 = Y1_center * Y1_center' / size(Y1(2,:),2);
C2 = Y2_center * Y2_center' / size(Y2(2,:),2);
C3 = Y3_center * Y3_center' / size(Y3(2,:),2);

% eigen decomposition
[X1,D1] = eig(C1);
[X2,D2] = eig(C2);
[X3,D3] = eig(C3);
D1 = 2*sqrt(D1);
D2 = 2*sqrt(D2);
D3 = 2*sqrt(D3);

% plot
hold on
m1 = mean(Y1,2);
m2 = mean(Y2,2);
m3 = mean(Y3,2);

plot(Y1(1,:),Y1(2,:),'.')
axis equal
plot(D1(1,1)*[0 X1(1,1)]+m1(1),D1(1,1)*[0 X1(2,1)]+m1(2),'r')
plot(D1(2,2)*[0 X1(1,2)]+m1(1),D1(2,2)*[0 X1(2,2)]+m1(2),'g')

plot(Y2(1,:),Y2(2,:),'.')
plot(D2(1,1)*[0 X2(1,1)]+m2(1),D2(1,1)*[0 X2(2,1)]+m2(2),'r')
plot(D2(2,2)*[0 X2(1,2)]+m2(1),D2(2,2)*[0 X2(2,2)]+m2(2),'g')

plot(Y3(1,:),Y3(2,:),'.')
plot(D3(1,1)*[0 X3(1,1)]+m3(1),D3(1,1)*[0 X3(2,1)]+m3(2),'r')
plot(D3(2,2)*[0 X3(1,2)]+m3(1),D3(2,2)*[0 X3(2,2)]+m3(2),'g')

axis([-10 10 -5 5])

hold off