load('sincos_basis.mat')

for i=1:size(Y,2)
    subplot(1,3,1)
    I1 = renderim(Y(:,i),B,imsize); 
    imshow(I1,[]); 
    drawnow; 

    % increasing the frequency will speed up the movement
    % and also change the direction left-right back and forth
    subplot(1,3,2)
    Y_new(1,:) = sin(2*asin(Y(1,:)));
    Y_new(2,:) = cos(2*acos(Y(2,:)));
    I2 = renderim(Y_new(:,i),B,imsize); 
    imshow(I2,[]); 
    drawnow; 
    
    % the effect of changing b is change the motion to
    % moving both directions, and also it becomes slower
    subplot(1,3,3)
    B_new(:,1) = sin(2*asin(B(:,1)));
    B_new(:,2) = cos(2*acos(B(:,2)));
    I3 = renderim(Y(:,i),B_new,imsize); 
    imshow(I3,[]); 
    drawnow; 
    pause(0.1);
end