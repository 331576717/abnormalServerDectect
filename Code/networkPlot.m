function networkPlot
close all;
data=xlsread('../Data/20150623-PMNYWEB1-KLZ_IO_Ext.xls');
step=1248;
for i=1:10
subplot(3,4,i),plot(mod(data(step*(i-1)+1:i*step,1),100000)/1000,data(step*(i-1)+1:i*step,12),'*');
title(num2str(floor(data(step*(i-1)+1,1)/100000)));

end
