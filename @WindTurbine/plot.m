function plot(obj)
rangeVelocity = obj.CutInVelocity:obj.CutOutVelocity;
Power = obj.Fpower(rangeVelocity,1.225*ones(1,length(rangeVelocity)));
figure;
plot(rangeVelocity,Power)
grid on
