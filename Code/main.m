function main()

data=xlsread('../Data/total.xlsx','sheet3');
data=data(:,2:size(data,2));
[data,minData,maxData]=normalize(data);

data=change2GaussianDis(data);
futureHis(data);


[mu sigma2] = estimateGaussian(data(100:570,:));

normal=data(1:100,:);
anomaly=data(602:648,:);
anomaly(:,1)=1;
anomaly(:,2)=1;

p = multivariateGaussian([normal;anomaly], mu, sigma2);

[epsilon F1] = selectThreshold([zeros(size(normal,1),1);ones(size(anomaly,1),1)], p);


test=data(1:100,:);


p1=multivariateGaussian(test,mu,sigma2);
sum(p1<epsilon)
end