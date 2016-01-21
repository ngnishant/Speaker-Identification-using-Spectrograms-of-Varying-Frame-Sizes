function Y1=del_consec_zeros2(B,noise_threshold,nof_consec_zeros)


%clear all
%clc

%B_orig=B;
%B=wavread('aditi11.wav');
%orig_B=B;
%nof_consec_zeros=10;
%noise_threshold=0.01;



for i=1:length(B);
    if abs(B(i)) < noise_threshold;
        B(i)=0;
    end
end

iNd=[];
t=1;
count_zeros=0;
for i=1:length(B);    
    
    if B(i)==0;
        count_zeros=count_zeros+1;
    end
    
    if B(i)~=0;
        count_zeros=0;
    end    
    
    if count_zeros==nof_consec_zeros;      
        %consec_zeros_end_at(t+1)=i;
        iNd(t,1:nof_consec_zeros)=i-nof_consec_zeros+1:i;
        t=t+1;
        count_zeros=0;
    end
end


  B(iNd)=[];
Y1=B;

%no_of_frames=22;framesize=1024;

%for i=1:(no_of_frames*framesize);
 %   C(i)=Y1(i);
%end

%end

    
