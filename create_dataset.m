wipe
Data = struct2array(load("Cropped_Synapse_Abdomen_Data.mat"));
slice_data = size(Data,4);
n_views = 1000;
subsampling_factor = 20;
if_noise = 1;
noise = 30; %dB:
save_file_name = ['N_',num2str(n_views),'_SS_',num2str(subsampling_factor),'_Noise_',num2str(if_noise),'_SNR_',num2str(noise),'.mat'];

[SS_array,GT_array] = radon_helper(Data,n_views,subsampling_factor,if_noise,noise);

CT_data = struct();
CT_data.lab_n = GT_array;
CT_data.lab_g = SS_array;
save(save_file_name, "CT_data", '-v7.3');
