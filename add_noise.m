function noisy = add_noise(img,noise)

cols = size(img,2);
noisy = zeros(size(img));
for i = 1:cols
    noisy(:,i) = awgn(img(:,i),noise);
end

end
