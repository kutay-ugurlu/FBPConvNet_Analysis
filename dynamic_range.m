wipe
ellipses = load('mat2gray_dynamicrangescaled_cropped_Synapse_Abdomen_Data.mat');
% lab_d = ellipses.lab_d;
% lab_n = ellipses.lab_n;

img1 = ellipses.Data(:,:,:,20);
img2 = ellipses.Data(:,:,:,50);
subplot(1,2,1)
imagesc(img1), colormap gray
subplot(1,2,2)
imagesc(img2), colormap gray
