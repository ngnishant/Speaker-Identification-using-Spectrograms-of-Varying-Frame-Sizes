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

% Last Modified by GUIDE v2.5 02-May-2012 10:36:19

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
saveinpath='C:\Workspace\major_project\GUI_finished\sounds\test_sounds\temp\';
wavwrite(rawdatart,8000,8,strcat(saveinpath,'Test_Speaker.wav'));


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on button press in use_mean_of_col.
function use_mean_of_col_Callback(hObject, eventdata, handles)
% hObject    handle to use_mean_of_col (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of use_mean_of_col
global use_meanofcol use_sector;
if (get(hObject,'Value')==get(hObject,Max))
    use_meanofcol=1;
    use_sector=0;
else
    use_meanofcol=0; use_sector=1;
end


% --- Executes on button press in use_sectors.
function use_sectors_Callback(hObject, eventdata, handles)
% hObject    handle to use_sectors (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of use_sectors
global use_meanofcol use_sector;
if (get(hObject,'Value')==get(hObject,Max))
    use_meanofcol=0;
    use_sector=1;
else
    use_meanofcol=1; use_sector=0;
end
