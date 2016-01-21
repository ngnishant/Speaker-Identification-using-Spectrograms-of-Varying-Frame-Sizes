clear all
clc

current_path=pwd;
threshold_range=1:10:130;

digits_req=current_path((length(current_path)-2):length(current_path));
framesize=str2num(digits_req);


FAR_all3=zeros(3,length(threshold_range));

overlap_percent=[0 25 50];

for folder_index=1:3
    
    Database_Samples_path=strcat(current_path,'\',num2str(overlap_percent(folder_index)),'_percent_overlap\features\Database_Samples\');
    Test_Samples_path=strcat(current_path,'\',num2str(overlap_percent(folder_index)),'_percent_overlap\features\Test_Samples\');
    
    Database_Samples_List=dir(strcat(Database_Samples_path,'*.mat'));
    Test_Samples_List=dir(strcat(Test_Samples_path,'*.mat'));
    
    number_of_TS=length(Test_Samples_List);
    number_of_DS=length(Database_Samples_List);
    
    min_distance_table=zeros(number_of_TS,number_of_DS);
    distance_table=zeros(number_of_TS,number_of_DS);
    original_index_table=zeros(number_of_TS,number_of_DS);
    
    for TS_index=1:number_of_TS
        
        TS_file_full_path=strcat(Test_Samples_path,Test_Samples_List(TS_index).name);
        TS_feature_matrix=load(TS_file_full_path);
        TS_fm=TS_feature_matrix.feature_vector;
        
        dist_single_row=zeros(1,number_of_DS);
        
        for DS_index=1:number_of_DS
            
            DS_file_full_path=strcat(Database_Samples_path,Database_Samples_List(DS_index).name);
            DS_feature_matrix=load(DS_file_full_path);
            DS_fm=DS_feature_matrix.feature_vector;
            
            [dist] = eudist_V3(TS_fm,DS_fm);
            
            dist_single_row(1,DS_index)=dist;
            
        end
        
        [sorted_dist_single_row,orig_indexof_row]=sort(dist_single_row,'ascend');
        
        min_distance_table(TS_index,:)=sorted_dist_single_row;
        distance_table(TS_index,:)=dist_single_row;
        original_index_table(TS_index,:)=orig_indexof_row;
        
    end
    
    th_index=1;

    threshold_matching=zeros(length(threshold_range),number_of_TS);
    for TS_index=1:number_of_TS
        

        th_index=1;
        for threshold=threshold_range
            if min_distance_table(TS_index,1)<threshold
     
                    threshold_matching(th_index,TS_index)=1;
    
            end
            th_index=th_index+1;
        end
        th_index=th_index+1;
    end
    
    FAR=zeros(1,length(threshold_range));
    
    for FAR_index=1:length(threshold_range)
        FAR(1,FAR_index)=mean(threshold_matching(FAR_index,:));
    end
    
    FAR_all3(folder_index,:)=FAR;
    
end