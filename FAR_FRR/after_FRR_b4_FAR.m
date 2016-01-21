clear all
clc

current_path=pwd;

overlap_percent=[0 25 50];

for folder_index=1:3
    
    Database_Samples_path=strcat(current_path,'\',num2str(overlap_percent(folder_index)),'_percent_overlap\features\Database_Samples\');
    Test_Samples_path=strcat(current_path,'\',num2str(overlap_percent(folder_index)),'_percent_overlap\features\Test_Samples\');
    remaining_samples_path=strcat(current_path,'\',num2str(overlap_percent(folder_index)),'_percent_overlap\features\Test_Samples\remaining\');
    intruder_test_samples_path=strcat(current_path,'\',num2str(overlap_percent(folder_index)),'_percent_overlap\features\Test_Samples\Intruder_test\');
    
    Intruder_Samples_List=dir(strcat(intruder_test_samples_path,'*.mat'));
    Test_Samples_List=dir(strcat(Test_Samples_path,'*.mat'));
    
    for index_t=1:length(Test_Samples_List)
        movefile(strcat(Test_Samples_path,Test_Samples_List(index_t).name),remaining_samples_path);
    end
    
    for index_i=1:length(Intruder_Samples_List)
        movefile(strcat(intruder_test_samples_path,Intruder_Samples_List(index_i).name),Test_Samples_path);
    end
end
