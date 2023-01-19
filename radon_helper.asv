function [SS, GT] = radon_helper(image_sequence, n_views, subsampling_factor, if_noise, noise)

s = size(image_sequence);
h = size(image_sequence,1);
slice_number = s(end);
theta = linspace(0,180,n_views+1);
theta = theta(1:end-1);
sub_theta = linspace(0,180,floor(n_views/subsampling_factor)+1);
sub_theta = sub_theta(1:end-1);
[~,idx] = intersect(theta,sub_theta,'stable');
GT = zeros(size(image_sequence));
SS = GT;

for i = 1:slice_number
    image = image_sequence(:,:,:,i);
    full_sinogram = radon(image,theta);
    if if_noise
        full_sinogram = add_noise(full_sinogram,noise);
    end
    sub_sinogram = full_sinogram(:,idx);
    GT(:,:,:,i) = iradon(full_sinogram,theta,"Ram-Lak",h);
    SS(:,:,:,i) = iradon(sub_sinogram,sub_theta,"Ram-Lak",h);
    disp([num2str(i/slice_number*100,3),'% completed.'])
end

end


