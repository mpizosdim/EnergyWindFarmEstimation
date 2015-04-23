close all;clear all
a = xlsread('Book15');
Rotor = a(:,5);
Height = a(:,7);
AirDensity = a(:,8);
WindSpeed = a(:,21);
Power = a(:,22);
ThrustCoef = a(:,23);
clear a
save('PowerWind90_2500KW_B.mat')
%Data = [Rotor Height AirDensity WindSpeed Power ThrustCoef];