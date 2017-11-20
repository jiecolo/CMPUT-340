load('char_c1.mat');
[~,n] = size(Bchar);
for i=1:n
    x = Achar \ Bchar(:,i);
    imageA = reshape(x,[16,16]);
    imageA = imageA';
    subplot(1,7,i);
    imshow(imageA); % An image of the word SCIENCE
end

pause();
clear;

load('mri_c1.mat');
[~,n] = size(Bmri);
for j=1:n
    x = Amri \ Bmri(:,j);
    imageB = reshape(x,[32,32]);
    imageB = imageB';
    subplot(2,5,j);
    imshow(imageB);
end