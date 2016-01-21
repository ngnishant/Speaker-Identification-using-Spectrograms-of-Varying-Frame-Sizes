function [ mean_freq variance_freq kurtosis_freq skewness_freq ] = ver5_get_features(hfile,framesize,no_of_frames,overlap_amt,noise_threshold,nof_consec_zeros)
[Y Fs] = wavread(hfile);
Y1=del_consec_zeros2(Y,noise_threshold,nof_consec_zeros);

for i=1:(no_of_frames*framesize);
    B(i)=Y1(i);
end


Z=overlap2(B,framesize,overlap_amt);
dft_of_Z=fft(Z);
C=abs(dft_of_Z);                        %C stores abs val of dft of matrix


%%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~MEAN OF FREQUENCIES~~~~~~~~~~~~~~~~~~~~~~~~~~~

mean_freq=zeros(1,no_of_frames);
for k=1:no_of_frames;
    mean_freq(1,k)=mean(C(:,k));        %mean of frequencies of each frame
end

%%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


%%~~~~~~~~~~~~~~~~~~~~~~~~~~~VARIANCE OF FREQUENCIES~~~~~~~~~~~~~~~~~~~~~~~~~~

variance_freq=zeros(1,no_of_frames);
for k=1:no_of_frames;
    variance_freq(1,k)=var(C(:,k));
end

%%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




%%~~~~~~~~~~~~~~~~~~~~~~~~~~~KURTOSIS OF FREQUENCIES~~~~~~~~~~~~~~~~~~~~~~~~~~

kurtosis_freq=zeros(1,no_of_frames);
for k=1:no_of_frames;
    kurtosis_freq(1,k)=kurtosis(C(:,k));
end

%%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




%%~~~~~~~~~~~~~~~~~~~~~~~~~~SKEWNESS OF FREQUENCIES~~~~~~~~~~~~~~~~~~~~~~~~~~~

skewness_freq=zeros(1,no_of_frames);
for k=1:no_of_frames;
    skewness_freq(1,k)=skewness(C(:,k));
end
%%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




% %%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~FUNDAMENTAL FREQUENCY~~~~~~~~~~~~~~~~~~~~~~~~~~
% a=1;
% for s=1:no_of_frames;                   %find maximum value in one column
%     maxC(a)=max(C(2:framesize,s));
%     a=a+1;
% end
% P=zeros(1,no_of_frames);
% for s=1:no_of_frames;                   %get index of maximum value disregarding 1st value(dc value)        
%     for t=2:(framesize/2);
%         if maxC(s)==C(t,s);
%             P(s)=t;
%         end
%     end
% end
% 
% 
% funda_freq=zeros(1,length(P));
% for i=1:length(P);
%     funda_freq(1,i)=P(i)*Fs/framesize;
% end
% %%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
end