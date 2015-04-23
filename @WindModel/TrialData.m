clear all;close all;
load('sprog.tsv')
Data = sprog(~all(sprog(:,3:4)==999,2)&~any(sprog(:,2)==99.99,2),:);
Data(:,3) = (Data(:,3)~=999).*Data(:,3)+(Data(:,4)~=999).*Data(:,4);
Data(:,4) = [];
Data(:,1) = [];