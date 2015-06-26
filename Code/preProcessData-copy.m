function m=preProcessData()
data=xlsread('..\Data\20150619-PRMBMTR01-System-full.xls','sheet1');
targetCol=[13:15,17,19,25:27,46];
data=data(:,targetCol);
dataMin=min(data);
dataMin=repmat(dataMin,[size(data,1),1]);
dataMax=max(data);
dataMax=repmat(dataMax,[size(data,1),1]);
data=(data-dataMin)./(dataMax-dataMin);
%data(find(isnan(data)==1)) = 0;
[mu sigma2] = estimateGaussian(data);
p = multivariateGaussian(data, mu, sigma2);
end