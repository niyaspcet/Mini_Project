clear all;
close all;
clc;

%%NSR Subjects
%minECG
ny1=xlsread('PTa.xlsx',2,'B2:B49');
nu1=xlsread('PTa.xlsx',2,'C2:C49');
ndata1=iddata(ny1,nu1,1/1000);

ny2=xlsread('PTa.xlsx',2,'F2:F49');
nu2=xlsread('PTa.xlsx',2,'G2:G49');
ndata2=iddata(ny2,nu2,1/1000);

ny3=xlsread('PTa.xlsx',2,'J2:J49');
nu3=xlsread('PTa.xlsx',2,'K2:K49');
ndata3=iddata(ny3,nu3,1/1000);

ny4=xlsread('PTa.xlsx',2,'R2:R49');
nu4=xlsread('PTa.xlsx',2,'S2:S49');
ndata4=iddata(ny4,nu4,1/1000);

ny5=xlsread('PTa.xlsx',2,'V2:V49');
nu5=xlsread('PTa.xlsx',2,'W2:W49');
ndata5=iddata(ny5,nu5,1/1000);

%5minute ECG
nyy=xlsread('PTa.xlsx',3,'A2:A241');
nuu=xlsread('PTa.xlsx',3,'B2:B241');
ndataa=iddata(nyy,nuu,1/1000);
%%Tachycardia Subjects
%minECG
tu1=xlsread('PTa.xlsx',4,'B2:B49');
ty1=xlsread('PTa.xlsx',4,'C2:C49');
tdata1=iddata(ty1,tu1,1/1000);

tu2=xlsread('PTa.xlsx',4,'F2:F49');
ty2=xlsread('PTa.xlsx',4,'G2:G49');
tdata2=iddata(ty2,tu2,1/1000);

tu3=xlsread('PTa.xlsx',4,'J2:J49');
ty3=xlsread('PTa.xlsx',4,'K2:K49');
tdata3=iddata(ty3,tu3,1/1000);

tu4=xlsread('PTa.xlsx',4,'N2:N49');
ty4=xlsread('PTa.xlsx',4,'O2:O49');
tdata4=iddata(ty4,tu4,1/1000);

tu5=xlsread('PTa.xlsx',4,'R2:R49');
ty5=xlsread('PTa.xlsx',4,'S2:S49');
tdata5=iddata(ty5,tu5,1/1000);

%5 minute ECG
tuu=xlsread('PTa.xlsx',5,'A2:A241');
tyy=xlsread('PTa.xlsx',5,'B2:B241');
tdataa=iddata(tyy,tuu,1/1000);


%ARX Models
for i=1:15
    tmodel1(1,1,i)=arx(tdata1,[i i 0]);
    [y,fit,x0]=compare(tdata1,tmodel1(1,1,i));
    ty1p(:,:,i)=y.y;
    tfit1(i)=fit;
    tmse1(i)=immse(ty1p(:,:,i),ty1);
    
    tmodel2(1,1,i)=arx(tdata2,[i i 0]);
    [y,fit,x0]=compare(tdata2,tmodel2(1,1,i));
    ty2p(:,:,i)=y.y;
    tfit2(i)=fit;
    tmse2(i)=immse(ty2p(:,:,i),ty2);
    
    tmodel3(1,1,i)=arx(tdata3,[i i 0]);
    [y,fit,x0]=compare(tdata3,tmodel3(1,1,i));
    ty3p(:,:,i)=y.y;
    tfit3(i)=fit;
    tmse3(i)=immse(ty3p(:,:,i),ty3);
    
    tmodel4(1,1,i)=arx(tdata4,[i i 0]);
    [y,fit,x0]=compare(tdata4,tmodel4(1,1,i));
    ty4p(:,:,i)=y.y;
    tfit4(i)=fit;
    tmse4(i)=immse(ty4p(:,:,i),ty4);
    
    tmodel5(1,1,i)=arx(tdata5,[i i 0]);
    [y,fit,x0]=compare(tdata5,tmodel5(1,1,i));
    ty5p(:,:,i)=y.y;
    tfit5(i)=fit;
    tmse5(i)=immse(ty5p(:,:,i),ty5);
    
    
    
    nmodel1(1,1,i)=arx(ndata1,[i i 0]);
    [y,fit,x0]=compare(ndata1,nmodel1(1,1,i));
    ny1p(:,:,i)=y.y;
    nfit1(i)=fit;
    nmse1(i)=immse(ny1p(:,:,i),ny1);
    
    nmodel2(1,1,i)=arx(ndata2,[i i 0]);
    [y,fit,x0]=compare(ndata2,nmodel2(1,1,i));
    ny2p(:,:,i)=y.y;
    nfit2(i)=fit;
    nmse2(i)=immse(ny2p(:,:,i),ny2);
    
    nmodel3(1,1,i)=arx(ndata3,[i i 0]);
    [y,fit,x0]=compare(ndata3,nmodel3(1,1,i));
    ny3p(:,:,i)=y.y;
    nfit3(i)=fit;
    nmse3(i)=immse(ny3p(:,:,i),ny3);
    
    nmodel4(1,1,i)=arx(ndata4,[i i 0]);
    [y,fit,x0]=compare(ndata4,nmodel4(1,1,i));
    ny4p(:,:,i)=y.y;
    nfit4(i)=fit;
    nmse4(i)=immse(ny4p(:,:,i),ny4);
    
    nmodel5(1,1,i)=arx(ndata5,[i i 0]);
    [y,fit,x0]=compare(ndata5,nmodel5(1,1,i));
    ny5p(:,:,i)=y.y;
    nfit5(i)=fit;
    nmse5(i)=immse(ny5p(:,:,i),ny5);
end

%Plots

figure(1)
x=linspace(1,15,15);
plot(x,nmse4,'-s');
xlabel('Order');
ylabel('Mean Square Error (MSE)');
title('NSR Subjects');

figure(2)
x=linspace(1,15,15);
plot(x,tmse1,'-s');
xlabel('Order');
ylabel('Mean Square Error (MSE)');
title('AT Subjects');

figure(3)
x=linspace(1,48,48);
plot(x,ny4,'-s',x,ny4p(:,:,6),'-+');
legend('PTaI','Predicted PTaI');
xlabel('No. of beats');
ylabel('PTaI and Predicted PTaI');
title('NSR Subjects, Order= 6');

figure(4)
x=linspace(1,48,48);
plot(x,ny4,'-s',x,ny4p(:,:,15),'-+');
legend('PTaI','Predicted PTaI');
xlabel('No. of beats');
ylabel('PTaI and Predicted PTaI');
title('NSR Subjects, Order= 15');

figure(5)
x=linspace(1,48,48);
plot(x,ty1,'-s',x,ty1p(:,:,6),'-+');
legend('PTaI','Predicted PTaI');
xlabel('No. of beats');
ylabel('PTaI and Predicted PTaI');
title('AT Subjects, Order= 6');

figure(6)
x=linspace(1,48,48);
plot(x,ty1,'-s',x,ty1p(:,:,14),'-+');
legend('PTaI','Predicted PTaI');
xlabel('No. of beats');
ylabel('PTaI and Predicted PTaI');
title('AT Subjects, Order= 14');