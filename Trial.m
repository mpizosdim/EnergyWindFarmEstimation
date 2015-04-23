clear all;close all
n = 200;
m=150;
Resolution = 0.5;
[xx,yy] = meshgrid(0:Resolution:n,0:Resolution:m);
u=9;
theta = deg2rad(300);

x0 =50;
y0= 45;
r0=3;
distances = abs((xx-x0)*cos(theta)+(yy-y0)*sin(theta));
distances2 = sqrt((xx-x0).^2+(yy-y0).^2);
Degrees = acos(distances./distances2);
LimitDegrees = deg2rad(20);
for ii = 1:size(xx,1)
    for jj = 1:size(yy,2)
        if Degrees(ii,jj)>deg2rad(20) || xx(ii,jj)<x0
            v(ii,jj) = u;
        else
            f = (1+cos(9*Degrees(ii,jj)))/2;
            v(ii,jj) = u*(1-((2/3)*(r0/(r0+0.1*distances(ii,jj))).^2)*f);
        end
    end
end


x02 =50;
y02= 50;
r0=3;
distancesB = sqrt((xx-x02).^2);
distances2B = sqrt((xx-x02).^2+(yy-y02).^2);
DegreesB = acos(distancesB./distances2B);
for ii = 1:size(xx,1)
    for jj = 1:size(yy,2)
        if DegreesB(ii,jj)>deg2rad(20) || xx(ii,jj)<x02
            v(ii,jj) = v(ii,jj);
        else
            f = (1+cos(9*DegreesB(ii,jj)))/2;
            v(ii,jj) = v(ii,jj)*(1-((2/3)*(r0/(r0+0.1*distancesB(ii,jj))).^2)*f);
        end
    end
end


x03 =89;
y03= 59;
r0=3;
distancesC = sqrt((xx-x03).^2);
distances2C = sqrt((xx-x03).^2+(yy-y03).^2);
DegreesC = acos(distancesC./distances2C);
for ii = 1:size(xx,1)
    for jj = 1:size(xx,2)
        if DegreesC(ii,jj)>deg2rad(20) || xx(ii,jj)<x03
            v(ii,jj) = v(ii,jj);
        else
            f = (1+cos(9*DegreesC(ii,jj)))/2;
            v(ii,jj) = v(ii,jj)*(1-((2/3)*(r0/(r0+0.1*distancesC(ii,jj))).^2)*f);
        end
    end
end


x04 =20;
y04= 125;
r0=3;
distancesD = sqrt((xx-x04).^2);
distances2D = sqrt((xx-x04).^2+(yy-y04).^2);
DegreesD = acos(distancesD./distances2D);
for ii = 1:size(xx,1)
    for jj = 1:size(xx,2)
        if DegreesD(ii,jj)>deg2rad(20) || xx(ii,jj)<x04
            v(ii,jj) = v(ii,jj);
        else
            f = (1+cos(9*DegreesD(ii,jj)))/2;
            v(ii,jj) = v(ii,jj)*(1-((2/3)*(r0/(r0+0.1*distancesD(ii,jj))).^2)*f);
        end
    end
end

figure;
surf(v,'EdgeColor','None');
view(2);
box on

