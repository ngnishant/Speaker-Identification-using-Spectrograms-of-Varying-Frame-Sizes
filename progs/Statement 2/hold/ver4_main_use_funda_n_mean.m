
clear all
clc

noise_threshold=0.01;
nof_consec_zeros=10;
fs=8000;
framesize=512;
overlap_amt=0.75*framesize;
filelist=ls('*.wav');
len_flist=length(filelist);
duration_new=zeros(len_flist,1);

for i=1:len_flist
    hfile=filelist(i,:);
    [BB fs1]=wavread(hfile);
    y=del_consec_zeros2(BB,noise_threshold,nof_consec_zeros);
    duration_old=length(y)/fs1;
    duration_new(i,1)=duration_old-(framesize/fs1);
end
min_new_duration=min(duration_new);
len=floor(min_new_duration*fs);              !

no_of_frames=floor(len/framesize);

for i=1:len_flist
    hfile=filelist(i,:);    
    [mean_freq(i,:) funda_freq(i,:)]=ver4_get_mean_n_funda(hfile,framesize,len,no_of_frames,overlap_amt,noise_threshold,nof_consec_zeros);
end   
    
all_features_ff=funda_freq;all_features_mf=mean_freq;             %ff=fundamental freq, mf=mean freq
[nof_feat_row nof_feat_col]=size(all_features_ff);
features_4_ff=zeros((nof_feat_row*4/5),nof_feat_col);
features_4_mf=zeros((nof_feat_row*4/5),nof_feat_col);

n=1;
for i=1:nof_feat_row;                                %get feature vectors matrix of excluding test vectors
        if mod(i,5)==0
            i=i+1;
            if i>nof_feat_row
                break
            end            
        features_4_ff(n,:)=all_features_ff(i,:);
        features_4_mf(n,:)=all_features_mf(i,:);
        else
        features_4_ff(n,:)=all_features_ff(i,:); 
        features_4_mf(n,:)=all_features_mf(i,:);
        n=n+1;       
        end        
end
features_4=horzcat(features_4_ff,features_4_mf);

[nof_f4_row nof_f4_col]=size(features_4);
test_feature_ff=zeros(nof_feat_row/5,nof_feat_col);                        %ff=fundamental freq,mf = mean freq
test_feature_mf=zeros(nof_feat_row/5,nof_feat_col);


for i=1:len_flist;                                   %get test feature vectors
    for j=1:nof_feat_col;
        if mod(i,5)==0
            test_feature_ff(i/5,j)=all_features_ff(i,j);
            test_feature_mf(i/5,j)=all_features_mf(i,j);
        end              
    end    
end
test_feature=horzcat(test_feature_ff,test_feature_mf);

[nof_tstf_row nof_tst_col]=size(test_feature);

sum=zeros(nof_f4_row,nof_tstf_row);
euclidist=zeros(nof_f4_row,nof_tstf_row);


for t=1:nof_tstf_row;
    for i=1:nof_f4_row;
        for j=1:2*nof_feat_col;
            sum(i,t)=sum(i,t)+(test_feature(t,j)-features_4(i,j)).^2;
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

count_2of5=0;
[ index_match_2of5, min_val_2of5, indexof_min_val_2of5 ] = try3_2_out_of_5(euclidist);
for i2=1:eucol;
    if index_match_2of5(1,i2)
        count_2of5=count_2of5+1;
    end
end

efficiency_2of5=(count_2of5/eucol)*100;
