classdef Area < handle 
   properties
   resolution
   size
   xx
   yy
   end
   
   methods
       function obj = Area(size,resolution)
          obj.resolution = resolution;
          obj.size = size;
         [obj.xx,obj.yy] = meshgrid(0:obj.resolution:obj.size(1),0:obj.resolution:obj.size(2));
       end
   end
    
end