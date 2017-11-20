close all;

n = 6;
X_new = linspace(-125,125,125);

% Question 3
load('light_pca.mat')
Y_new = polynomial_interp(X,Y,X_new,n);

figure(1);
set(gcf,'name','Light Plot: Polynomial','NumberTitle','off')
for i = 1:size(Y,1)
    subplot(4,4,i)
    figure(1),plot(X,Y(i,:),'.'),axis([-125 125 -1.1 1.1])
    hold on
    figure(1),plot(X_new,Y_new(i,:))
    hold off
end

figure(2);
set(gcf,'name','Light Image: Polynomial','NumberTitle','off')
for c = 1:size(Y_new,2)
    Ic = renderim(Y_new(:,c),B,imsize);
    figure(2),imshow(Ic)
    drawnow
end

pause
Y1_new = linear_interp(X,Y,X_new);

figure(1);
set(gcf,'name','Light Plot: Linear','NumberTitle','off')
for i = 1:size(Y,1)
    subplot(4,4,i)
    figure(1),plot(X,Y(i,:),'.'),axis([-125 125 -1.1 1.1])
    hold on
    figure(1),plot(X_new,Y_new(i,:))
    hold off
end

figure(2);
set(gcf,'name','Light Image: Linear','NumberTitle','off')
for c = 1:size(Y_new,2)
    Ic = renderim(Y_new(:,c),B,imsize);
    figure(2),imshow(Ic)
    drawnow
end

pause

% Question 4
load('obj_pca.mat')
X_new = linspace(0,X(size(X,2)),4*size(X,2));
Y_new = polynomial_interp(X,Y,X_new,n);

figure(1);
set(gcf,'name','Object Plot: Polynomial','NumberTitle','off')
for i = 1:size(Y,1)
    subplot(9,9,i)
    figure(1),plot(X,Y(i,:),'.'),axis([-125 125 -1.1 1.1])
    hold on
    figure(1),plot(X_new,Y_new(i,:))
    hold off
end

figure(2);
set(gcf,'name','Object Image: Polynomial','NumberTitle','off')
for c = 1:size(Y_new,2)
    Ic = renderim(Y_new(:,c),B,imsize);
    figure(2),imshow(Ic)
    drawnow
end

pause
Y_new = linear_interp(X,Y,X_new);

figure(1);
set(gcf,'name','Object Plot: Linear','NumberTitle','off')
for i = 1:size(Y,1)
    subplot(9,9,i)
    figure(1),plot(X,Y(i,:),'.'),axis([-125 125 -1.1 1.1])
    hold on
    figure(1),plot(X_new,Y_new(i,:))
    hold off
end

figure(2);
set(gcf,'name','Object Image: Linear','NumberTitle','off')
for c = 1:size(Y_new,2)
    Ic = renderim(Y_new(:,c),B,imsize);
    figure(2),imshow(Ic)
    drawnow
end

pause

% Since the linear_interp works better than poly_interp,
% we will use linear_interp

% Question 6
% The new interpolation correctly recovers Y,
% but with a little bit variation in the images
% Observed Variation: The brightness of the nose is kind of different
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

pause
quit