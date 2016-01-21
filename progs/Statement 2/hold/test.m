%clear all
%[y fs]=wavread('nishant1111.wav');
%len=length(y);
%duration=length(y)/fs;
%duration_new=duration-(0.1430);
%newlength=duration_new*fs;
%len2=uint16(newlength);
%y2=wavread('nishant111.wav',len2);
clear all
clc



fs=8000;
framesize=512;
overlap_amt=0;
filelist=ls('*.wav');
len_flist=length(filelist);
duration_new=zeros(len_flist,1);
nof_consec_zeros=10;
noise_threshold=0.01;


for i=1:len_flist
    hfile=filelist(i,:);
    [Y1 fs1]=wavread(hfile);
    y=del_consec_zeros2(Y1,noise_threshold,nof_consec_zeros);
    duration_old=length(y)/fs1;
    duration_new(i,1)=duration_old-(framesize/fs1);
end

min_new_duration=min(duration_new);
len=min_new_duration*fs;

no_of_frames=floor(len/framesize);

for i=1:len_flist
    hfile=filelist(i,:);
    hgstf(i,:)=highf(hfile,framesize,len,no_of_frames,overlap_amt);
end   
    
all_feature_s=hgstf;
[nof_feat_row nof_feat_col]=size(all_feature_s);
feature_s_4=zeros((nof_feat_row*4/5),nof_feat_col);


n=1;
for i=1:nof_feat_row;                                %get feature vectors matrix of excluding test vectors
        if mod(i,5)==0
            i=i+1;
            if i>nof_feat_row
                break
            end            
        feature_s_4(n,:)=all_feature_s(i,:);
        else
        feature_s_4(n,:)=all_feature_s(i,:); n=n+1;       
        end        
end


[nof_f4_row nof_f4_col]=size(feature_s_4);
test_feature=zeros(nof_feat_row/5,nof_feat_col);


for i=1:len_flist;                                   %get test feature vectors
    for j=1:nof_feat_col;
        if mod(i,5)==0
            test_feature(i/5,j)=all_feature_s(i,j);                   
        end              
    end    
end


[nof_tstf_row nof_tst_col]=size(test_feature);
sum=zeros(nof_f4_row,nof_tstf_row);
euclidist=zeros(nof_f4_row,nof_tstf_row);


for t=1:nof_tstf_row;
    for i=1:nof_f4_row;
        for j=1:nof_feat_col;
            sum(i,t)=sum(i,t)+(test_feature(t,j)-feature_s_4(i,j)).^2;
        end        
    end    
end

euclidist=sqrt(sum);

[eurow eucol]=size(euclidist);
min_dist_is=zeros(1,nof_tstf_row);
min_dist_at=zeros(1,nof_tstf_row);


for i=1:nof_tstf_row;                         %get the min distance
    min_dist_is(1,i)=min(euclidist(:,i));
end


for j=1:eucol;                                %get index of min dist
    for i=1:eurow;
        if min_dist_is(1,j)==euclidist(i,j);
            min_dist_at(1,j)=i;
        end
    end
end

nof_min_match=0;
efficiency=0;

for j=1:eucol;
    for i=1:eurow;
        if mod(i,4*j)==0;
            if min_dist_is(1,j)==min(euclidist((i-3):i,j));
                nof_min_match=nof_min_match+1;
                %continue;
            end
            continue;
        end
    end
end

efficiency=100*nof_min_match/eucol;
