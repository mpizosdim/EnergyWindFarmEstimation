classdef WindModel < handle 
   properties
   MeasuredVelocity
   GatheredData
   direction
   Height
   WindShearExponent
   Mean
   StandardDeviation
   EnergyPatternFactor
   DeltaT
   AirDensity
   NumberOfSample
   end
   
   methods
       function obj = WindModel(MeasuredVelocity,direction,Height,WindShearExponent,DeltaT,AirDensity)
          obj.MeasuredVelocity = MeasuredVelocity;
          obj.direction = deg2rad(direction);
          obj.GatheredData = [MeasuredVelocity,obj.direction];
          obj.NumberOfSample = length(MeasuredVelocity);
          obj.Height = Height;
          obj.WindShearExponent = WindShearExponent;
          obj.Mean = mean(MeasuredVelocity);
          obj.StandardDeviation = std(MeasuredVelocity);
          obj.EnergyPatternFactor = (1/(length(MeasuredVelocity)*obj.Mean^3))*sum(MeasuredVelocity.^3);%WindEnergyExplained: page 34
          obj.DeltaT = DeltaT;
          obj.AirDensity = AirDensity;
       end
       Velocity = CalcVelocityInHeight(obj,Height)
       plot(obj)
       [ScaleParameter,ShapeParameter] = getWeibullDistributionValues(obj)
       FilteredData = getFilterData(obj,data)
   end
    
end