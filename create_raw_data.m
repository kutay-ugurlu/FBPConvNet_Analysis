%% Create Raw Data

wipe
files = dir(fullfile('D:\Synapse Dataset\Abdomen\Abdomen\RawData\Training\img','*.nii'));
L = length(files);
folder = files(1).folder;
files = string(vertcat(files.name));
Data = zeros(512,512,1,40);

slice_begin = 1;

for i = 1:length(files)
    file = double(niftiread([folder,filesep,char(files(i))]));
    slice_number = size(file,3);
    slices_to_extract = floor(slice_number/4):floor(3*slice_number/4);
    mid_scan = file(:,:,slices_to_extract);
    slices = length(slices_to_extract);
    slice_end = slice_begin + slices - 1;
    Data(:,:,1,slice_begin:slice_end) = mid_scan;
    slice_begin = slice_end + 1;
end

save("RawDataSynapseAbdomen.mat","Data", '-v7.3');
