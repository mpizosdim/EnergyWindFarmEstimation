function obj = getAnnualFarm(obj)
[occurancies,b] = hist3([obj.WindModel.GatheredData]);
[x,y] = meshgrid(b{1},b{2});
Velocity = x(:);
direction = y(:);
propabilities = occurancies/length(obj.WindModel.MeasuredVelocity);
propabilities = propabilities(:);
obj.Power = obj.getPowerFarm(Velocity,direction,propabilities);