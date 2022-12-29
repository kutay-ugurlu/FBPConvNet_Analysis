wipe
a = load("preproc_x20_ellipse_fullfbp.mat");
d = a.lab_d;
n = a.lab_n;
image1 = d(:,:,:,10);
image2 = n(:,:,:,10);
figure
subplot(1,2,1)
imagesc(radon(image2))
theta = 0:179;
subsampled_theta = theta(2:2:end);
R = radon(image2,theta);
image2_back = iradon(R(2:2:end,2:2:end),subsampled_theta);
subplot(1,2,2)
imagesc(image2_back)

figure
subplot(1,2,1)
imagesc(image1)
subplot(1,2,2)
imagesc(image2)
