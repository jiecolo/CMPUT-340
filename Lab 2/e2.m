clear all;

% Read images
tumor = imread('tumor.jpg');
contour = imread('tumorContour.jpg');
[x,y] = find(contour > 250);
imshow(tumor,'InitialMagnification',200);
hold on;

% Trace the tumorContour
[xi,yi] = ginput;
xi = [xi;xi(1,:)];
yi = [yi;yi(1,:)];

% Piecewise interpolation
xx = linspace(0,2*pi,size(xi,1));
pp = spline(xx,[xi';yi']);
v = ppval(pp,linspace(0,2*pi,size(xi,1)));
plot(v(1,:),v(2,:),'b');

% Compute mean-square error
error = immse(y(1:size(yi,1)),yi)