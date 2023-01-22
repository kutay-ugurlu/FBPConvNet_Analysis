# Analysis on FBPConvNet on MATLAB
## The repository is forked from [this repository of the paper _Deep Convolutional Neural Network for Inverse Problems in Imaging_ ](https://github.com/panakino/FBPConvNet)

The functions for [raw data processing](https://github.com/kutay-ugurlu/FBPConvNet_Analysis/blob/master/create_raw_data.m), [dataset creation](https://github.com/kutay-ugurlu/FBPConvNet_Analysis/blob/master/create_dataset.m), [radon transformer across scans with different parameters](https://github.com/kutay-ugurlu/FBPConvNet_Analysis/blob/master/radon_helper.m), [dynamic range streching](https://github.com/kutay-ugurlu/FBPConvNet_Analysis/blob/master/set_dynamic_range.m), [dataset visualization](https://github.com/kutay-ugurlu/FBPConvNet_Analysis/blob/master/visualize_dataset.m) and [evaluation script for SYNAPSE dataset](https://github.com/kutay-ugurlu/FBPConvNet_Analysis/blob/master/evaluation_modified.m) are developed by me.  

# Synapse Dataset
To download the images used for testing, use [this script](https://github.com/kutay-ugurlu/FBPConvNet_Analysis/blob/master/download.py) to download the data by setting the username and password for your SYNAPSE account. 

# Train - Test
For training, the procedure explained in the [original repository](https://github.com/panakino/FBPConvNet) is followed to download the proprocessed ellipsoidal dataset and the pretrained network. For evaluation with another dataset, [evaluation script](https://github.com/kutay-ugurlu/FBPConvNet_Analysis/blob/master/evaluation_modified.m) can be further modified. 

![An example reconstruction with the proposed network for subsampling by 20 in ellipsoidal dataset](https://user-images.githubusercontent.com/83376963/213933200-8301e27c-8c26-47f6-9d09-95e02279cb54.png)
