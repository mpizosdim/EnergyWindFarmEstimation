function [ScaleParameter,ShapeParameter] = getWeibullDistributionValues(obj)
k1 = linspace(1,4,1000);
rhs = (gamma(1+(2./k1))./((gamma(1+(1./k1))).^2))-1;
lhs=obj.StandardDeviation^2/obj.Mean^2;
[~,t_ind]=min(abs(rhs-lhs));
ShapeParameter=k1(t_ind);
ScaleParameter=sqrt(obj.StandardDeviation^2/(gamma(1+2./ShapeParameter)-(gamma(1+1./ShapeParameter)).^2));
