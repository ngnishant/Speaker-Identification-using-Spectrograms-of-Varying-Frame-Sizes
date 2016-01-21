framesize=640;nof_frames=length(framesize);
overlap_prcnt=0.25;
DS_path='C:\Workspace\major_project\GUI_finished\sounds\database_sounds\';
TS_path='C:\Workspace\major_project\GUI_finished\sounds\test_sounds\';
DS_filelist=dir(strcat(DS_path,'*.jpg'));
TS_filelist=dir(strcat(TS_path,'*.jpg'));
DS_length=length(DS_filelist);
wrkng_directory=pwd;
overlap_amt=overlap_prcnt*framesize;

for i=1:DS_length;
    
    hfile=DS_filelist(i).name;
    [raw_speech fs1]=imread(hfile);
    

    
end
