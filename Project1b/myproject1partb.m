function varargout = myproject1partb(varargin)
% MYPROJECT1PARTB MATLAB code for myproject1partb.fig
%      MYPROJECT1PARTB, by itself, creates a new MYPROJECT1PARTB or raises the existing
%      singleton*.
%
%      H = MYPROJECT1PARTB returns the handle to a new MYPROJECT1PARTB or the handle to
%      the existing singleton*.
%
%      MYPROJECT1PARTB('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MYPROJECT1PARTB.M with the given input arguments.
%
%      MYPROJECT1PARTB('Property','Value',...) creates a new MYPROJECT1PARTB or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before myproject1partb_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to myproject1partb_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help myproject1partb

% Last Modified by GUIDE v2.5 13-Nov-2016 10:31:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @myproject1partb_OpeningFcn, ...
                   'gui_OutputFcn',  @myproject1partb_OutputFcn, ...
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


% --- Executes just before myproject1partb is made visible.
function myproject1partb_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to myproject1partb (see VARARGIN)

% Choose default command line output for myproject1partb
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes myproject1partb wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = myproject1partb_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% 1st pushbutton 'open file'
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FileName = uigetfile('*.txt');
help uigetfile;
% uigetfile displays a modal dialog box that lists files in the current folder and enables you to select or enter the name of a file.
%If the file name is valid (and the file exists), uigetfile returns the file name when you click Open.
read=fopen(FileName,'r');
help fopen;
myCell=textscan(read, '%s %d %d %d');
help textscan;
%read the file and take components, 'from node' parts, 'to node' parts and
%values and transfer to a cell array
dimension_myCell=size(myCell{1,1});
d=dimension_myCell(1);
% d is number of components
help handles;
for i=1:d
   handles.e1 = myCell{1,2}(i);
   % create a handle containing 'from node' parts
    handles.e2 = myCell{1,3}(i);
    % create a handle containing 'to node' parts
    handles.e3 = myCell{1,4}(i);
  % create a handle containing 'value' parts
    handles.e4 = myCell{1,1}{i};
  % create a handle containing 'component' parts
val=isfield(handles,'data');
% check if there is a field called data
if val==1
    % for any i other than 1, function runs that part.
  handles.data(end+1).e4 =handles.e4;
  % the new component is joined here to old component as a new field. this happens with
  % the help of end+1.
handles.data(end).e1=handles.e1;
% there is no need to write again end+1, because an another row in 'data'
% field is already created. 
% handle is a 1x1 struct with many different fields. handle.data is one of
% them. handle.data is a 1xn struct. so there is a struct in struct. n is
% the number of fields in handle.data.
handles.data(end).e2=handles.e2;
handles.data(end).e3=handles.e3;
 
elseif val==0
    % in the beginning there is no field called data. but under that part
    % it is created, so for any i other than 1 function does not run this part. 
handles.data.e4 =handles.e4;
handles.data.e1=handles.e1;
handles.data.e2=handles.e2;
handles.data.e3=handles.e3;

end
end

handles.new = FileName;
% I attached the filename to a handle, because in other parts I need it.

guidata(hObject, handles);


% 2nd pushbutton 'display the elements'
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

N=length(handles.data);
% length of 'data' field. It is the number of fields in handles.data.  
for i=1:N
a = string('%s %d %d %d \n');
% lets examine handles.data field by field
a1= handles.data(i).e4;
%'The 'component' in i'th field
a2= handles.data(i).e1;
%'The 'from node' part in i'th field
a3= handles.data(i).e2;
%'The 'to node' part in i'th field
a4= handles.data(i).e3;
%'The 'value' part in i'th field
if i==1
    str = sprintf(a,a1,a2,a3,a4);
end
if i~=1
    str2 = sprintf(a,a1,a2,a3,a4);
    str3 = strcat(str,str2);
    str = str3;
    % I added field by field every components, values, 'from node' parts
    % and 'to node' parts. so str contains every field.
    
end

end

set(handles.text1,'String',str);
% the static text1 contains this str, so it shows the user the elements as
% a table with the information
% the identifier of the element
% the connections of the element
% the value of the element


guidata(hObject, handles);

% 3rd pushbutton 'solve'
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

myCell = readfile(handles.new);
% read the input file
% I said that I am going to use the filename taken in the beginning of gui from
% the user. readfile function opens the .txt file given by user in the
% beginning
help readfile;
n = find_node(myCell);
% find node number
help find_node;
d = numberofcomponents(myCell);
% find the number of components
help numberofcomponents;
k = number_of_voltage(myCell,d);
% find voltage source number
help number_of_voltage;
[X] = solution_matrix(n,k);
% create a solution matrix with zeros
help solution_matrix;
[K,Z] = create_Z_matrix(n,k,myCell,d);
% create the Z matrix
help create_Z_matrix;
[G,D,B]=G_matrix_part1(n,k,myCell,d);
% create G matrix part1
help G_matrix_part1;
[G]=G_matrix_part2( d,n,G,myCell);
% create G matrix part2
help G_matrix_part2;
[B]=B_matrix(k,K,B);
% create B matrix
help B_matrix;
[A]=C_A_matrices(B,G,D);
% create A matrix which is combination of G,B,C,D.
help C_A_matrices;
[X_new]=solution(A,Z,X,n);
help solution;
% solve the circuit and return the value of node voltages
% all of this functions come from the project part A. so it is useful to
% solve part A with many useful functions like that. X_new is the solution.
% But it is a matrix. So I need to turn it into a string so that I can
% express it in static text2.
str4 = mat2str(X_new);
help mat2str;
% Convert matrix X_new to character vector 'str4'.
set(handles.text2,'String',str4); 
help set;
% display in static text 2 the solution of the given circuit. The voltage
% values at every given node.

guidata(hObject, handles);

% 4.1 task Allow the user to modify thevalues of the elements and run the simulation again.
% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
if get(hObject,'Value')==2
handles.selection='V';
%  a handle with the handles.selection is created to indicate the kind of
%  component chosen in the popupmenu.
elseif get(hObject,'Value')==3
handles.selection='I';
elseif get(hObject,'Value')==4
handles.selection='R';
end
guidata(hObject, handles);


%4.2
% this function should take an integer from the user. This integer
% indicates the exact name of component. For example if user chooses in
% popupmenu V as a component and gives the integer '1' in this part. The
% component is called V1.
function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
handles.edit4=str2double(get(hObject,'String'));
guidata(hObject, handles);


%4.3
% handles.edit1 represents the 'values' of the new components given
% by the user. This function should take an integer from the user.
function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
handles.edit1=str2double(get(hObject,'String'));
guidata(hObject, handles);


%4.4 save the given component
%The user push this button every time he wants to change the value of an
%component.
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val=isfield(handles,'data2');
if val==1
    % the other components go here. But the logic is same.
    % a new field data2 is created and the type of component (.selection)
    % the number of component (.edit4) and the value of component(.edit1)
    % are stored in handles.data2.
handles.data2(end+1).selection=handles.selection;
handles.data2(end).edit1=handles.edit1;
handles.data2(end).edit4=handles.edit4;

elseif val==0
%the first component goes here
handles.data2.selection=handles.selection;
handles.data2.edit1=handles.edit1;
handles.data2.edit4=handles.edit4;

end
guidata(hObject, handles);

%4.5 finishing modifying
% Once the user sets up new values for every component, he should push this
% button.
% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

N = length(handles.data2);
%N =the number of field in handles.data2 
help length;
help sprintf;
   N1 = length(handles.data);
   %N1 =the number of field in handles.data2
    
    for j =1 :N
         a = handles.data2(j).edit4;
    b = handles.data2(j).selection;
    str5 = sprintf('%s%d',b,a);
    % str5 is the exact sign of component with the given number. for
    % example V1 or I1 or R1 or any other component with another number.
    for i =1 :N1
        %two nested for statements are needed.
        if handles.data(i).e4 == str5
            % handles.data(i).e4 is already defined in task 1. It holds the
            % exact names of components. if the name of the component given
            % in the textfile and the name of the modified component are
            % the same, the function goes in this if statement and changes
            % the value of the component with the modified value which is
            % stored handles.data2.edit1;
            handles.data(i).e3= handles.data2(j).edit1;
        end
    end
    end
    
    % The value change is done.
    % but we should save it.
    %there I need again handles.new which holds the filename given in the
    %beginning.
   
   

   
FID=fopen(handles.new,'w');
%open or create new file for writing. Discard existing contents, if any.
%the txt file chosen in first part is cleaned here. So I need to store my
%new datas in these textfile.
for i=1:N1
   
fprintf(FID,'%s %d %d %d \n',handles.data(i).e4,handles.data(i).e1,handles.data(i).e2,handles.data(i).e3);
%except the 'value' part (handles.data(i).e3) everything is same.

end
fclose(FID);
    
str5 = '';
% clean str5 
set(handles.text1,'String','');
% clean static text 1 
set(handles.text2,'String','');
% clean static text2

field = 'data';
field2 = 'data2';
field3 = 'e1';
field4 = 'e2';
field5 = 'e3';
field6 = 'e4';
field7 = 'new';
handles = rmfield(handles,field);
help rmfield;
handles = rmfield(handles,field2);
handles = rmfield(handles,field3);
handles = rmfield(handles,field4);
handles = rmfield(handles,field5);
handles = rmfield(handles,field6);
handles = rmfield(handles,field7);
% remove every field. Because they can cause some problems when
% the user opens the new textfile because there are information already
% stored in them. we have to clean it.

% Now my new textfile is ready. We should push the 'open file' button and
% choose the same textfile. If you display the elements you can see the
% changes in values.


guidata(hObject, handles);






%5.1 Task choose the type of element so that the node voltage can be
%expressed as a function of this element.
% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
if get(hObject,'Value')==2
handles.selection2='V';
%  a handle with the handles.selection is created to indicate the kind of
%  component chosen in the popupmenu.
elseif get(hObject,'Value')==3
handles.selection2='I';
elseif get(hObject,'Value')==4
handles.selection2='R';
end
guidata(hObject, handles);

% 5.2 
% this function should take an integer from the user. This integer
% indicates the exact name of component. For example if user chooses in
% popupmenu V as a component and gives the integer '1' in this part. The
% component is called V1.
function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double
handles.edit8=str2double(get(hObject,'String'));
guidata(hObject, handles);


%5.3
% Take an integer from the user stored in handles.edit5 and represents the
% minimum value of specified range.
function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double
handles.edit5=str2double(get(hObject,'String'));
guidata(hObject, handles);

%5.4
% Take an integer from the user stored in handles.edit6 and represents the
% maximum value of specified range.
function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double
handles.edit6=str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




%5.5
% Take an integer from the user stored in handles.edit7 and represents the
% step size of specified range.
function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double
handles.edit7=str2double(get(hObject,'String'));
guidata(hObject, handles);

% 5.6
% this function should take an integer from the user. This integer
% indicates the number of node voltage which I should plot.
function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double
handles.edit9=str2double(get(hObject,'String'));
guidata(hObject, handles);

%5.7
% This is my plotting function. Enter the values and just push this button.
% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

minimum_value = handles.edit5;
maximum_value = handles.edit6;
the_step_size = handles.edit7;
the_number_of_component = handles.edit8;
the_name_of_component = handles.selection2;
the_number_of_node_voltage = handles.edit9;
% take the given entered values as variables. One can understand the
% property of variables reading it's name.

    str7 = sprintf('%s%d',the_name_of_component,the_number_of_component);
    % str7 indicates the exact name of component with the number. for
    % example: V1 or I1.
x = minimum_value:the_step_size:maximum_value;
% I created a x vector which is a row vector started from minimum value increasing by given step size 
%in each step.
length_of_x = length(x);
% length_of_x indicates the number of integers in row vector.

myCell = readfile(handles.new);
% read the input file
% from partA

%*****************
str8 = sprintf('The node voltage @ node %d',the_number_of_node_voltage);
str9 = sprintf('for element %s in range [%d,%d] step size %d',str7,minimum_value,maximum_value,the_step_size);
set(handles.text6,'String',str9);
set(handles.text7,'String',str8);
% give names to x axis and y axis depending on the given values.
%****************



n = find_node(myCell);
% find node number
% from partA
d = numberofcomponents(myCell);
% from partA

% I should change the value of given component step by step
for i=1:d
    
if  str7 == myCell{1,1}{i}
    %if there is the same component in the textfile as in given component
    %in text edit.
   q=i;
   % take the indice of this component because it is important and will be
   % used later
end
end

% in this part the value of given component will be changed
for i = 1:length_of_x
    
   myCell{1,4}(q)=x(1,i); 
   % use q the indice of the same component
    % x is a row vector so x(1,i) is equal to saying i'th number in vector

% find the number of components
k = number_of_voltage(myCell,d);
% find voltage source number
[X] = solution_matrix(n,k);
% create a solution matrix with zeros
[K,Z] = create_Z_matrix(n,k,myCell,d);
% create the Z matrix
[G,D,B]=G_matrix_part1(n,k,myCell,d);
% create G matrix part1
[G]=G_matrix_part2( d,n,G,myCell);
% create G matrix part2
[B]=B_matrix(k,K,B);
% create B matrix
[A]=C_A_matrices(B,G,D);
% create A matrix which is combination of G,B,C,D.
[X_new]=solution(A,Z,X,n);
% solve the circuit and return the value of node voltages
% all of them come from part A.
% X_new is the solution matrix.
% X_new has size nx1 n = number of node voltages
 
y = X_new(the_number_of_node_voltage,1);
%  X_new(the_number_of_node_voltage,1) is equal the node voltage @ the_number_of_node_voltage


if i ==1
    P = [y];
    % take the first value in P
end
if i~=1
    P(end+1) = [y];
    % every node voltage value is added to P step by step.
    % so P has size after this process (length_of_x)x1
end

end

axes(handles.axes1);
% create a handle

% x is row vector so P should be a row vector but it is a column vector so
% take its transpose before plotting
plot(x,P');
help plot;


guidata(hObject, handles);









% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
