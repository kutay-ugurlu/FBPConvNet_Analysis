cropped = struct2array(load("Cropped_Synapse_Abdomen_Data.mat"));
s = size(cropped);
slices = s(end);
Data = zeros(size(cropped));

for i = 1:slices
    Data(:,:,:,i) = set_dynamic_range(mat2gray(cropped(:,:,1,i)),-500,500);
end

save("mat2gray_dynamicrangescaled_cropped_Synapse_Abdomen_Data","Data");
