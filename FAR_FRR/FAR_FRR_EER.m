clear all
clc

current_path=pwd;

framesize=160;

percent_0_folder_path=strcat(current_path,'\0_percent_overlap\');
percent_25_folder_path=strcat(current_path,'\25_percent_overlap\');
percent_50_folder_path=strcat(current_path,'\50_percent_overlap\');

Database_Samples_path_0=strcat(current_path,'\0_percent_overlap\features\Database_Samples\');
Database_Samples_path_25=strcat(current_path,'\25_percent_overlap\features\Database_Samples\');
Database_Samples_path_50=strcat(current_path,'\50_percent_overlap\features\Database_Samples\');

Test_Samples_path_0=strcat(percent_0_folder_path,'features\Test_Samples\');
Test_Samples_path_25=strcat(percent_25_folder_path,'features\Test_Samples\');
Test_Samples_path_50=strcat(percent_50_folder_path,'features\Test_Samples\');

percent_0_folder_list=dir(strcat(percent_0_folder_path,'*.jpg'));
percent_25_folder_list=dir(strcat(percent_25_folder_path,'*.jpg'));
percent_50_folder_list=dir(strcat(percent_50_folder_path,'*.jpg'));

% Database_Samples_list=dir(strcat(Database_Samples_path,'*.mat'));
% Test_Samples_list=dir(strcat(Test_Samples_path,'*.mat'));

for index=1:length(percent_0_folder_list)
    
    image_name=percent_0_folder_list(index).name;
    image_matrix=imread(strcat(percent_0_folder_path,image_name));
    feature_vector=meanOFcoloumns(image_matrix,framesize);
    
    if mod(index,5)==0
        save_feature_vector_in=strcat(Test_Samples_path_0,image_name(1:(length(image_name)-4)));
    else
        save_feature_vector_in=strcat(Database_Samples_path_0,image_name(1:(length(image_name)-4)));
    end
    save(save_feature_vector_in,'feature_vector');
    
end

for index=1:length(percent_25_folder_list)
    
    image_name=percent_25_folder_list(index).name;
    image_matrix=imread(strcat(percent_25_folder_path,image_name));
    feature_vector=meanOFcoloumns(image_matrix,framesize);
    
    if mod(index,5)==0
        save_feature_vector_in=strcat(Test_Samples_path_25,image_name(1:(length(image_name)-4)));
    else
        save_feature_vector_in=strcat(Database_Samples_path_25,image_name(1:(length(image_name)-4)));
    end
    save(save_feature_vector_in,'feature_vector');
    
end

for index=1:length(percent_50_folder_list)
    
    image_name=percent_50_folder_list(index).name;
    image_matrix=imread(strcat(percent_50_folder_path,image_name));
    feature_vector=meanOFcoloumns(image_matrix,framesize);
    
    if mod(index,5)==0
        save_feature_vector_in=strcat(Test_Samples_path_50,image_name(1:(length(image_name)-4)));
    else
        save_feature_vector_in=strcat(Database_Samples_path_50,image_name(1:(length(image_name)-4)));
    end
    save(save_feature_vector_in,'feature_vector');
    
end

