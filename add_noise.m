function noisy = add_noise(img,noise)
noisy = awgn(img,noise);
end
