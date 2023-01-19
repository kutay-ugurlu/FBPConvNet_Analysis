wipe
Data = struct2array(load("mat2gray_dynamicrangescaled_cropped_Synapse_Abdomen_Data.mat"));

params = {[1000,2,0,20],[1000,2,1,20],[1000,5,1,20], ...
[1000,10,1,20],[1000,20,0,30],[1000,20,1,20],[1000,20,1,30]};

for l = params
    l = l{1};
    n_views = l(1);
    subsampling_factor = l(2);
    if_noise = l(3);
    noise = l(4); %dB:
    save_file_name = ['N_',num2str(n_views),'_SS_',num2str(subsampling_factor),'_Noise_',num2str(if_noise),'_SNR_',num2str(noise),'.mat'];
    
    [SS_array,GT_array] = radon_helper(Data,n_views,subsampling_factor,if_noise,noise);
    
    CT_data = struct();
    CT_data.lab_n = GT_array;
    CT_data.lab_g = SS_array;
    save(save_file_name, "CT_data", '-v7.3');
end
