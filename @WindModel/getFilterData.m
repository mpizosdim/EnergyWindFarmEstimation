function FilteredData = getFilterData(obj,data,CutInVelocity,CutOutVelocity)
FilteredData = data(data>CutInVelocity&data<CutOutVelocity,:);
