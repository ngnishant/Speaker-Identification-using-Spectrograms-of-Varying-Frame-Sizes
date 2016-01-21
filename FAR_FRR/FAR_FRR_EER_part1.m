clear all
clc

current_path=pwd;
digits_req=current_path((length(current_path)-2):length(current_path));
framesize=str2num(digits_req);

percent_0_folder_path=strcat(current_path,'\0_percent_overlap\');
mkdir(strcat(percent_0_folder_path,'\features\Database_Samples'));
mkdir(strcat(percent_0_folder_path,'\features\Test_Samples'));
mkdir(strcat(percent_0_folder_path,'\features\Test_Samples\remaining'));
mkdir(strcat(percent_0_folder_path,'\features\Test_Samples\Intruder_test'));
percent_25_folder_path=strcat(current_path,'\25_percent_overlap\');
mkdir(strcat(percent_25_folder_path,'\features\Database_Samples'));
mkdir(strcat(percent_25_folder_path,'\features\Test_Samples'));
mkdir(strcat(percent_25_folder_path,'\features\Test_Samples\remaining'));
mkdir(strcat(percent_25_folder_path,'\features\Test_Samples\Intruder_test'));
percent_50_folder_path=strcat(current_path,'\50_percent_overlap\');
mkdir(strcat(percent_50_folder_path,'\features\Database_Samples'));
mkdir(strcat(percent_50_folder_path,'\features\Test_Samples'));
mkdir(strcat(percent_50_folder_path,'\features\Test_Samples\remaining'));
mkdir(strcat(percent_50_folder_path,'\features\Test_Samples\Intruder_test'));

Database_Samples_path_0=strcat(current_path,'\0_percent_overlap\features\Database_Samples\');
Database_Samples_path_25=strcat(current_path,'\25_percent_overlap\features\Database_Samples\');
Database_Samples_path_50=strcat(current_path,'\50_percent_overlap\features\Database_Samples\');

Test_Samples_path_0=strcat(percent_0_folder_path,'features\Test_Samples\');
Test_Samples_path_25=strcat(percent_25_folder_path,'features\Test_Samples\');
Test_Samples_path_50=strcat(percent_50_folder_path,'features\Test_Samples\');

percent_0_folder_list=dir(strcat(percent_0_folder_path,'*.jpg'));
percent_25_folder_list=dir(strcat(percent_25_folder_path,'*.jpg'));
percent_50_folder_list=dir(strcat(percent_50_folder_path,'*.jpg'));


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

