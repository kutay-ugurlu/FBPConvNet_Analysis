wipe

%%
% untar('matconvnet-1.0-beta25.tar.gz') ;
cd matconvnet-1.0-beta23\
mex -setup:'C:\Program Files\MATLAB\R2022b\bin\win64\mexopts\msvc2022.xml' C
mex -setup:'C:\Program Files\MATLAB\R2022b\bin\win64\mexopts\msvcpp2022.xml' C++
addpath('matlab')
vl_compilenn('Verbose',2)

%% download a pre−trained CNN from the web (run once)
% setup MatConvNet
vl_setupnn

%% load the pre−trained CNN
cd('..')
net = load('imagenet−vgg−f.mat') ;

%%
im = imread('peppers.png') ;
im_ = imresize(single(im), net.meta.normalization.imageSize(1:2)) ;
im_ = im_ - net.meta.normalization.averageImage ;

%% 
res = vl_simplenn(net, im_) ;

%% 
scores = squeeze(gather(res(end).x)) ;
[bestScore, best] = max(scores) ;
figure(1) ; clf ; imagesc(im) ;
title(sprintf('%s (%d), score %.3f',...
net.meta.classes.description{best}, best, bestScore)) ;
