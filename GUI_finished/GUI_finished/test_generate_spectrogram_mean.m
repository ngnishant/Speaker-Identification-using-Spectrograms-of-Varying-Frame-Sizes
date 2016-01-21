TS_files=dir('D:\project\GUI_finished\GUI_finished\sounds\test_sounds\*.wav');
TS_path='D:\project\GUI_finished\GUI_finished\sounds\test_sounds\';
TS_spectrogram_path='D:\project\GUI_finished\GUI_finished\features\test_feature\meancolumn\';
TS_length=length(TS_files);
wrkng_directory=pwd;
framesize=640;overlap_prcnt=0.25;
overlap_amt=overlap_prcnt*framesize;

%~~~~~~~~~~~~make spectrograms of database samples and put in features as .jpg files~~~
for i=1:TS_length;
   
    hfile=strcat(TS_path,TS_files(i).name);
    [raw_speech]=wavread(hfile);
    
    speech_frames_colmns=overlap3(raw_speech,framesize,overlap_amt);
    speech_after_fft=coloumnfft(speech_frames_colmns);
    
    %wav_name=strcat(hfile);
    wav_name=TS_files(i).name;
    jpg_name=strcat(wav_name(1:(length(wav_name)-4)),'.jpg');
    
    %cd(DS_feat_path);
    imwrite(speech_after_fft,strcat(TS_spectrogram_path,jpg_name),'jpg');
    %cd(wrkng_directory);
    
end
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

