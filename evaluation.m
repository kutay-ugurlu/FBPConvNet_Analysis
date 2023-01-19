% evaluation - FBPConvNet
% modified from MatconvNet (ver.23)
% 22 June 2017
% contact : Kyong Jin (kyonghwan.jin@gmail.com)

wipe
% restoredefaultpath
% reset(gpuDevice(1))
run ./matconvnet-1.0-beta23/matlab/vl_setupnn

load preproc_x20_ellipse_fullfbp.mat
lab_n = lab_n(:,:,:,476:500);

for sub_sampling = [50]
    for noise = [0,1]
        [lab_d, ~] = radon_helper(lab_n, 1000, sub_sampling, noise, 10);
        model = ["training_result\08-Jan-2023_fbpconvent_ellipse_fullfbp_\none_x20\net-epoch-21.mat"];
        load(char(model))
        
        cmode='cpu'; % 'cpu'
        if strcmp(cmode,'gpu')
            net = vl_simplenn_move(net, 'gpu') ;
        else
            net = vl_simplenn_move(net, 'cpu') ;
        end
        
        avg_psnr_m=zeros(25,1);
        avg_psnr_rec=zeros(25,1);
        for iter=1:25
            gt=lab_n(:,:,1,iter);
            m=lab_d(:,:,1,iter);
        
            res=vl_simplenn_fbpconvnet_eval(net,((single(m))));
            rec=(res(end-1).x)+m;
            
            snr_m=computeRegressedSNR(m,gt);
            snr_rec=computeRegressedSNR(rec,gt);
            f = figure;
            subplot(131), imagesc(m),axis equal tight, title({'fbp';num2str(snr_m)}), colormap gray
            subplot(132), imagesc(rec),axis equal tight, title({'fbpconvnet';num2str(snr_rec)}), colormap gray
            subplot(133), imagesc(gt),axis equal tight, title(['gt ' num2str(iter)]), colormap gray
            if iter == 25
                saveas(f,['Figures',filesep,'Evaluation',num2str(sub_sampling),'_Noise10dB.png'])
            end
%             drawnow
            pause(0.1)
        
            
            avg_psnr_m(iter)=snr_m;
            avg_psnr_rec(iter)=snr_rec;
        end
        
        display(['avg SNR (FBP) : ' num2str(mean(avg_psnr_m))])
        display(['avg SNR (FBPconvNet) : ' num2str(mean(avg_psnr_rec))])
        newString = [newline,char(datetime("now")),':',newline,'Noise dB: ',num2str(10),' SS: ',num2str(sub_sampling),' avg SNR (FBP) : ', num2str(mean(avg_psnr_m)), newline,'avg SNR (FBPconvNet) : ' num2str(mean(avg_psnr_rec)), newline, char(model), newline];
        fileID = fopen('Evaluation_Loop_cases.txt','a+');
        fprintf(fileID, '%s', newString);
    end
end
