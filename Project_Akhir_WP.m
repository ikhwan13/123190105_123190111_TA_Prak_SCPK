function varargout = Project_Akhir_WP(varargin)
% PROJECT_AKHIR_WP MATLAB code for Project_Akhir_WP.fig
%      PROJECT_AKHIR_WP, by itself, creates a new PROJECT_AKHIR_WP or raises the existing
%      singleton*.
%
%      H = PROJECT_AKHIR_WP returns the handle to a new PROJECT_AKHIR_WP or the handle to
%      the existing singleton*.
%
%      PROJECT_AKHIR_WP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT_AKHIR_WP.M with the given input arguments.
%
%      PROJECT_AKHIR_WP('Property','Value',...) creates a new PROJECT_AKHIR_WP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Project_Akhir_WP_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Project_Akhir_WP_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Project_Akhir_WP

% Last Modified by GUIDE v2.5 28-Jun-2021 19:17:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Project_Akhir_WP_OpeningFcn, ...
                   'gui_OutputFcn',  @Project_Akhir_WP_OutputFcn, ...
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


% --- Executes just before Project_Akhir_WP is made visible.
function Project_Akhir_WP_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Project_Akhir_WP (see VARARGIN)

global data;

data.Mydata = [];
data.MydataNum = [];
data.MydataResult = [];


% Choose default command line output for Project_Akhir_WP
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Project_Akhir_WP wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Project_Akhir_WP_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in prosesbtn.
function prosesbtn_Callback(hObject, eventdata, handles)
% hObject    handle to prosesbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global data;

k = [1,1,1,0];%atribut tiap-tiap kriteria, dimana nilai 1=atrribut keuntungan, dan  0= atribut biaya
w = [3,5,4,1];%Nilai bobot tiap kriteria
 
%tahapan pertama, perbaikan bobot
[m n] = size(data.MydataNum); %inisialisasi ukuran data
w  = w./sum(w); %membagi bobot per kriteria dengan jumlah total seluruh bobot

%normalisasi matrix membentuk matrix(m x 1)
S = zeros(m,1);%vektor s
V = zeros(m,1);%vektor v

%tahapan kedua, melakukan perhitungan vektor(S) per baris (alternatif)
for j=1:n,
    if k(j)==0, w(j)=-1*w(j);
    end;
end;
for i=1:m,
    S(i,:)=prod(data.MydataNum(i,:).^w);
end;

%tahapan ketiga, perhitungan vektor (V)
for j=1:m,
    V(j,:) = S(j,:)/sum(sum(S));
end;

datanama = [data.Mydata(:,1)];

[vektorS,index] = maxk(S,m); %mengurutkan vektorS
[vektorV,index] = maxk(V,m); %mengurutkan vektorV
datanama = datanama(index); %mengurutkan nama kamera 
%disp(datanama)
vektorS = num2cell(vektorS); %mengubah vektorS dari tipe angka menjadi tipe cell(baris dan kolom)
vektorV = num2cell(vektorV); %mengubah vektorV dari tipe angka menjadi tipe cell(baris dan kolom)
hasil = [datanama vektorS vektorV];
%disp(hasil)
set(handles.hasil,'Data',hasil); %menampilkan ke tabel hasil sudah urut


function nama_Callback(hObject, eventdata, handles)
% hObject    handle to nama (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nama as text
%        str2double(get(hObject,'String')) returns contents of nama as a double


% --- Executes during object creation, after setting all properties.
function nama_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nama (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function brand_Callback(hObject, eventdata, handles)
% hObject    handle to brand (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of brand as text
%        str2double(get(hObject,'String')) returns contents of brand as a double


% --- Executes during object creation, after setting all properties.
function brand_CreateFcn(hObject, eventdata, handles)
% hObject    handle to brand (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jenis_Callback(hObject, eventdata, handles)
% hObject    handle to jenis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jenis as text
%        str2double(get(hObject,'String')) returns contents of jenis as a double


% --- Executes during object creation, after setting all properties.
function jenis_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jenis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ISO_Callback(hObject, eventdata, handles)
% hObject    handle to ISO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ISO as text
%        str2double(get(hObject,'String')) returns contents of ISO as a double


% --- Executes during object creation, after setting all properties.
function ISO_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ISO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function price_Callback(hObject, eventdata, handles)
% hObject    handle to price (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of price as text
%        str2double(get(hObject,'String')) returns contents of price as a double


% --- Executes during object creation, after setting all properties.
function price_CreateFcn(hObject, eventdata, handles)
% hObject    handle to price (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function link_Callback(hObject, eventdata, handles)
% hObject    handle to link (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of link as text
%        str2double(get(hObject,'String')) returns contents of link as a double


% --- Executes during object creation, after setting all properties.
function link_CreateFcn(hObject, eventdata, handles)
% hObject    handle to link (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function DR_Callback(hObject, eventdata, handles)
% hObject    handle to DR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DR as text
%        str2double(get(hObject,'String')) returns contents of DR as a double


% --- Executes during object creation, after setting all properties.
function DR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CD_Callback(hObject, eventdata, handles)
% hObject    handle to CD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CD as text
%        str2double(get(hObject,'String')) returns contents of CD as a double


% --- Executes during object creation, after setting all properties.
function CD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in simpanbtn.
function simpanbtn_Callback(hObject, eventdata, handles)
% hObject    handle to simpanbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data;

nama = get(handles.nama,'string');
brand = get(handles.brand,'string');
jenis = get(handles.jenis,'string');
CD = str2double(get(handles.CD,'string'));
DR = str2double(get(handles.DR,'string'));
ISO = str2double(get(handles.ISO,'string'));
price = str2double(get(handles.price,'string'));
link = get(handles.link,'string');

data.Mydata = [data.Mydata;[{nama} {brand} {jenis} {CD} {DR} {ISO} {price} {link}]]
data.MydataNum = [data.MydataNum;CD DR ISO price];

disp(data.MydataNum);
set(handles.data,'Data',data.Mydata);

% --- Executes on button press in filebtn.
function filebtn_Callback(hObject, eventdata, handles)
% hObject    handle to filebtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global data;
[num,txt,raw] = xlsread('data-kamera.xlsx','Worksheet','A2:H94');
data.Mydata = [data.Mydata;raw];
data.MydataNum = [data.MydataNum;num];
set(handles.data,'Data',data.Mydata);
