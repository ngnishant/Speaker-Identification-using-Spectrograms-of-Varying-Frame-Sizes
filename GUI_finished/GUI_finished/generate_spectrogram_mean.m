DS_files=dir('D:\project\GUI_finished\GUI_finished\sounds\database_sounds\temp\*.wav');
DS_path='D:\project\GUI_finished\GUI_finished\sounds\database_sounds\temp\';
DS_spectrogram_path='D:\project\GUI_finished\GUI_finished\features\database_features\meancolumn\';
DS_length=length(DS_files);
wrkng_directory=pwd;
framesize=640;overlap_prcnt=0.25;
overlap_amt=overlap_prcnt*framesize;

%~~~~~~~~~~~~make spectrograms of database samples and put in features as .jpg files~~~
for i=1:DS_length;
   
    hfile=strcat(DS_path,DS_files(i).name);
    [raw_speech]=wavread(hfile);
    
    speech_frames_colmns=overlap3(raw_speech,framesize,overlap_amt);
    speech_after_fft=coloumnfft(speech_frames_colmns);
    
    %wav_name=strcat(hfile);
    wav_name=DS_files(i).name;
    jpg_name=strcat(wav_name(1:(length(wav_name)-4)),'.jpg');
    
    %cd(DS_feat_path);
    imwrite(speech_after_fft,strcat(DS_spectrogram_path,jpg_name),'jpg');
    %cd(wrkng_directory);
    
end
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

