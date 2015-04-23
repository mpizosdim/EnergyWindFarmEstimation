%clear classes;close all
Velocity = Data(:,1);
direction = Data(:,2);
Height = 90;
DeltaT = 600;
AirDensity = 1.22;
WindShearExponent = 0.14;
size = [200 205];
resolution = 0.4;
area = Area(size,resolution);
WindTry1 = WindModel(Velocity,direction,Height,WindShearExponent,DeltaT,AirDensity);
WindTurbine1 = WindTurbine('NordexN80_2500KW',9.9,9.9);
WindTurbine2 = WindTurbine('NordexN80_2500KW',100,100);
WindTurbine3 = WindTurbine('NordexN80_2500KW',150,130);
WindTurbine4 = WindTurbine('NordexN80_2500KW',150,140);
WindTurbine5 = WindTurbine('NordexN80_2500KW',150,100);
Farm = [WindTurbine1 WindTurbine2 WindTurbine3 WindTurbine4 WindTurbine5];

WindFarmTrial = WindFarm(Farm,WindTry1,area);

%WindFarmTrial.OrderCalculations()

