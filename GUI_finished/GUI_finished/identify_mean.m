TS_location='D:\project\GUI_finished\GUI_finished\features\test_feature\meancolumn\';
DS_location='D:\project\GUI_finished\GUI_finished\features\database_features\meancolumn\';
TS_files=dir(strcat(TS_location,'*.jpg'));
DS_files=dir(strcat(DS_location,'*.jpg'));

framesize=640;overlap_prcnt=0.25;
overlap_amt=overlap_prcnt*framesize;
threshold=60; database_features=zeros(length(DS_files),framesize);
dist_single_row=zeros(1,length(DS_files));

test_feature=meanOFcoloumns(imread(strcat(TS_location,TS_files.name)),640);

for index=1:length(DS_files)
    
    spectogram=imread(strcat(DS_location,DS_files(index).name));
    [database_features(index,:)]=meanOFcoloumns(spectogram,framesize);
    
end

for index=1:length(DS_files)
    
    [dist] = eudist_V3(test_feature,database_features(index,:));
    dist_single_row(1,index)=dist;
    
end

[sorted_dist_single_row,orig_indexof_row]=sort(dist_single_row,'ascend');

min_distance_table(1,:)=sorted_dist_single_row;
distance_table(1,:)=dist_single_row;
original_index_table(1,:)=orig_indexof_row;

n=0;
if min_distance_table(1,1)<threshold
    imagename=DS_files(original_index_table(1,1)).name;
    displayname=imagename(1:(length(imagename)-4));
    for i2=1:length(displayname)
        if displayname(i2)~='1'
            n=n+1;
        else
            break;
        end
    end
    msgbox(strcat('Welcome ',displayname(1:n),' !!'))
end
if min_distance_table(1,1)>threshold
    errordlg('Unidentified Speaker');
end