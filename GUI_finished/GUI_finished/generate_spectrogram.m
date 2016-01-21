framesize=704;%nof_frames=length(framesize);   nof_frames=length(704)=1 ??
overlap_prcnt=0.50;
DS_path='D:\project\GUI_finished\GUI_finished\sounds\database_sounds\';
TS_path='D:\project\GUI_finished\GUI_finished\sounds\test_sounds\';
DS_feat_path='D:\project\GUI_finished\GUI_finished\features\database_features\';
TS_feat_path='D:\project\GUI_finished\GUI_finished\features\test_feature\';
DS_filelist=dir(strcat(DS_path,'*.wav'));
TS_filelist=dir(strcat(TS_path,'*.wav'));
DS_length=length(DS_filelist);
TS_length=length(TS_filelist);
wrkng_directory=pwd;
overlap_amt=overlap_prcnt*framesize;

%~~~~~~~~~~~~make spectrograms of database samples and put in features as .jpg files~~~
for i=1:DS_length;
   
    hfile=strcat(DS_path,DS_filelist(i).name);
    [raw_speech]=wavread(hfile);
    
    speech_frames_colmns=overlap3(raw_speech,framesize,overlap_amt);
    speech_after_fft=coloumnfft(speech_frames_colmns);
    
    %wav_name=strcat(hfile);
    wav_name=DS_filelist(i).name;
    jpg_name=strcat(wav_name(1:(length(wav_name)-4)),'.jpg');
    
    %cd(DS_feat_path);
    imwrite(speech_after_fft,strcat(DS_feat_path,jpg_name),'jpg');
    %cd(wrkng_directory);
    
end
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

%~~~~~~~~~~~~make spectrograms of test sample and put in features as .jpg files~~~
%for i=1:TS_length;
%    
%    hfile=strcat(TS_path,TS_filelist(i).name);
%    [raw_speech]=wavread(hfile);
%    
%    speech_frames_colmns=overlap3(raw_speech,framesize,overlap_amt);
%    speech_after_fft=coloumnfft(speech_frames_colmns);
%    
%    %wav_name=strcat(hfile);
%    wav_name=TS_filelist(i).name;
%    jpg_name=strcat(wav_name(1:(length(wav_name)-4)),'.jpg');
%    
%    %cd(TS_feat_path);
%    imwrite(speech_after_fft,strcat(TS_feat_path,jpg_name),'jpg');
%    %cd(wrkng_directory);
%    
%    %delete(strcat(TS_feat_path,TS_filelist(i).name));
%end
%%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~