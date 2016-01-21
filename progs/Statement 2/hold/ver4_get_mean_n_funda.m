%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  A version of highf_try3. Along with fundamental frequency of each %
%  frame,  we take average of each frame also.                       %
%                                                                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [ mean_freq funda_freq ] = ver4_get_mean_n_funda(hfile,framesize,len,no_of_frames,overlap_amt,noise_threshold,nof_consec_zeros);
[Y Fs] = wavread(hfile);
Y1=del_consec_zeros2(Y,noise_threshold,nof_consec_zeros);

for i=1:(no_of_frames*framesize);
    B(i)=Y1(i);
end



%Z=reshape(B,framesize,no_of_frames);
Z=overlap2(B,framesize,overlap_amt);
dft_of_Z=fft(Z);
C=abs(dft_of_Z);                        %C stores abs val of dft of matrix

mean_freq=zeros(1,no_of_frames);
for k=1:no_of_frames;
    mean_freq(1,k)=mean(C(:,k));        %mean of frequencies of each frame
end

a=1;
for s=1:no_of_frames;                   %find maximum value in one column
    maxC(a)=max(C(2:framesize,s));
    a=a+1;
end
P=zeros(1,no_of_frames);
for s=1:no_of_frames;                   %get index of maximum value disregarding 1st value(dc value)        
    for t=2:(framesize/2);
        if maxC(s)==C(t,s);
            P(s)=t;
        end
    end
end


funda_freq=zeros(1,length(P));
for i=1:length(P);
    funda_freq(1,i)=P(i)*Fs/framesize;
end

end