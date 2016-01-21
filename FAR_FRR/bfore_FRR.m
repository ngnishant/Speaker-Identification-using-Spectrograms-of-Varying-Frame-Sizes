clear all
clc

current_path=pwd;

overlap_percent=[0 25 50];

for folder_index=1:3
    
    Database_Samples_path=strcat(current_path,'\',num2str(overlap_percent(folder_index)),'_percent_overlap\features\Database_Samples\');
    Test_Samples_path=strcat(current_path,'\',num2str(overlap_percent(folder_index)),'_percent_overlap\features\Test_Samples\');
    remaining_samples_path=strcat(current_path,'\',num2str(overlap_percent(folder_index)),'_percent_overlap\features\Test_Samples\remaining\');
    intruder_test_samples_path=strcat(current_path,'\',num2str(overlap_percent(folder_index)),'_percent_overlap\features\Test_Samples\Intruder_test\');
    
    Database_Samples_List=dir(strcat(Database_Samples_path,'*.mat'));
    Test_Samples_List=dir(strcat(Test_Samples_path,'*.mat'));
    
    for index2=1:16
        
        test_mat_name=Test_Samples_List(index2).name;
        required_name=test_mat_name(1:(length(test_mat_name)-9));
        mat_matrix_source=strcat(Test_Samples_path,test_mat_name);
        movefile(mat_matrix_source,intruder_test_samples_path);
        
        for index1=1:length(Database_Samples_List)
            
            database_mat_name=Database_Samples_List(index1).name;
            database_name=database_mat_name(1:length(required_name));
            
            if strcmpi(required_name,database_name)
                
                mat_matrix_source=strcat(Database_Samples_path,database_mat_name);
                movefile(mat_matrix_source,remaining_samples_path);
                
            end
        end        
    end    
end