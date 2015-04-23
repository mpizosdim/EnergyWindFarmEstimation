clear all
layers = wmsfind('elevation', 'SearchField', 'layername');
layers(3)
ortho = layers(3);
latlim = [39 39.5];
lonlim = [21 21.5];
imageHeight = 1000;
imageWidth = 1000;
A = wmsread(ortho, 'Latlim', latlim, 'Lonlim', lonlim, ...
'ImageHeight', imageHeight, 'ImageWidth', imageWidth);
figure;
subplot(2,1,1)
surf(double(A),'EdgeColor','None');view(2)
subplot(2,1,2)
surf(double(A),'EdgeColor','None');view(3)
