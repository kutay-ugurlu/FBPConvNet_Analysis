wipe
run ./matconvnet-1.0-beta23/matlab/vl_setupnn

file_names = ["N_1000_SS_2_Noise_1_SNR_20.mat","N_1000_SS_2_Noise_0_SNR_20.mat"];
models = ["training_result\08-Jan-2023_fbpconvent_ellipse_fullfbp_\none_x20\net-epoch-21.mat","training_result\26-Dec-2022_fbpconvent_ellipse_fullfbp_\none_x20\net-epoch-11.mat"];

for file_name = file_names
    file_name = char(file_name);
    for model = models

        CT_data = struct2array(load(file_name));
        lab_n = CT_data.lab_n;
        lab_d = CT_data.lab_g;
        load(model)
        
        net = vl_simplenn_move(net, 'cpu') ;
        test_size = 25;
        
        avg_psnr_m=zeros(test_size,1);
        avg_psnr_rec=zeros(test_size,1);
        for iter=1:test_size
            gt=lab_n(:,:,1,iter);
            m=lab_d(:,:,1,iter);

            res=vl_simplenn_fbpconvnet_eval(net,((single(m))));
            rec=(res(end-1).x)+m; 
            
            snr_m=computeRegressedSNR(m,gt);
            snr_rec=computeRegressedSNR(rec,gt);
            params = split(file_name,'_');
            N = params{2}; SS = params{4}; Noise = params{6};
            temp = split(params{end},'.');
            SNR = temp{1};
            f = figure(1); 
            subplot(1,3,1), imagesc((m)),axis equal tight, title({'fbp';num2str(snr_m)}), colormap gray
            subplot(1,3,2), imagesc((rec)),axis equal tight, title({'fbpconvnet';num2str(snr_rec)}), colormap gray
            subplot(1,3,3), imagesc((gt)),axis equal tight, title(['gt ' num2str(iter)]), colormap gray
            sgtitle({['N=',num2str(N),', SS=',num2str(SS)],['Noise =',num2str(Noise),', SNR = ',num2str(SNR)]})
            pause(0.1)
            disp([num2str(iter/test_size*100,3),'% completed.'])
            avg_psnr_m(iter)=snr_m;
            avg_psnr_rec(iter)=snr_rec;

            if iter == test_size
                full_name = ['Figures\',strrep([(file_name(1:end-4)),'_', char(model)],'\','_'),'.png'];
                saveas(f,full_name)
            end
        end
        
        display(['avg SNR (FBP) : ' num2str(mean(avg_psnr_m))])
        display(['avg SNR (FBPconvNet) : ' num2str(mean(avg_psnr_rec))])
        newString = [newline,char(datetime("now")),' ','EXP:',file_name,':',newline ,'avg SNR (FBP) : ' num2str(mean(avg_psnr_m)), newline,'avg SNR (FBPconvNet) : ' num2str(mean(avg_psnr_rec)), newline, model, newline];
        fileID = fopen('results_new.txt','a+');
        fprintf(fileID, '%s', newString);
    end
end
