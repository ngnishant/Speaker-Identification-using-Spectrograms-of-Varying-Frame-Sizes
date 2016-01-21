function varargout = Welcome_Screen(varargin)
% WELCOME_SCREEN MATLAB code for Welcome_Screen.fig
%      WELCOME_SCREEN, by itself, creates a new WELCOME_SCREEN or raises the existing
%      singleton*.
%
%      H = WELCOME_SCREEN returns the handle to a new WELCOME_SCREEN or the handle to
%      the existing singleton*.
%
%      WELCOME_SCREEN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WELCOME_SCREEN.M with the given input arguments.
%
%      WELCOME_SCREEN('Property','Value',...) creates a new WELCOME_SCREEN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Welcome_Screen_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Welcome_Screen_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Welcome_Screen

% Last Modified by GUIDE v2.5 07-Apr-2012 20:59:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Welcome_Screen_OpeningFcn, ...
                   'gui_OutputFcn',  @Welcome_Screen_OutputFcn, ...
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


% --- Executes just before Welcome_Screen is made visible.
function Welcome_Screen_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Welcome_Screen (see VARARGIN)

% Choose default command line output for Welcome_Screen
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Welcome_Screen wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Welcome_Screen_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in enrollgui.
function enrollgui_Callback(hObject, eventdata, handles)
% hObject    handle to enrollgui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
EnrollGui;
close Welcome_Screen;

% --- Executes on button press in identifygui.
function identifygui_Callback(hObject, eventdata, handles)
% hObject    handle to identifygui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Identify;
close Welcome_Screen;

% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;
