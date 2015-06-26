function futureHis(data)
close all;

for i=1:size(data,2)
   figure,hist(data(:,i),80);
    title(num2str(i));
end
end