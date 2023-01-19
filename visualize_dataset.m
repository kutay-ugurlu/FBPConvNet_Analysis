wipe
ellipses = load('mat2gray_dynamicrangescaled_cropped_Synapse_Abdomen_Data.mat');

figure
imagesc(ellipses.Data(:,:,:,20)), colormap gray;
figure
imagesc(ellipses.Data(:,:,:,50)), colormap gray;
figure
imagesc(ellipses.Data(:,:,:,80)), colormap gray;

