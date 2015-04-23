function varargout = WindFarmOptimizer1(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @WindFarmOptimizer1_OpeningFcn, ...
    'gui_OutputFcn',  @WindFarmOptimizer1_OutputFcn, ...
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
function WindFarmOptimizer1_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
function varargout = WindFarmOptimizer1_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;
function LoadWindData_Callback(hObject, eventdata, handles)
uiload;
handles.DataLoaded = Data;
guidata(hObject, handles);
function Input_HeightOfMeasurements_Callback(hObject, eventdata, handles)
function Input_HeightOfMeasurements_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Input_WindShearExponent_Callback(hObject, eventdata, handles)
function Input_WindShearExponent_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Input_DeltaT_Callback(hObject, eventdata, handles)
function Input_DeltaT_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Input_AirDensity_Callback(hObject, eventdata, handles)
function Input_AirDensity_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function PlotVelocity_Callback(hObject, eventdata, handles)
handles.WindModelCreated.plot();
function ApplyCharacteristics_Callback(hObject, eventdata, handles)
Height = str2double(get(handles.Input_HeightOfMeasurements,'String'));
WindShearExponent = str2double(get(handles.Input_WindShearExponent,'String'));
DeltaT = str2double(get(handles.Input_DeltaT,'String'));
AirDensity = str2double(get(handles.Input_AirDensity,'String'));
WindModelCreated = WindModel(handles.DataLoaded(:,1),handles.DataLoaded(:,2),Height,WindShearExponent,DeltaT,AirDensity);
handles.WindModelCreated = WindModelCreated;
guidata(hObject, handles);
set(handles.meanVelocity,'String',['Mean:',num2str(WindModelCreated.Mean)]);
set(handles.StDVelocity,'String',['Standard Deviation:',num2str(WindModelCreated.StandardDeviation)])
[ScaleParameter,ShapeParameter] = WindModelCreated.getWeibullDistributionValues();
set(handles.ShapeParameter,'String',['Shape Parameter:',num2str(ShapeParameter)]);
set(handles.ScaleParameter,'String',['Scale Parameter:',num2str(ScaleParameter)]);
set(handles.EnergyPatternFactor,'String',['Energy Pattern Factor:',num2str(WindModelCreated.EnergyPatternFactor)]);



function Input_Area_Callback(hObject, eventdata, handles)
function Input_Area_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Input_Resolution_Callback(hObject, eventdata, handles)
function Input_Resolution_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function ApplyArea_Callback(hObject, eventdata, handles)
sizeTemp = get(handles.Input_Area,'String');
S = sprintf('%s ', sizeTemp{:});
size = str2num(S);
resolution = str2double(get(handles.Input_Resolution,'String'));
AreaCreated = Area(size,resolution);
handles.AreaCreated = AreaCreated;
guidata(hObject, handles);
function NoOfWindTurbines_Callback(hObject, eventdata, handles)
function NoOfWindTurbines_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Input_TypeOfWindTurbine_Callback(hObject, eventdata, handles)
function Input_TypeOfWindTurbine_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function ApplyWindFarm_Callback(hObject, eventdata, handles)
IndexTypeWindTurbine = get(handles.Input_TypeOfWindTurbine,'Value');
NumberOfWindTurbines = str2double(get(handles.NoOfWindTurbines,'String'));
switch IndexTypeWindTurbine
    case 1
        typeWindTurbine = 'NordexN80_2500KW';
    case 2
        typeWindTurbine = 'NordexN90_2500KW_HS';
    case 3
        typeWindTurbine = 'NordexN90_2500KW_LS';
    case 4
        typeWindTurbine = 'NordexN100_2500KW_LS';
    case 5
        typeWindTurbine = 'PowerWind56_900KW';
    case 6
        typeWindTurbine = 'PowerWind56_900KW_B';
    case 7
        typeWindTurbine = 'PowerWind90_2500KW_B';
    case 8
        typeWindTurbine = 'VestasV52_850KW';
    case 9
        typeWindTurbine = 'VestasV60_850KW';
    case 10
        typeWindTurbine = 'VestasV80_2MW';
    case 11
        typeWindTurbine = 'VestasV82_1650KW';
    case 12
        typeWindTurbine = 'VestasV90_2MW';
    case 13
        typeWindTurbine = 'VestasV90_3MW';
    case 14
        typeWindTurbine = 'VestasV90_1800KW';
    case 15
        typeWindTurbine = 'VestasV100_1800KW';
    case 16
        typeWindTurbine = 'VestasV112_3MW';
end
TypeOfInputingTurbines = get(handles.TypeOfInputTurbines,'Value');
if TypeOfInputingTurbines == 1
    for ii = 1:NumberOfWindTurbines
        prompt = {'Enter X position:','Enter Y position:'};
        dlg_title = 'Input';
        num_lines = 1;
        def = {'50','50'};
        answer = inputdlg(prompt,dlg_title,num_lines,def);
        Coordinates  = str2double(answer);
        x(ii) = Coordinates(1);
        y(ii) = Coordinates(2);
        WindTurbineCreated(ii) = WindTurbine(typeWindTurbine,x(ii),y(ii));
    end
elseif TypeOfInputingTurbines == 2
    handles.AreaCreated
    ForThePlot = ones(size(handles.AreaCreated.xx));
    figure;
    surf(ForThePlot,'EdgeColor','None');
    view(2);
    xlim([0 handles.AreaCreated.size(1)])
    ylim([0 handles.AreaCreated.size(2)])
    for ii = 1:NumberOfWindTurbines
        [x(ii),y(ii)] = ginput(1);
        WindTurbineCreated(ii) = WindTurbine(typeWindTurbine,x(ii),y(ii));
    end
end
handles.WindTurbineCreated = WindTurbineCreated;
guidata(hObject, handles);
function TypeOfInputTurbines_Callback(hObject, eventdata, handles)
function TypeOfInputTurbines_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function SimulateWindFarm_Callback(hObject, eventdata, handles)
TypeSimulation = get(handles.TypeSimulation1,'Value');
if TypeSimulation == 1
    WindFarmCreated = WindFarm([handles.WindTurbineCreated],handles.WindModelCreated,handles.AreaCreated);
    handles.WindFarmCreated = WindFarmCreated;
    WindFarmCreated.getAnnualFarm();
    WindFarmCreated.plot()
    guidata(hObject, handles);
elseif TypeSimulation == 2
    WindSpeed = str2double(get(handles.WindSpeedSimulation,'String'));
    WindDirection = str2double(get(handles.WindDirectionSimulation,'String'));
    WindDirection = deg2rad(WindDirection);
    Height = str2double(get(handles.Input_HeightOfMeasurements,'String'));
    WindShearExponent = str2double(get(handles.Input_WindShearExponent,'String'));
    DeltaT = str2double(get(handles.Input_DeltaT,'String'));
    AirDensity = str2double(get(handles.Input_AirDensity,'String'));
    propabilities = 1;
    WindTry1 = WindModel(WindSpeed,WindDirection,Height,WindShearExponent,DeltaT,AirDensity);
    WindFarmCreated = WindFarm([handles.WindTurbineCreated],WindTry1,handles.AreaCreated);
    WindFarmCreated.getPowerFarm(WindSpeed,WindDirection,propabilities);
    WindFarmCreated.plot()
end
function TypeSimulation1_Callback(hObject, eventdata, handles)
function TypeSimulation1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function WindSpeedSimulation_Callback(hObject, eventdata, handles)
function WindSpeedSimulation_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function WindDirectionSimulation_Callback(hObject, eventdata, handles)
function WindDirectionSimulation_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function PlotPowerCurve_Callback(hObject, eventdata, handles)
handles.WindTurbineCreated(1).plot()