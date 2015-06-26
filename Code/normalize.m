function [m,minData,maxData]=normalize(data)


dataMin=min(data);

minData=dataMin;
dataMin=repmat(dataMin,[size(data,1),1]);
dataMax=max(data);
maxData=dataMax;
dataMax=repmat(dataMax,[size(data,1),1]);
m=(data-dataMin)./(dataMax-dataMin);
m(find(isnan(data)==1)) = 0;
m(find(isinf(data)==1)) = 0;

end