function Velocity = CalcVelocityInHeight(obj,Height)
Velocity = obj.MeasuredVelocity*((Height)./(obj.Height)).^obj.WindShearExponent;