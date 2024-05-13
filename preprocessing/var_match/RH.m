clear
clc

%导入数据
data_max=csvread("2002_2018panel_max_365.csv");
data_ld=csvread("2002_2018panel_ld_365.csv");

tmax=data_max(:,6:370);
tld=data_ld(:,6:370);


%计算相对湿度
RH=exp((17.625.*tld)./(234.04+tld))./exp((17.625.*tmax)./(234.04+tmax)).*100;
RH=mean(RH,2);


