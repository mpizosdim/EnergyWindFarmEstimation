clear all;close all;
%Obtain the layers of interest.
ortho = wmsfind('usgs*topographic*small*scale','SearchField','any');
ortho = ortho(1);

layers = wmsfind('nasa.network', 'SearchField', 'serverurl');
us_ned = layers.refine('usgs ned 30');

%Assign geographic extent and image size
latlim = [36 36.5];
lonlim = [-113.36 -113.13];
imageHeight = 575;
imageWidth = 575;

%Read the ortho layer
A = wmsread(ortho, 'Latlim', latlim, 'Lonlim', lonlim, ...
   'ImageHeight', imageHeight, 'ImageWidth', imageWidth);
%Read the USGS US_NED layer
[Z, R] = wmsread(us_ned, 'ImageFormat', 'image/bil', ...
    'Latlim', latlim, 'Lonlim', lonlim, ...
    'ImageHeight', imageHeight, 'ImageWidth', imageWidth);
%Drape the ortho image onto the elevation data
figure
usamap(latlim, lonlim)
framem off; mlabel off; plabel off; gridm off
geoshow(double(Z), R, 'DisplayType', 'surface', 'CData', A);
daspectm('m',1)
title({'Grand Canyon', 'USGS NED and Ortho Image'}, ...
   'FontSize',8);
axis vis3d
% %camera
% cameraPosition = [96431 4.2956e+06 -72027];
% cameraTarget = [-82.211 4.2805e+06 3054.6];
% cameraViewAngle = 8.1561;
% cameraUpVector = [3.8362e+06 5.9871e+05 5.05123e+006];
% %camera light 
% set(gca,'CameraPosition', cameraPosition, ...
%     'CameraTarget', cameraTarget, ...
%     'CameraViewAngle', cameraViewAngle, ...
%     'CameraUpVector', cameraUpVector);
% lightHandle = camlight;
% camLightPosition = [7169.3 1.4081e+06 -4.1188e+006];
% set(lightHandle, 'Position', camLightPosition);
