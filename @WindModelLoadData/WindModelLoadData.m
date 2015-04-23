classdef WindModelLoadData < handle
    properties
        name
        Data
    end
    
    methods
        function obj = WindModelLoadData(name,path)
            obj.name = name;
            DataImported = load(path);
            DataNew = DataImported(~all(DataImported(:,3:4)==999,2)&~any(DataImported(:,2)==99.99,2),:);
            DataNew(:,3) = (DataNew(:,3)~=999).*DataNew(:,3)+(DataNew(:,4)~=999).*DataNew(:,4);
            obj.Data = DataNew;
        end
    end
    
end