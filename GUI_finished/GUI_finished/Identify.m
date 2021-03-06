function varargout = Identify(varargin)
% IDENTIFY MATLAB code for Identify.fig
%      IDENTIFY, by itself, creates a new IDENTIFY or raises the existing
%      singleton*.
%
%      H = IDENTIFY returns the handle to a new IDENTIFY or the handle to
%      the existing singleton*.
%
%      IDENTIFY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IDENTIFY.M with the given input arguments.
%
%      IDENTIFY('Property','Value',...) creates a new IDENTIFY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Identify_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Identify_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Identify

% Last Modified by GUIDE v2.5 02-May-2012 10:56:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Identify_OpeningFcn, ...
    'gui_OutputFcn',  @Identify_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Identify is made visible.
function Identify_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Identify (see VARARGIN)

% Choose default command line output for Identify
handles.output = hObject;
imshow(imread('miracles.jpg'));
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Identify wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Identify_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Back.
function Back_Callback(hObject, eventdata, handles)
% hObject    handle to Back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Welcome_Screen;
close Identify;

% --- Executes on button press in Identify.
function Identify_Callback(hObject, eventdata, handles)
% hObject    handle to Identify (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global use_meanofcol use_sector;
if use_meanofcol==1
    identify_mean;
end
if use_sector==1
    identify_sector;
end




% --- Executes on button press in start1.
function start1_Callback(hObject, eventdata, handles)
% hObject    handle to start1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global myvoicert;
myvoicert=audiorecorder;
record(myvoicert);



% --- Executes on button press in stop1.
function stop1_Callback(hObject, eventdata, handles)
% hObject    handle to stop1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global myvoicert;
stop(myvoicert);
rawdatart=getaudiodata(myvoicert);
%~~~~~~~To remove any previous instances of some old Test Speaker's wav file in test_sounds folder~~~
TS_files_b4_tst_enroll=dir('D:\project\GUI_finished\GUI_finished\sounds\test_sounds\*.wav');
if ~isempty(TS_files_b4_tst_enroll)
    for i=1:length(TS_files_b4_tst_enroll)
        delete(TS_files_b4_tst_enroll(i).name);
    end
end

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


saveinpath='D:\project\GUI_finished\GUI_finished\sounds\test_sounds\temp\';
wavwrite(rawdatart,8000,8,strcat(saveinpath,'Test_Speaker.wav'));

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
TS_files=dir('D:\project\GUI_finished\GUI_finished\sounds\test_sounds\temp\*.wav');
if ~isempty(TS_files)
    for i=1:length(TS_files)
        fileloc=strcat('D:\project\GUI_finished\GUI_finished\sounds\test_sounds\temp\',TS_files(i).name);
        movefile(fileloc,'D:\project\GUI_finished\GUI_finished\sounds\test_sounds\');
    end
end
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


%~~~~~To remove any previous spectrograms of previous test speakers~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

TS_feat_path_b4_imgwrite=dir('D:\project\GUI_finished\GUI_finished\features\test_feature\sector\*.jpg');
if ~isempty(TS_feat_path_b4_imgwrite)
    for i=1:length(TS_feat_path_b4_imgwrite)
        delete(TS_feat_path_b4_imgwrite(i).name);
    end
end

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%~~~~~To remove any previous spectrograms of previous test speakers~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

TS_feat_path_b4_imgwrite=dir('D:\project\GUI_finished\GUI_finished\features\test_feature\spectrogram\*.jpg');
if ~isempty(TS_feat_path_b4_imgwrite)
    for i=1:length(TS_feat_path_b4_imgwrite)
        delete(TS_feat_path_b4_imgwrite(i).name);
    end
end

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

%~~~~~~~~~~~~make spectrograms of test sample and put in features as .jpg files~~~

global use_meanofcol use_sector;
if use_sector==1
    framesize=704;nof_frames=length(framesize);
    overlap_prcnt=0.50;
    overlap_amt=overlap_prcnt*framesize;
    TS_path='D:\project\GUI_finished\GUI_finished\sounds\test_sounds\';
    TS_feat_path='D:\project\GUI_finished\GUI_finished\features\test_feature\sector\';
    TS_filelist=dir(strcat(TS_path,'*.wav'));
    TS_length=length(TS_filelist);
    
    for i=1:TS_length;
        
        hfile=strcat(TS_path,TS_filelist(i).name);
        [raw_speech]=wavread(hfile);
        
        speech_frames_colmns=overlap3(raw_speech,framesize,overlap_amt);
        speech_after_fft=coloumnfft(speech_frames_colmns);
        
        %wav_name=strcat(hfile);
        wav_name=TS_filelist(i).name;
        jpg_name=strcat(wav_name(1:(length(wav_name)-4)),'.jpg');
        
        
        %cd(TS_feat_path);
        imwrite(speech_after_fft,strcat(TS_feat_path,jpg_name),'jpg');
        %cd(wrkng_directory);
        
        %delete(strcat(TS_feat_path,TS_filelist(i).name));     Why will a .wav file BE in the feat folder in the 1st place?
    end
else
    framesize=640;nof_frames=length(framesize);
    overlap_prcnt=0.25;
    overlap_amt=overlap_prcnt*framesize;
    TS_path='D:\project\GUI_finished\GUI_finished\sounds\test_sounds\';
    TS_feat_path='D:\project\GUI_finished\GUI_finished\features\test_feature\spectrogram';
    TS_filelist=dir(strcat(TS_path,'*.wav'));
    TS_length=length(TS_filelist);
    
    for i=1:TS_length;
        
        hfile=strcat(TS_path,TS_filelist(i).name);
        [raw_speech]=wavread(hfile);
        
        speech_frames_colmns=overlap3(raw_speech,framesize,overlap_amt);
        speech_after_fft=coloumnfft(speech_frames_colmns);
        
        %wav_name=strcat(hfile);
        wav_name=TS_filelist(i).name;
        jpg_name=strcat(wav_name(1:(length(wav_name)-4)),'.jpg');
        
        
        %cd(TS_feat_path);
        imwrite(speech_after_fft,strcat(TS_feat_path,jpg_name),'jpg');
        %cd(wrkng_directory);
        
        %delete(strcat(TS_feat_path,TS_filelist(i).name));     Why will a .wav file BE in the feat folder in the 1st place?
    end
end
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


% --- Executes on button press in use_mean_algo.
function use_mean_algo_Callback(hObject, eventdata, handles)
% hObject    handle to use_mean_algo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of use_mean_algo
global use_meanofcol use_sector;
if (get(hObject,'Value')==get(hObject,'Max'))
    use_meanofcol=1;
    use_sector=0;
    set(handles.use_sectors_algo,'Visible',['off']);
end
if (get(hObject,'Value')==get(hObject,'Min'))
    use_meanofcol=0;
    use_sector=1;
    set(handles.use_sectors_algo,'Visible',['on']);
end


% --- Executes on button press in use_sectors_algo.
function use_sectors_algo_Callback(hObject, eventdata, handles)
% hObject    handle to use_sectors_algo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of use_sectors_algo
global use_meanofcol use_sector;

if (get(hObject,'Value')==get(hObject,'Max'))
    use_meanofcol=0;
    use_sector=1;
    set(handles.use_mean_algo,'Visible',['off']);
end
if (get(hObject,'Value')==get(hObject,'Min'))
    use_meanofcol=1;
    use_sector=0;
    set(handles.use_mean_algo,'Visible',['on']);
end