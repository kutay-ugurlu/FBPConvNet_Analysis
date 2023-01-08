wipe
run ./matconvnet-1.0-beta23/matlab/vl_setupnn

file_name = "N_1000_SS_20_Noise_1_SNR_30.mat";
load(file_name)
lab_n = CT_data.lab_n;
lab_d = CT_data.lab_g;
load('training_result\26-Dec-2022_fbpconvent_ellipse_fullfbp_\none_x20\net-epoch-11.mat')

cmode='cpu'; % 'cpu'
if strcmp(cmode,'gpu')
    net = vl_simplenn_move(net, 'gpu') ;
else
    net = vl_simplenn_move(net, 'cpu') ;
end

test_size = 25;

avg_psnr_m=zeros(test_size,1);
avg_psnr_rec=zeros(test_size,1);
for iter=1:test_size
    gt=lab_n(:,:,1,iter);
    m=lab_d(:,:,1,iter);
    if strcmp(cmode,'gpu')
        res=vl_simplenn_fbpconvnet_eval(net,gpuArray((single(m))));
        rec=gather(res(end-1).x)+m;
    else
        res=vl_simplenn_fbpconvnet_eval(net,((single(m))));
        rec=(res(end-1).x)+m;
    end
    
    snr_m=computeRegressedSNR(m,gt);
    snr_rec=computeRegressedSNR(rec,gt);
    figure(1), 
    subplot(131), imagesc(m),axis equal tight, title({'fbp';num2str(snr_m)})
    subplot(132), imagesc(rec),axis equal tight, title({'fbpconvnet';num2str(snr_rec)})
    subplot(133), imagesc(gt),axis equal tight, title(['gt ' num2str(iter)])
    pause(0.1)
    disp([num2str(iter/test_size*100,3),'% completed.'])
    avg_psnr_m(iter)=snr_m;
    avg_psnr_rec(iter)=snr_rec;
end

display(['avg SNR (FBP) : ' num2str(mean(avg_psnr_m))])
display(['avg SNR (FBPconvNet) : ' num2str(mean(avg_psnr_rec))])
newString = [newline,'EXP:',file_name,':',newline ,'avg SNR (FBP) : ' num2str(mean(avg_psnr_m)), newline,'avg SNR (FBPconvNet) : ' num2str(mean(avg_psnr_rec)) ];
fileID = fopen('results.txt','a+');
fprintf(fileID, '%s', newString);
