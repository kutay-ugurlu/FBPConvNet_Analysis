# Analysis on FBPConvNet on MATLAB
## The repository is forked from [this repository of the paper _Deep Convolutional Neural Network for Inverse Problems in Imaging_ ](https://github.com/panakino/FBPConvNet)

The functions for [raw data processing](https://github.com/kutay-ugurlu/FBPConvNet_Analysis/blob/master/create_raw_data.m), [dataset creation](https://github.com/kutay-ugurlu/FBPConvNet_Analysis/blob/master/create_dataset.m), [radon transformer across scans with different parameters](https://github.com/kutay-ugurlu/FBPConvNet_Analysis/blob/master/radon_helper.m), [dynamic range streching](https://github.com/kutay-ugurlu/FBPConvNet_Analysis/blob/master/set_dynamic_range.m), [dataset visualization](https://github.com/kutay-ugurlu/FBPConvNet_Analysis/blob/master/visualize_dataset.m) and [evaluation script for SYNAPSE dataset](https://github.com/kutay-ugurlu/FBPConvNet_Analysis/blob/master/evaluation_modified.m) are developed by me.  

# Synapse Dataset
To download the images used for testing, use [this script](https://github.com/kutay-ugurlu/FBPConvNet_Analysis/blob/master/download.py) to download the data by setting the username and password for your SYNAPSE account. 

# Train - Test
For training, the procedure explained in the [original repository](https://github.com/panakino/FBPConvNet) is followed to download the proprocessed ellipsoidal dataset and the pretrained network. For evaluation with another dataset, [evaluation script](https://github.com/kutay-ugurlu/FBPConvNet_Analysis/blob/master/evaluation_modified.m) can be further modified. 

![An example reconstruction with the proposed network for subsampling by 20 in ellipsoidal dataset](https://user-images.githubusercontent.com/83376963/213933200-8301e27c-8c26-47f6-9d09-95e02279cb54.png)


# FBPConvNet - Matlab

Deep Convolutional Neural Network for Inverse Problems in Imaging <br />
http://ieeexplore.ieee.org/document/7949028/

Readme

1. Before launching FBPConvNet, the MatConvNet (http://www.vlfeat.org/matconvnet/) have to be properly installed. (For the GPU, it needs a different compilation.)
2. Properly modify matconvnet path in main.m and evaluation.m files.
3. To start, download 2 links;  
(1) pretrained network : https://drive.google.com/open?id=0B9fSVcoxJuVwMVJ1eWFPdEEwbWs , then put this network into 'pretrain' folder<br />
(2) dataset : https://drive.google.com/open?id=0B9fSVcoxJuVwMDlxbXdvcTRaM2M just place this data in the same folder with main.m
4. Use main.m for training. After training, run evaluation.m for deploy of test data set.

*note : phantom data set (x20) is only provided. SNR value may be slightly different with our paper. <br />
*note : these codes mainly ran on Matlab 2016a with GPU TITAN X (architecture : Maxwell)<br />
contact : Kyong Jin (kyonghwan.jin@gmail.com), 

special thanks to Junhong Min (Senior Researcher at Samsung Electronics) for providing initial codes.



