load('light_pca.mat')
X = [X(:,1:n) X(:,n+n:size(X,2))];
Y = [Y(:,1:n) Y(:,n+n:size(Y,2))];
X_new = linspace(-125,125,125);
Y_new = linear_interp(X,Y,X_new);

figure(1);
set(gcf,'name','Light Plot: Linear (Omitted)','NumberTitle','off')
for i = 1:size(Y,1)
    subplot(4,4,i)
    figure(1),plot(X,Y(i,:),'.'),axis([-125 125 -1.1 1.1])
    hold on
    figure(1),plot(X_new,Y_new(i,:))
    hold off
end

figure(2);
set(gcf,'name','Light Image: Linear (Omitted)','NumberTitle','off')
for c = 1:size(Y_new,2)
    Ic = renderim(Y_new(:,c),B,imsize);
    figure(2),imshow(Ic)
    drawnow
end