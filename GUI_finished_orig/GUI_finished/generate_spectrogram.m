framesize=640;nof_frames=length(framesize);
overlap_prcnt=0.25;
DS_path='C:\Workspace\major_project\GUI_finished\sounds\database_sounds\';
TS_path='C:\Workspace\major_project\GUI_finished\sounds\test_sounds\';
DS_feat_path='C:\Workspace\major_project\GUI_finished\features\database_feature\';
TS_feat_path='C:\Workspace\major_project\GUI_finished\features\test_feature\';
DS_filelist=dir(strcat(DS_path,'*.wav'));
TS_filelist=dir(strcat(TS_path,'*.wav'));
DS_length=length(DS_filelist);
wrkng_directory=pwd;
overlap_amt=overlap_prcnt*framesize;

%~~~~~~~~~~~~make spectrograms of database samples and put in features as .jpg files~~~
for i=1:DS_length;
    
    hfile=DS_filelist(i).name;
    [raw_speech]=imread(hfile);
    
    speech_frames_colmns=overlap3(raw_speech,framesize,overlap_amt);
    speech_after_fft=coloumnfft(speech_frames_colmns);
    
    wav_name=strcat(hfile);
    jpg_name=strcat(wav_name(1:(length(wav_name)-4)),'.jpg');
    
    cd(DS_feat_path);
    imwrite(speech_after_fft,jpg_name,'jpg');
    cd(wrkng_directory);
    
end
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

%~~~~~~~~~~~~make spectrograms of test sample and put in features as .jpg files~~~
for i=1:TS_length;
    
    hfile=TS_filelist(i).name;
    [raw_speech]=imread(hfile);
    
    speech_frames_colmns=overlap3(raw_speech,framesize,overlap_amt);
    speech_after_fft=coloumnfft(speech_frames_colmns);
    
    wav_name=strcat(hfile);
    jpg_name=strcat(wav_name(1:(length(wav_name)-4)),'.jpg');
    
    cd(TS_feat_path);
    imwrite(speech_after_fft,jpg_name,'jpg');
    cd(wrkng_directory);
    
    delete(strcat(TS_feat_path,hfile));
end
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~