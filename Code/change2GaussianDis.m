function m=change2GaussianDis(data)

m(:,1:5)=data(:,1:5).^0.2;
m(:,6)=data(:,6);
m(:,7:13)=data(:,7:13).^0.1;
%m=abs(data);
%m=log(m+1e-3);
end