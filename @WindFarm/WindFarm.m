classdef WindFarm < handle
    properties
        windTurbine@WindTurbine
        WindModel@WindModel
        NwindTurbines
        Area@Area
        Power
    end
    
    methods
        function obj = WindFarm(windTurbine,WindModel,Area)
            obj.windTurbine = windTurbine;
            obj.WindModel = WindModel;
            obj.Area = Area;
            obj.NwindTurbines = length(windTurbine);
        end
        obj = OrderCalculations(obj);
        TotalPower = getPowerFarm(obj,Velocity,direction,propability)
        obj = getAnnualFarm(obj)
        plot(obj)
    end
    
end