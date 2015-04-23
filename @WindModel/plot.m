function plot(obj)
figure
subplot(3,1,1)
plot(obj.MeasuredVelocity)
grid on
xlim([0 length(obj.MeasuredVelocity)])
subplot(3,1,2)
BIN = 0:max(obj.MeasuredVelocity);
h1 = hist(obj.MeasuredVelocity,BIN);
bar(BIN,h1/length(obj.MeasuredVelocity))
grid on
[ScaleParameter,ShapeParameter] = obj.getWeibullDistributionValues();
f=ShapeParameter.*((BIN.^(ShapeParameter-1))/(ScaleParameter.^ShapeParameter)).*exp(-(BIN/ScaleParameter).^ShapeParameter);
f = f/sum(f);
hold on
plot(BIN,f,'r')
hold off
title('PDF')
subplot(3,1,3)
C = cumsum(h1);
plot(BIN,C/length(obj.MeasuredVelocity))
grid on
title('CDF')
figure
hist3([obj.MeasuredVelocity,obj.direction]);
set(get(gca,'child'),'FaceColor','interp','CDataMode','auto');
figure
wind_rose(rad2deg(obj.direction),obj.MeasuredVelocity)