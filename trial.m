x = randn(10000,1);
y = add_noise(x,10);
20*log10(sum(x.^2,"all")/sum((y-x).^2,"all"))