load('immotion_basis.mat')

I = imread('JiangZemin.jpg');
I = double(rgb2gray(I));
[Fx,Fy] = gradient(I);
B_new = [I(:) Fx(:) Fy(:)];

t = -3:0.2:3;
Y_small = [ones(1,3*size(t,2)+1);0 t zeros(1,size(t,2)) t;0 zeros(1,size(t,2)) t t];

% larger Y values results in little or no motion at all
t = 5:10;
Y_large = [ones(1,3*size(t,2)+1);0 t zeros(1,size(t,2)) t;0 zeros(1,size(t,2)) t t];

for i=1:size(Y,2)
    subplot(2,2,1);
    I1 = renderim(Y(:,i),B,imsize); 
    imshow(I1,[]);
    drawnow; 
    
    % for coefficient t = -3:0.2:3
    subplot(2,2,2);
    I2 = renderim(Y_small(:,i),B,imsize); 
    imshow(I2,[]);
    drawnow; 
    
    % new picture
    subplot(2,2,3);
    I3 = renderim(Y(:,i),B_new,size(I)); 
    imshow(I3,[]);
    drawnow; 
    
    % for coefficient t = 5:10
    subplot(2,2,4);
    I4 = renderim(Y_large(:,i),B_new,size(I)); 
    imshow(I4,[]);
    drawnow; 

    pause(0.1);
end