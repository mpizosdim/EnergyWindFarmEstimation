function TotalEnergy = getPowerFarm(obj,Velocity,direction,propability)
distances2 = zeros([obj.NwindTurbines size(obj.Area.xx)]);
Velocity = Velocity *((obj.windTurbine(1).Height)./(obj.WindModel.Height)).^obj.WindModel.WindShearExponent;
for ii = 1:obj.NwindTurbines
    distances2(ii,:,:) = sqrt((obj.Area.xx-obj.windTurbine(ii).x).^2+(obj.Area.yy-obj.windTurbine(ii).y).^2);
end
for jj = 1:length(Velocity)
    distances = zeros([obj.NwindTurbines size(obj.Area.xx)]);
    for ii = 1:obj.NwindTurbines
        distances(ii,:,:) = (obj.Area.xx-obj.windTurbine(ii).x)*cos(direction(jj))+(obj.Area.yy-obj.windTurbine(ii).y)*sin(direction(jj));
    end
    if direction(jj) >= deg2rad(0) && direction(jj) <= deg2rad(90)
        [~,c] = sort(abs(distances(:,1,1)),1);
    elseif direction(jj) > deg2rad(90) && direction(jj) <= deg2rad(180)
        [~,c] = sort(abs(distances(:,end,1)),1);
    elseif direction(jj) > deg2rad(180) && direction(jj) <= deg2rad(270)
        [~,c] = sort(abs(distances(:,end,end)),1);
    elseif direction(jj) > deg2rad(270) && direction(jj) <= deg2rad(360)
        [~,c] = sort(abs(distances(:,1,end)),1);
    end
    v = ones(size(obj.Area.xx))*Velocity(jj);
    Degrees = acos(abs(distances)./distances2);
    for kk=1:obj.NwindTurbines
        %Degrees = acos(abs(distances(c(kk),:,:))./distances2(c(kk),:,:));
        for ll = 1:size(obj.Area.xx,1)
            for nn = 1:size(obj.Area.yy,2)
                if Degrees(c(kk),ll,nn)<=deg2rad(20) && distances(c(kk),ll,nn)>0
                    f = (1+cos(9*Degrees(c(kk),ll,nn)))/2;
                    v(ll,nn) = v(ll,nn)*(1-((2/3)*(obj.windTurbine(c(kk)).radius/(obj.windTurbine(c(kk)).radius+0.1*distances(c(kk),ll,nn))).^2)*f);
                end
            end
        end
        TempDistance = squeeze(distances2(c(kk),:,:));
        [~,ind] = min(abs(TempDistance(:)));
        [ra,ca] = ind2sub(size(TempDistance),ind);
        Kvalue=2;
        %sub = M(max((r-n), 1):min((r+n),end), max((c-n),1):min((c+n),end));
        sub = v((ra-Kvalue):(ra+Kvalue), (ca-Kvalue):(ca+Kvalue));
        Power(jj,c(kk)) = obj.windTurbine(c(kk)).getPower(max(max(sub)),obj.WindModel.AirDensity);
        
        
    end
    Power(jj,isnan(Power(jj,:))) = 0;
    
    TotalEnergy(jj) = sum(Power(jj,:))*propability(jj)*obj.WindModel.DeltaT;
    % clear distances
end
for ii=1:obj.NwindTurbines
    obj.windTurbine(ii).Energy = sum(Power(:,ii).*propability)*obj.WindModel.DeltaT;
end
TotalEnergy = sum(TotalEnergy);
if length(Velocity) ==1
    figure
    surf(v,'EdgeColor','None');
    view(2);
end