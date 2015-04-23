classdef WindTurbine < handle 
   properties
   radius
   x
   y
   Height
   Fpower
   Power
   Energy
   CutInVelocity
   CutOutVelocity
   end
   
   methods
       function obj = WindTurbine(type,x,y)
          load([type,'.mat']); 
          obj.radius = Rotor(1)/2;
          obj.Height = Height(1)/2;
          minIndex = find(WindSpeed==min(WindSpeed));
          maxIndex = find(WindSpeed==max(WindSpeed));
          for ii = 1:length(minIndex)
             PowerNew(ii,:) = Power(minIndex(ii):maxIndex(ii)); 
          end
          [obj.CutInVelocity,min1]=min(WindSpeed);
          [obj.CutOutVelocity,max1]=max(WindSpeed);
          WindSpeedNew = WindSpeed(min1:max1);
          AirDensityNew = AirDensity(minIndex);
          if regexp(type,'Vestas', 'once')
              PowerNew(1,:) = [];
              AirDensityNew(1) = [];
          elseif regexp(type,'PowerWind', 'once')
             warning(['Air Density provided for this turbine is:',num2str(AirDensityNew)]) 
          end
          [XGrid,YGrid]=meshgrid(WindSpeedNew,AirDensityNew); 
          obj.Fpower=griddedInterpolant(XGrid', YGrid',PowerNew','linear','none');
          obj.x = x;
          obj.y = y;
          clear WindSpeed AirDensity 
       end
       Power = getPower(obj,WindSpeed,AirDensity)
       Energy = getEnergy(obj,Power,DeltaT)
       plot(obj)
   end
    
end