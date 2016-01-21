clear all
clc


framesize=[256];nof_frames=length(framesize);
overlap_prcnt=[0 0.25 0.5];
filelist=ls('*.wav');
len_flist=length(filelist);
wrkng_directory=pwd;
mkdir('speech_spectograms');                                %all images of ffts go here
spectograms_folder=strcat(wrkng_directory,'\','speech_spectograms','\');
efficiency=zeros(nof_frames,length(overlap_prcnt));

for P=1:nof_frames;                                         %P is loop for framesize
    
    framesize_folder=int2str(framesize(P));
    mkdir(strcat(spectograms_folder,framesize_folder));
tic    
    for Q=1:3;                                              %Q is overlap loop

        overlap_folder=strcat(int2str(overlap_prcnt(Q)*100),'_percent_overlap');
        mkdir(strcat(spectograms_folder,framesize_folder,'\',overlap_folder));
        put_spectogrphs_in=strcat(spectograms_folder,framesize_folder,'\',overlap_folder,'\');


overlap_amt=overlap_prcnt(Q)*framesize(P);
for i=1:len_flist;
  
    hfile=filelist(i,:);
    [raw_speech fs1]=wavread(hfile);
    
    speech_frames_colmns=overlap2(raw_speech*5,framesize(P),overlap_amt);  %cslu * by 5,or whatever works
    speech_after_fft=coloumnfft(speech_frames_colmns);
    
    wav_name=strcat(hfile);
    jpg_name=strcat(wav_name(1:(length(wav_name)-4)),'.jpg');
    
    cd(put_spectogrphs_in);
    imwrite(speech_after_fft,jpg_name,'jpg');
    cd(wrkng_directory);
    
end


copyfile('meanOFcoloumns.m',put_spectogrphs_in);
copyfile('euclidean_distanceV2.m',put_spectogrphs_in);
cd(put_spectogrphs_in);
filelist_images=ls('*.jpg');
allfeatures=zeros(len_flist,framesize(P));
for i=1:len_flist;
  
    hfile_spectogram=strcat(filelist_images(i,:));
    spectogram=imread(hfile_spectogram);
    [allfeatures(i,:)]=meanOFcoloumns(spectogram,framesize(P));
    
end

[nof_allfeat_row nof_allfeat_col]=size(allfeatures);
features_4=zeros(nof_allfeat_row*4/5,nof_allfeat_col);

n=1;
for i=1:nof_allfeat_row;                                %get feature vectors matrix of excluding test vectors
        if mod(i,5)==0
            i=i+1;
            if i>nof_allfeat_row
                break
            end            
        features_4(n,:)=allfeatures(i,:);
        else
        features_4(n,:)=allfeatures(i,:); 
        n=n+1;       
        end        
end


[nof_f4_row nof_f4_col]=size(features_4);
nof_test_feats_rows=nof_allfeat_row/5;
test_features=zeros(nof_test_feats_rows,nof_allfeat_col);                        



for i=1:len_flist;                                   
    for j=1:nof_allfeat_col;
        if mod(i,5)==0
            test_features(i/5,j)=allfeatures(i,j);
        end              
    end    
end

[nof_tstf_row nof_tst_col]=size(test_features);



%%~~~~~~~~~~~~~~~~~~~EUCLIDEAN DISTANCE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

euclidist=euclidean_distanceV2(features_4,test_features);

%%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



%%~~~~~~~~~~~~~~~~~~~~EFFICIENCY BASED ON MIN DISTANCE~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

efficiency(P,Q)=100*nof_min_match/eucol;

%%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

cd(wrkng_directory);
    end
toc
end

