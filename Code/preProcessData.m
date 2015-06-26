function m=preProcessData(path)
system=xlsread(path,'sheet1');
%mem=xlsread('..\Data\20150619-PRMBMTR01-Unix_Memory-full.xls','sheet1');
%cpu=xlsread('..\Data\20150619-PRMBMTR01-SMP_CPU-full.xls','sheet1');
%system=[system,mem];
%targetCol=[13:22,25,31:32,46,50:59];

% WaitIO=16;
% Processes_in_Run_Queue=17;
% Page_Faults=19;
% CPU_Context_Switches=27;
% System_Calls=28;
% DUMMY_Memory_Free=45;
% CPU_Busy=50;
% Processes_Runnable=54;
% targetCol=[Processes_in_Run_Queue,Page_Faults,...
%              CPU_Context_Switches,System_Calls,DUMMY_Memory_Free,...
%                   CPU_Busy,Processes_Runnable];
% data=data(:,targetCol);

dataMin=min(system);
dataMin=repmat(dataMin,[size(system,1),1]);
dataMax=max(system);
dataMax=repmat(dataMax,[size(system,1),1]);
system=(system-dataMin)./(dataMax-dataMin);
system(find(isnan(system)==1)) = 0;
system(find(isinf(system)==1)) = 0;
delta2=std(system).^2;
% data(:,2)=log(data(:,2)+6e-06);
% data(:,3)=log(data(:,3)+3e-01);
% data(:,4)=data(:,4).^0.25;
% data(:,6)=log(data(:,6)+6e-3);
resX=[];
resY=[];
corL=[];
for i=1:size(system,2) 
    for j=i+1:size(system,2)-1 
        cor = (corr(system(:,i),system(:,j)));
        if(abs(cor)>0.6)
           
          %cor=cor*min(delta2(1,i),delta2(1,j));
           corL=[corL;cor];
           resX=[resX;i];
           resY=[resY;j];
        end    
   end
end
m=[resX,resY,corL];
%plot(data(:,2),data(:,6),'*');
% dataMin=min(system);
% dataMin=repmat(dataMin,[672,1]);
% dataMax=max(system);
% dataMax=repmat(dataMax,[672,1]);
% system=(system-dataMin)./(dataMax-dataMin);
% 
% 
% system(find(isnan(system)==1)) = 0;
% [mu sigma2] = estimateGaussian(system);
% p = multivariateGaussian(system, mu, sigma2);
end