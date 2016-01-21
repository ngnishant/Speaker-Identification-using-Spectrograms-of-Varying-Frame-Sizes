function varargout = EnrollGui(varargin)
% ENROLLGUI MATLAB code for EnrollGui.fig
%      ENROLLGUI, by itself, creates a new ENROLLGUI or raises the existing
%      singleton*.
%
%      H = ENROLLGUI returns the handle to a new ENROLLGUI or the handle to
%      the existing singleton*.
%
%      ENROLLGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ENROLLGUI.M with the given input arguments.
%
%      ENROLLGUI('Property','Value',...) creates a new ENROLLGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EnrollGui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EnrollGui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EnrollGui

% Last Modified by GUIDE v2.5 06-Apr-2012 17:58:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @EnrollGui_OpeningFcn, ...
    'gui_OutputFcn',  @EnrollGui_OutputFcn, ...
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




% --- Executes just before EnrollGui is made visible.
function EnrollGui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EnrollGui (see VARARGIN)

% Choose default command line output for EnrollGui
handles.output = hObject;
imshow(imread('miracles.jpg'));
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EnrollGui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = EnrollGui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in start1.
function start1_Callback(hObject, eventdata, handles)
% hObject    handle to start1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global myvoice1;
myvoice1 = audiorecorder;
record(myvoice1);

% --- Executes on button press in Finish.
function Finish_Callback(hObject, eventdata, handles)
% hObject    handle to Finish (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
DS_files=dir('D:\project\GUI_finished\GUI_finished\sounds\database_sounds\temp\*.wav');
TS_files=dir('D:\project\GUI_finished\GUI_finished\sounds\test_sounds\temp\*.wav');

if ~isempty(DS_files)
    for i=1:length(DS_files)
        generate_spectrogram_mean;
        generate_spectrogram_sector;
    end
end

%if ~isempty(TS_files)
%    for i=1:length(TS_files)
%        fileloc=strcat('D:\project\GUI_finished\GUI_finished\sounds\test_sounds\temp\',TS_files(i).name);
%        movefile(fileloc,'D:\project\GUI_finished\GUI_finished\sounds\test_sounds\');
%    end
%end

if ~isempty(DS_files)
    generate_spectrogram;
end

Welcome_Screen;
close EnrollGui;

% --- Executes on button press in start2.
function start2_Callback(hObject, eventdata, handles)
% hObject    handle to start2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global myvoice2;
myvoice2 = audiorecorder;
record(myvoice2);

% --- Executes on button press in start4.
function start4_Callback(hObject, eventdata, handles)
% hObject    handle to start4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global myvoice4;
myvoice4 = audiorecorder;
record(myvoice4);

% --- Executes on button press in start3.
function start3_Callback(hObject, eventdata, handles)
% hObject    handle to start3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global myvoice3;
myvoice3 = audiorecorder;
record(myvoice3);

% --- Executes on button press in stop4.
function stop4_Callback(hObject, eventdata, handles)
% hObject    handle to stop4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global myvoice4 nameIs;
if isempty(nameIs)
    nameIs='NO_NAME';
end
stop(myvoice4);
rawdata4=getaudiodata(myvoice4);
wavname=strcat(nameIs,'1111.wav');
saveinpath='D:\project\GUI_finished\GUI_finished\sounds\database_sounds\temp\';
wavwrite(rawdata4,8000,8,strcat(saveinpath,wavname));

% --- Executes on button press in stop3.
function stop3_Callback(hObject, eventdata, handles)
% hObject    handle to stop3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global myvoice3 nameIs;
if isempty(nameIs)
    nameIs='NO_NAME';
end
stop(myvoice3);
rawdata3=getaudiodata(myvoice3);
wavname=strcat(nameIs,'111.wav');
saveinpath='D:\project\GUI_finished\GUI_finished\sounds\database_sounds\temp\';
wavwrite(rawdata3,8000,8,strcat(saveinpath,wavname));

% --- Executes on button press in stop2.
function stop2_Callback(hObject, eventdata, handles)
% hObject    handle to stop2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global myvoice2 nameIs;
if isempty(nameIs)
    nameIs='NO_NAME';
end
stop(myvoice2);
rawdata2=getaudiodata(myvoice2);
wavname=strcat(nameIs,'11.wav');
saveinpath='D:\project\GUI_finished\GUI_finished\sounds\database_sounds\temp\';
wavwrite(rawdata2,8000,8,strcat(saveinpath,wavname));

% --- Executes on button press in stop1.
function stop1_Callback(hObject, eventdata, handles)
% hObject    handle to stop1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global myvoice1 nameIs;
if isempty(nameIs)
    nameIs='NO_NAME';
end
stop(myvoice1);
rawdata1=getaudiodata(myvoice1);
wavname=strcat(nameIs,'1.wav');
saveinpath='D:\project\GUI_finished\GUI_finished\sounds\database_sounds\temp\';
wavwrite(rawdata1,8000,8,strcat(saveinpath,wavname));


function getName_Callback(hObject, eventdata, handles)
% hObject    handle to getName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of getName as text
%        str2double(get(hObject,'String')) returns contents of getName as a double
global nameIs;
nameIs=get(hObject,'String');

% --- Executes during object creation, after setting all properties.
function getName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to getName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on start1 and none of its controls.
function start1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to start1 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
