clear
clc

folder_path = 'C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\data\CDHW_index_yearly';

frequency_ssp126_info = dir(fullfile(folder_path, '*frequency_92_twsa_3_ssp126.nc'));
frequency_ssp126_names = {frequency_ssp126_info.name};
frequency_ssp126_paths = fullfile(folder_path, frequency_ssp126_names);
frequency_ssp370_info = dir(fullfile(folder_path, '*frequency_92_twsa_3_ssp370.nc'));
frequency_ssp370_names = {frequency_ssp370_info.name};
frequency_ssp370_paths = fullfile(folder_path, frequency_ssp370_names);
frequency_ssp585_info = dir(fullfile(folder_path, '*frequency_92_twsa_3_ssp585.nc'));
frequency_ssp585_names = {frequency_ssp585_info.name};
frequency_ssp585_paths = fullfile(folder_path, frequency_ssp585_names);
clear frequency_ssp126_info frequency_ssp126_names frequency_ssp370_info frequency_ssp370_names frequency_ssp585_info frequency_ssp585_names

duration_ssp126_info = dir(fullfile(folder_path, '*duration_92_twsa_3_ssp126.nc'));
duration_ssp126_names = {duration_ssp126_info.name};
duration_ssp126_paths = fullfile(folder_path, duration_ssp126_names);
duration_ssp370_info = dir(fullfile(folder_path, '*duration_92_twsa_3_ssp370.nc'));
duration_ssp370_names = {duration_ssp370_info.name};
duration_ssp370_paths = fullfile(folder_path, duration_ssp370_names);
duration_ssp585_info = dir(fullfile(folder_path, '*duration_92_twsa_3_ssp585.nc'));
duration_ssp585_names = {duration_ssp585_info.name};
duration_ssp585_paths = fullfile(folder_path, duration_ssp585_names);
clear duration_ssp126_info duration_ssp126_names duration_ssp370_info duration_ssp370_names duration_ssp585_info duration_ssp585_names

severity_ssp126_info = dir(fullfile(folder_path, '*severity_92_twsa_3_ssp126.nc'));
severity_ssp126_names = {severity_ssp126_info.name};
severity_ssp126_paths = fullfile(folder_path, severity_ssp126_names);
severity_ssp370_info = dir(fullfile(folder_path, '*severity_92_twsa_3_ssp370.nc'));
severity_ssp370_names = {severity_ssp370_info.name};
severity_ssp370_paths = fullfile(folder_path, severity_ssp370_names);
severity_ssp585_info = dir(fullfile(folder_path, '*severity_92_twsa_3_ssp585.nc'));
severity_ssp585_names = {severity_ssp585_info.name};
severity_ssp585_paths = fullfile(folder_path, severity_ssp585_names);
clear severity_ssp126_info severity_ssp126_names severity_ssp370_info severity_ssp370_names severity_ssp585_info severity_ssp585_names
clear folder_path 

pop_path_2014="C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\data\ssp_pop\pop_2014.nc";
pop_path_2050_126="C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\data\ssp_pop\ssp1_2050.nc";
pop_path_2100_126="C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\data\ssp_pop\ssp1_2100.nc";
pop_path_2050_370="C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\data\ssp_pop\ssp3_2050.nc";
pop_path_2100_370="C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\data\ssp_pop\ssp3_2100.nc";
pop_path_2050_585="C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\data\ssp_pop\ssp5_2050.nc";
pop_path_2100_585="C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\data\ssp_pop\ssp5_2100.nc";


sspage_path="C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\data\pop_age.xlsx";
mortality_path="C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\data\mortality.xlsx";


sspage=xlsread(sspage_path);
ssp_age(1,1:14)=sspage(30:43,3)';
ssp_age(2,1:14)=sspage(30:43,9)';
ssp_age(3,1:14)=sspage(30:43,19)';
ssp_age(4,1:14)=sspage(2:15,9)';
ssp_age(5,1:14)=sspage(2:15,19)';
ssp_age(6,1:14)=sspage(16:29,9)';
ssp_age(7,1:14)=sspage(16:29,19)';
clear sspage_path sspage

mortality=xlsread(mortality_path);
ssp_mortality(1,1:14)=mortality(2:15,4)';
ssp_mortality(2,1:14)=mortality(2:15,5)';
ssp_mortality(3,1:14)=mortality(2:15,6)';
ssp_mortality(4,1:14)=mortality(16:29,5)';
ssp_mortality(5,1:14)=mortality(16:29,6)';
ssp_mortality(6,1:14)=mortality(30:43,5)';
ssp_mortality(7,1:14)=mortality(30:43,6)';
ssp_mortality=ssp_mortality./1000;
clear mortality_path mortality



pop_2014=ncread(pop_path_2014, '2014');
pop_2050_126=ncread(pop_path_2050_126, 'ssp1_2050');
pop_2100_126=ncread(pop_path_2100_126, 'ssp1_2100');
pop_2050_370=ncread(pop_path_2050_370, 'ssp3_2050');
pop_2100_370=ncread(pop_path_2100_370, 'ssp3_2100');
pop_2050_585=ncread(pop_path_2050_585, 'ssp5_2050');
pop_2100_585=ncread(pop_path_2100_585, 'ssp5_2100');

pop_2014(pop_2014>2000000000)=0;
pop_2050_126(pop_2050_126>2000000000)=0;
pop_2100_126(pop_2100_126>2000000000)=0;
pop_2050_370(pop_2050_370>2000000000)=0;
pop_2100_370(pop_2100_370>2000000000)=0;
pop_2050_585(pop_2050_585>2000000000)=0;
pop_2100_585(pop_2100_585>2000000000)=0;


ssppop_2014=zeros(126,102);
ssppop_2050_126=zeros(126,102);
ssppop_2100_126=zeros(126,102);
ssppop_2050_370=zeros(126,102);
ssppop_2100_370=zeros(126,102);
ssppop_2050_585=zeros(126,102);
ssppop_2100_585=zeros(126,102);



for i=1:126
    for j=1:102
        ssppop_2014(i,j)=sum(sum(pop_2014(1+(i-1)*4:i*4,1+(j-1)*4:j*4)));
        ssppop_2050_126(i,j)=sum(sum(pop_2050_126(1+(i-1)*4:i*4,1+(j-1)*4:j*4)));
        ssppop_2100_126(i,j)=sum(sum(pop_2100_126(1+(i-1)*4:i*4,1+(j-1)*4:j*4)));
        ssppop_2050_370(i,j)=sum(sum(pop_2050_370(1+(i-1)*4:i*4,1+(j-1)*4:j*4)));
        ssppop_2100_370(i,j)=sum(sum(pop_2100_370(1+(i-1)*4:i*4,1+(j-1)*4:j*4)));
        ssppop_2050_585(i,j)=sum(sum(pop_2050_585(1+(i-1)*4:i*4,1+(j-1)*4:j*4)));
        ssppop_2100_585(i,j)=sum(sum(pop_2100_585(1+(i-1)*4:i*4,1+(j-1)*4:j*4)));
    end
end


clear pop_path_2014 pop_path_2050_126 pop_path_2100_126 pop_path_2050_370 pop_path_2100_370 pop_path_2050_585 pop_path_2100_585 
clear pop_2014 pop_2050_126 pop_2100_126 pop_2050_370 pop_2100_370 pop_2050_585 pop_2100_585 i j

 
frequency_126=zeros(126,102,160);
duration_126=zeros(126,102,160);
severity_126=zeros(126,102,160);
frequency_370=zeros(126,102,160);
duration_370=zeros(126,102,160);
severity_370=zeros(126,102,160);
frequency_585=zeros(126,102,160);
duration_585=zeros(126,102,160);
severity_585=zeros(126,102,160);




for i=1:10
    temp=ncread(frequency_ssp126_paths{i}, 'tws');
    frequency_126=frequency_126+temp;
    clear temp
end
frequency_126=frequency_126./10;

for i=1:10
    temp=ncread(duration_ssp126_paths{i}, 'tws');
    duration_126=duration_126+temp;
    clear temp
end
duration_126=duration_126./10;

for i=1:10
    temp=ncread(severity_ssp126_paths{i}, 'tws');
    severity_126=severity_126+temp;
    clear temp
end
severity_126=severity_126./10;

for i=1:10
    temp=ncread(frequency_ssp370_paths{i}, 'tws');
    frequency_370=frequency_370+temp;
    clear temp
end
frequency_370=frequency_370./10;

for i=1:10
    temp=ncread(duration_ssp370_paths{i}, 'tws');
    duration_370=duration_370+temp;
    clear temp
end
duration_370=duration_370./10;

for i=1:10
    temp=ncread(severity_ssp370_paths{i}, 'tws');
    severity_370=severity_370+temp;
    clear temp
end
severity_370=severity_370./10;

for i=1:10
    temp=ncread(frequency_ssp585_paths{i}, 'tws');
    frequency_585=frequency_585+temp;
    clear temp
end
frequency_585=frequency_585./10;

for i=1:10
    temp=ncread(duration_ssp585_paths{i}, 'tws');
    duration_585=duration_585+temp;
    clear temp
end
duration_585=duration_585./10;

for i=1:10
    temp=ncread(severity_ssp585_paths{i}, 'tws');
    severity_585=severity_585+temp;
    clear temp
end
severity_585=severity_585./10;

clear frequency_ssp126_paths duration_ssp126_paths severity_ssp126_paths
clear frequency_ssp370_paths duration_ssp370_paths severity_ssp370_paths
clear frequency_ssp585_paths duration_ssp585_paths severity_ssp585_paths

frequency_2014=mean(frequency_126(:,:,81:90),3);
frequency_2050_126=mean(frequency_126(:,:,111:120),3);
frequency_2100_126=mean(frequency_126(:,:,151:160),3);
frequency_2050_370=mean(frequency_370(:,:,111:120),3);
frequency_2100_370=mean(frequency_370(:,:,151:160),3);
frequency_2050_585=mean(frequency_585(:,:,111:120),3);
frequency_2100_585=mean(frequency_585(:,:,151:160),3);

duration_2014=mean(duration_126(:,:,81:90),3);
duration_2050_126=mean(duration_126(:,:,111:120),3);
duration_2100_126=mean(duration_126(:,:,151:160),3);
duration_2050_370=mean(duration_370(:,:,111:120),3);
duration_2100_370=mean(duration_370(:,:,151:160),3);
duration_2050_585=mean(duration_585(:,:,111:120),3);
duration_2100_585=mean(duration_585(:,:,151:160),3);

severity_2014=mean(severity_126(:,:,81:90),3);
severity_2050_126=mean(severity_126(:,:,111:120),3);
severity_2100_126=mean(severity_126(:,:,151:160),3);
severity_2050_370=mean(severity_370(:,:,111:120),3);
severity_2100_370=mean(severity_370(:,:,151:160),3);
severity_2050_585=mean(severity_585(:,:,111:120),3);
severity_2100_585=mean(severity_585(:,:,151:160),3);

clear CDHW_frequency_path_126 CDHW_duration_path_126 CDHW_severity_path_126 CDHW_frequency_path_370 CDHW_duration_path_370 
clear CDHW_severity_path_370 CDHW_frequency_path_585 CDHW_duration_path_585 CDHW_severity_path_585
clear frequency_126 duration_126 severity_126 frequency_370 duration_370 severity_370 frequency_585 duration_585 severity_585



fpop_2014_65=ssppop_2014.*ssp_age(1,1);
fpop_2014_70=ssppop_2014.*ssp_age(1,2);
fpop_2014_75=ssppop_2014.*ssp_age(1,3);
fpop_2014_80=ssppop_2014.*ssp_age(1,4);
fpop_2014_85=ssppop_2014.*ssp_age(1,5);
fpop_2014_90=ssppop_2014.*ssp_age(1,6);
fpop_2014_95=ssppop_2014.*ssp_age(1,7);
mpop_2014_65=ssppop_2014.*ssp_age(1,8);
mpop_2014_70=ssppop_2014.*ssp_age(1,9);
mpop_2014_75=ssppop_2014.*ssp_age(1,10);
mpop_2014_80=ssppop_2014.*ssp_age(1,11);
mpop_2014_85=ssppop_2014.*ssp_age(1,12);
mpop_2014_90=ssppop_2014.*ssp_age(1,13);
mpop_2014_95=ssppop_2014.*ssp_age(1,14);




fpop_2050_65_126=ssppop_2050_126.*ssp_age(2,1);
fpop_2050_70_126=ssppop_2050_126.*ssp_age(2,2);
fpop_2050_75_126=ssppop_2050_126.*ssp_age(2,3);
fpop_2050_80_126=ssppop_2050_126.*ssp_age(2,4);
fpop_2050_85_126=ssppop_2050_126.*ssp_age(2,5);
fpop_2050_90_126=ssppop_2050_126.*ssp_age(2,6);
fpop_2050_95_126=ssppop_2050_126.*ssp_age(2,7);
mpop_2050_65_126=ssppop_2050_126.*ssp_age(2,8);
mpop_2050_70_126=ssppop_2050_126.*ssp_age(2,9);
mpop_2050_75_126=ssppop_2050_126.*ssp_age(2,10);
mpop_2050_80_126=ssppop_2050_126.*ssp_age(2,11);
mpop_2050_85_126=ssppop_2050_126.*ssp_age(2,12);
mpop_2050_90_126=ssppop_2050_126.*ssp_age(2,13);
mpop_2050_95_126=ssppop_2050_126.*ssp_age(2,14);

fpop_2100_65_126=ssppop_2100_126.*ssp_age(3,1);
fpop_2100_70_126=ssppop_2100_126.*ssp_age(3,2);
fpop_2100_75_126=ssppop_2100_126.*ssp_age(3,3);
fpop_2100_80_126=ssppop_2100_126.*ssp_age(3,4);
fpop_2100_85_126=ssppop_2100_126.*ssp_age(3,5);
fpop_2100_90_126=ssppop_2100_126.*ssp_age(3,6);
fpop_2100_95_126=ssppop_2100_126.*ssp_age(3,7);
mpop_2100_65_126=ssppop_2100_126.*ssp_age(3,8);
mpop_2100_70_126=ssppop_2100_126.*ssp_age(3,9);
mpop_2100_75_126=ssppop_2100_126.*ssp_age(3,10);
mpop_2100_80_126=ssppop_2100_126.*ssp_age(3,11);
mpop_2100_85_126=ssppop_2100_126.*ssp_age(3,12);
mpop_2100_90_126=ssppop_2100_126.*ssp_age(3,13);
mpop_2100_95_126=ssppop_2100_126.*ssp_age(3,14);

fpop_2050_65_370=ssppop_2050_370.*ssp_age(4,1);
fpop_2050_70_370=ssppop_2050_370.*ssp_age(4,2);
fpop_2050_75_370=ssppop_2050_370.*ssp_age(4,3);
fpop_2050_80_370=ssppop_2050_370.*ssp_age(4,4);
fpop_2050_85_370=ssppop_2050_370.*ssp_age(4,5);
fpop_2050_90_370=ssppop_2050_370.*ssp_age(4,6);
fpop_2050_95_370=ssppop_2050_370.*ssp_age(4,7);
mpop_2050_65_370=ssppop_2050_370.*ssp_age(4,8);
mpop_2050_70_370=ssppop_2050_370.*ssp_age(4,9);
mpop_2050_75_370=ssppop_2050_370.*ssp_age(4,10);
mpop_2050_80_370=ssppop_2050_370.*ssp_age(4,11);
mpop_2050_85_370=ssppop_2050_370.*ssp_age(4,12);
mpop_2050_90_370=ssppop_2050_370.*ssp_age(4,13);
mpop_2050_95_370=ssppop_2050_370.*ssp_age(4,14);

fpop_2100_65_370=ssppop_2100_370.*ssp_age(5,1);
fpop_2100_70_370=ssppop_2100_370.*ssp_age(5,2);
fpop_2100_75_370=ssppop_2100_370.*ssp_age(5,3);
fpop_2100_80_370=ssppop_2100_370.*ssp_age(5,4);
fpop_2100_85_370=ssppop_2100_370.*ssp_age(5,5);
fpop_2100_90_370=ssppop_2100_370.*ssp_age(5,6);
fpop_2100_95_370=ssppop_2100_370.*ssp_age(5,7);
mpop_2100_65_370=ssppop_2100_370.*ssp_age(5,8);
mpop_2100_70_370=ssppop_2100_370.*ssp_age(5,9);
mpop_2100_75_370=ssppop_2100_370.*ssp_age(5,10);
mpop_2100_80_370=ssppop_2100_370.*ssp_age(5,11);
mpop_2100_85_370=ssppop_2100_370.*ssp_age(5,12);
mpop_2100_90_370=ssppop_2100_370.*ssp_age(5,13);
mpop_2100_95_370=ssppop_2100_370.*ssp_age(5,14);


fpop_2050_65_585=ssppop_2050_585.*ssp_age(6,1);
fpop_2050_70_585=ssppop_2050_585.*ssp_age(6,2);
fpop_2050_75_585=ssppop_2050_585.*ssp_age(6,3);
fpop_2050_80_585=ssppop_2050_585.*ssp_age(6,4);
fpop_2050_85_585=ssppop_2050_585.*ssp_age(6,5);
fpop_2050_90_585=ssppop_2050_585.*ssp_age(6,6);
fpop_2050_95_585=ssppop_2050_585.*ssp_age(6,7);
mpop_2050_65_585=ssppop_2050_585.*ssp_age(6,8);
mpop_2050_70_585=ssppop_2050_585.*ssp_age(6,9);
mpop_2050_75_585=ssppop_2050_585.*ssp_age(6,10);
mpop_2050_80_585=ssppop_2050_585.*ssp_age(6,11);
mpop_2050_85_585=ssppop_2050_585.*ssp_age(6,12);
mpop_2050_90_585=ssppop_2050_585.*ssp_age(6,13);
mpop_2050_95_585=ssppop_2050_585.*ssp_age(6,14);

fpop_2100_65_585=ssppop_2100_585.*ssp_age(7,1);
fpop_2100_70_585=ssppop_2100_585.*ssp_age(7,2);
fpop_2100_75_585=ssppop_2100_585.*ssp_age(7,3);
fpop_2100_80_585=ssppop_2100_585.*ssp_age(7,4);
fpop_2100_85_585=ssppop_2100_585.*ssp_age(7,5);
fpop_2100_90_585=ssppop_2100_585.*ssp_age(7,6);
fpop_2100_95_585=ssppop_2100_585.*ssp_age(7,7);
mpop_2100_65_585=ssppop_2100_585.*ssp_age(7,8);
mpop_2100_70_585=ssppop_2100_585.*ssp_age(7,9);
mpop_2100_75_585=ssppop_2100_585.*ssp_age(7,10);
mpop_2100_80_585=ssppop_2100_585.*ssp_age(7,11);
mpop_2100_85_585=ssppop_2100_585.*ssp_age(7,12);
mpop_2100_90_585=ssppop_2100_585.*ssp_age(7,13);
mpop_2100_95_585=ssppop_2100_585.*ssp_age(7,14);

clear ssppop_2014 ssppop_2050_126 ssppop_2100_126 ssppop_2050_370 ssppop_2100_370 ssppop_2050_585 ssppop_2100_585 ssp_age

AF_frequency_2014=(1.054244.^frequency_2014-1)./(1.054244.^frequency_2014);
AF_frequency_2050_126=(1.054244.^frequency_2050_126-1)./(1.054244.^frequency_2050_126);
AF_frequency_2100_126=(1.054244.^frequency_2100_126-1)./(1.054244.^frequency_2100_126);
AF_frequency_2050_370=(1.054244.^frequency_2050_370-1)./(1.054244.^frequency_2050_370);
AF_frequency_2100_370=(1.054244.^frequency_2100_370-1)./(1.054244.^frequency_2100_370);
AF_frequency_2050_585=(1.054244.^frequency_2050_585-1)./(1.054244.^frequency_2050_585);
AF_frequency_2100_585=(1.054244.^frequency_2100_585-1)./(1.054244.^frequency_2100_585);

AFF_duration_2014=(1.015904.^duration_2014-1)./(1.015904.^duration_2014);
AFF_duration_2050_126=(1.015904.^duration_2050_126-1)./(1.015904.^duration_2050_126);
AFF_duration_2100_126=(1.015904.^duration_2100_126-1)./(1.015904.^duration_2100_126);
AFF_duration_2050_370=(1.015904.^duration_2050_370-1)./(1.015904.^duration_2050_370);
AFF_duration_2100_370=(1.015904.^duration_2100_370-1)./(1.015904.^duration_2100_370);
AFF_duration_2050_585=(1.015904.^duration_2050_585-1)./(1.015904.^duration_2050_585);
AFF_duration_2100_585=(1.015904.^duration_2100_585-1)./(1.015904.^duration_2100_585);

AFM_duration_2014=(1.009301.^duration_2014-1)./(1.009301.^duration_2014);
AFM_duration_2050_126=(1.009301.^duration_2050_126-1)./(1.009301.^duration_2050_126);
AFM_duration_2100_126=(1.009301.^duration_2100_126-1)./(1.009301.^duration_2100_126);
AFM_duration_2050_370=(1.009301.^duration_2050_370-1)./(1.009301.^duration_2050_370);
AFM_duration_2100_370=(1.009301.^duration_2100_370-1)./(1.009301.^duration_2100_370);
AFM_duration_2050_585=(1.009301.^duration_2050_585-1)./(1.009301.^duration_2050_585);
AFM_duration_2100_585=(1.009301.^duration_2100_585-1)./(1.009301.^duration_2100_585);

AFF_severity_2014=(1.01829.^severity_2014-1)./(1.01829.^severity_2014);
AFF_severity_2050_126=(1.01829.^severity_2050_126-1)./(1.01829.^severity_2050_126);
AFF_severity_2100_126=(1.01829.^severity_2100_126-1)./(1.01829.^severity_2100_126);
AFF_severity_2050_370=(1.01829.^severity_2050_370-1)./(1.01829.^severity_2050_370);
AFF_severity_2100_370=(1.01829.^severity_2100_370-1)./(1.01829.^severity_2100_370);
AFF_severity_2050_585=(1.01829.^severity_2050_585-1)./(1.01829.^severity_2050_585);
AFF_severity_2100_585=(1.01829.^severity_2100_585-1)./(1.01829.^severity_2100_585);

AFM_severity_2014=(1.009018.^severity_2014-1)./(1.009018.^severity_2014);
AFM_severity_2050_126=(1.009018.^severity_2050_126-1)./(1.009018.^severity_2050_126);
AFM_severity_2100_126=(1.009018.^severity_2100_126-1)./(1.009018.^severity_2100_126);
AFM_severity_2050_370=(1.009018.^severity_2050_370-1)./(1.009018.^severity_2050_370);
AFM_severity_2100_370=(1.009018.^severity_2100_370-1)./(1.009018.^severity_2100_370);
AFM_severity_2050_585=(1.009018.^severity_2050_585-1)./(1.009018.^severity_2050_585);
AFM_severity_2100_585=(1.009018.^severity_2100_585-1)./(1.009018.^severity_2100_585);


clear frequency_2014 frequency_2050_126 frequency_2100_126 frequency_2050_370 frequency_2100_370 frequency_2050_585 frequency_2100_585
clear duration_2014 duration_2050_126 duration_2100_126 duration_2050_370 duration_2100_370 duration_2050_585 duration_2100_585
clear severity_2014 severity_2050_126 severity_2100_126 severity_2050_370 severity_2100_370 severity_2050_585 severity_2100_585

N_frequency_2014=fpop_2014_65.*ssp_mortality(1,1).*AF_frequency_2014+fpop_2014_70.*ssp_mortality(1,2).*AF_frequency_2014+...
                 fpop_2014_75.*ssp_mortality(1,3).*AF_frequency_2014+fpop_2014_80.*ssp_mortality(1,4).*AF_frequency_2014+...
                 fpop_2014_85.*ssp_mortality(1,5).*AF_frequency_2014+fpop_2014_90.*ssp_mortality(1,6).*AF_frequency_2014+...
                 fpop_2014_95.*ssp_mortality(1,7).*AF_frequency_2014+mpop_2014_65.*ssp_mortality(1,8).*AF_frequency_2014+...
                 mpop_2014_70.*ssp_mortality(1,9).*AF_frequency_2014+mpop_2014_75.*ssp_mortality(1,10).*AF_frequency_2014+...
                 mpop_2014_80.*ssp_mortality(1,11).*AF_frequency_2014+mpop_2014_85.*ssp_mortality(1,12).*AF_frequency_2014+...
                 mpop_2014_90.*ssp_mortality(1,13).*AF_frequency_2014+mpop_2014_95.*ssp_mortality(1,14).*AF_frequency_2014;

N_frequency_2050_126=fpop_2050_65_126.*ssp_mortality(2,1).*AF_frequency_2050_126+fpop_2050_70_126.*ssp_mortality(2,2).*AF_frequency_2050_126+...
                     fpop_2050_75_126.*ssp_mortality(2,3).*AF_frequency_2050_126+fpop_2050_80_126.*ssp_mortality(2,4).*AF_frequency_2050_126+...
                     fpop_2050_85_126.*ssp_mortality(2,5).*AF_frequency_2050_126+fpop_2050_90_126.*ssp_mortality(2,6).*AF_frequency_2050_126+...
                     fpop_2050_95_126.*ssp_mortality(2,7).*AF_frequency_2050_126+mpop_2050_65_126.*ssp_mortality(2,8).*AF_frequency_2050_126+...
                     mpop_2050_70_126.*ssp_mortality(2,9).*AF_frequency_2050_126+mpop_2050_75_126.*ssp_mortality(2,10).*AF_frequency_2050_126+...
                     mpop_2050_80_126.*ssp_mortality(2,11).*AF_frequency_2050_126+mpop_2050_85_126.*ssp_mortality(2,12).*AF_frequency_2050_126+...
                     mpop_2050_90_126.*ssp_mortality(2,13).*AF_frequency_2050_126+mpop_2050_95_126.*ssp_mortality(2,14).*AF_frequency_2050_126;

N_frequency_2100_126=fpop_2100_65_126.*ssp_mortality(3,1).*AF_frequency_2100_126+fpop_2100_70_126.*ssp_mortality(3,2).*AF_frequency_2100_126+...
                     fpop_2100_75_126.*ssp_mortality(3,3).*AF_frequency_2100_126+fpop_2100_80_126.*ssp_mortality(3,4).*AF_frequency_2100_126+...
                     fpop_2100_85_126.*ssp_mortality(3,5).*AF_frequency_2100_126+fpop_2100_90_126.*ssp_mortality(3,6).*AF_frequency_2100_126+...
                     fpop_2100_95_126.*ssp_mortality(3,7).*AF_frequency_2100_126+mpop_2100_65_126.*ssp_mortality(3,8).*AF_frequency_2100_126+...
                     mpop_2100_70_126.*ssp_mortality(3,9).*AF_frequency_2100_126+mpop_2100_75_126.*ssp_mortality(3,10).*AF_frequency_2100_126+...
                     mpop_2100_80_126.*ssp_mortality(3,11).*AF_frequency_2100_126+mpop_2100_85_126.*ssp_mortality(3,12).*AF_frequency_2100_126+...
                     mpop_2100_90_126.*ssp_mortality(3,13).*AF_frequency_2100_126+mpop_2100_95_126.*ssp_mortality(3,14).*AF_frequency_2100_126;

N_frequency_2050_370=fpop_2050_65_370.*ssp_mortality(4,1).*AF_frequency_2050_370+fpop_2050_70_370.*ssp_mortality(4,2).*AF_frequency_2050_370+...
                     fpop_2050_75_370.*ssp_mortality(4,3).*AF_frequency_2050_370+fpop_2050_80_370.*ssp_mortality(4,4).*AF_frequency_2050_370+...
                     fpop_2050_85_370.*ssp_mortality(4,5).*AF_frequency_2050_370+fpop_2050_90_370.*ssp_mortality(4,6).*AF_frequency_2050_370+...
                     fpop_2050_95_370.*ssp_mortality(4,7).*AF_frequency_2050_370+mpop_2050_65_370.*ssp_mortality(4,8).*AF_frequency_2050_370+...
                     mpop_2050_70_370.*ssp_mortality(4,9).*AF_frequency_2050_370+mpop_2050_75_370.*ssp_mortality(4,10).*AF_frequency_2050_370+...
                     mpop_2050_80_370.*ssp_mortality(4,11).*AF_frequency_2050_370+mpop_2050_85_370.*ssp_mortality(4,12).*AF_frequency_2050_370+...
                     mpop_2050_90_370.*ssp_mortality(4,13).*AF_frequency_2050_370+mpop_2050_95_370.*ssp_mortality(4,14).*AF_frequency_2050_370;

N_frequency_2100_370=fpop_2100_65_370.*ssp_mortality(5,1).*AF_frequency_2100_370+fpop_2100_70_370.*ssp_mortality(5,2).*AF_frequency_2100_370+...
                     fpop_2100_75_370.*ssp_mortality(5,3).*AF_frequency_2100_370+fpop_2100_80_370.*ssp_mortality(5,4).*AF_frequency_2100_370+...
                     fpop_2100_85_370.*ssp_mortality(5,5).*AF_frequency_2100_370+fpop_2100_90_370.*ssp_mortality(5,6).*AF_frequency_2100_370+...
                     fpop_2100_95_370.*ssp_mortality(5,7).*AF_frequency_2100_370+mpop_2100_65_370.*ssp_mortality(5,8).*AF_frequency_2100_370+...
                     mpop_2100_70_370.*ssp_mortality(5,9).*AF_frequency_2100_370+mpop_2100_75_370.*ssp_mortality(5,10).*AF_frequency_2100_370+...
                     mpop_2100_80_370.*ssp_mortality(5,11).*AF_frequency_2100_370+mpop_2100_85_370.*ssp_mortality(5,12).*AF_frequency_2100_370+...
                     mpop_2100_90_370.*ssp_mortality(5,13).*AF_frequency_2100_370+mpop_2100_95_370.*ssp_mortality(5,14).*AF_frequency_2100_370;

N_frequency_2050_585=fpop_2050_65_585.*ssp_mortality(6,1).*AF_frequency_2050_585+fpop_2050_70_585.*ssp_mortality(6,2).*AF_frequency_2050_585+...
                     fpop_2050_75_585.*ssp_mortality(6,3).*AF_frequency_2050_585+fpop_2050_80_585.*ssp_mortality(6,4).*AF_frequency_2050_585+...
                     fpop_2050_85_585.*ssp_mortality(6,5).*AF_frequency_2050_585+fpop_2050_90_585.*ssp_mortality(6,6).*AF_frequency_2050_585+...
                     fpop_2050_95_585.*ssp_mortality(6,7).*AF_frequency_2050_585+mpop_2050_65_585.*ssp_mortality(6,8).*AF_frequency_2050_585+...
                     mpop_2050_70_585.*ssp_mortality(6,9).*AF_frequency_2050_585+mpop_2050_75_585.*ssp_mortality(6,10).*AF_frequency_2050_585+...
                     mpop_2050_80_585.*ssp_mortality(6,11).*AF_frequency_2050_585+mpop_2050_85_585.*ssp_mortality(6,12).*AF_frequency_2050_585+...
                     mpop_2050_90_585.*ssp_mortality(6,13).*AF_frequency_2050_585+mpop_2050_95_585.*ssp_mortality(6,14).*AF_frequency_2050_585;

N_frequency_2100_585=fpop_2100_65_585.*ssp_mortality(7,1).*AF_frequency_2100_585+fpop_2100_70_585.*ssp_mortality(7,2).*AF_frequency_2100_585+...
                     fpop_2100_75_585.*ssp_mortality(7,3).*AF_frequency_2100_585+fpop_2100_80_585.*ssp_mortality(7,4).*AF_frequency_2100_585+...
                     fpop_2100_85_585.*ssp_mortality(7,5).*AF_frequency_2100_585+fpop_2100_90_585.*ssp_mortality(7,6).*AF_frequency_2100_585+...
                     fpop_2100_95_585.*ssp_mortality(7,7).*AF_frequency_2100_585+mpop_2100_65_585.*ssp_mortality(7,8).*AF_frequency_2100_585+...
                     mpop_2100_70_585.*ssp_mortality(7,9).*AF_frequency_2100_585+mpop_2100_75_585.*ssp_mortality(7,10).*AF_frequency_2100_585+...
                     mpop_2100_80_585.*ssp_mortality(7,11).*AF_frequency_2100_585+mpop_2100_85_585.*ssp_mortality(7,12).*AF_frequency_2100_585+...
                     mpop_2100_90_585.*ssp_mortality(7,13).*AF_frequency_2100_585+mpop_2100_95_585.*ssp_mortality(7,14).*AF_frequency_2100_585;

N_duration_2014=fpop_2014_65.*ssp_mortality(1,1).*AFF_duration_2014+fpop_2014_70.*ssp_mortality(1,2).*AFF_duration_2014+...
                 fpop_2014_75.*ssp_mortality(1,3).*AFF_duration_2014+fpop_2014_80.*ssp_mortality(1,4).*AFF_duration_2014+...
                 fpop_2014_85.*ssp_mortality(1,5).*AFF_duration_2014+fpop_2014_90.*ssp_mortality(1,6).*AFF_duration_2014+...
                 fpop_2014_95.*ssp_mortality(1,7).*AFF_duration_2014+mpop_2014_65.*ssp_mortality(1,8).*AFM_duration_2014+...
                 mpop_2014_70.*ssp_mortality(1,9).*AFM_duration_2014+mpop_2014_75.*ssp_mortality(1,10).*AFM_duration_2014+...
                 mpop_2014_80.*ssp_mortality(1,11).*AFM_duration_2014+mpop_2014_85.*ssp_mortality(1,12).*AFM_duration_2014+...
                 mpop_2014_90.*ssp_mortality(1,13).*AFM_duration_2014+mpop_2014_95.*ssp_mortality(1,14).*AFM_duration_2014;

N_duration_2050_126=fpop_2050_65_126.*ssp_mortality(2,1).*AFF_duration_2050_126+fpop_2050_70_126.*ssp_mortality(2,2).*AFF_duration_2050_126+...
                     fpop_2050_75_126.*ssp_mortality(2,3).*AFF_duration_2050_126+fpop_2050_80_126.*ssp_mortality(2,4).*AFF_duration_2050_126+...
                     fpop_2050_85_126.*ssp_mortality(2,5).*AFF_duration_2050_126+fpop_2050_90_126.*ssp_mortality(2,6).*AFF_duration_2050_126+...
                     fpop_2050_95_126.*ssp_mortality(2,7).*AFF_duration_2050_126+mpop_2050_65_126.*ssp_mortality(2,8).*AFM_duration_2050_126+...
                     mpop_2050_70_126.*ssp_mortality(2,9).*AFM_duration_2050_126+mpop_2050_75_126.*ssp_mortality(2,10).*AFM_duration_2050_126+...
                     mpop_2050_80_126.*ssp_mortality(2,11).*AFM_duration_2050_126+mpop_2050_85_126.*ssp_mortality(2,12).*AFM_duration_2050_126+...
                     mpop_2050_90_126.*ssp_mortality(2,13).*AFM_duration_2050_126+mpop_2050_95_126.*ssp_mortality(2,14).*AFM_duration_2050_126;

N_duration_2100_126=fpop_2100_65_126.*ssp_mortality(3,1).*AFF_duration_2100_126+fpop_2100_70_126.*ssp_mortality(3,2).*AFF_duration_2100_126+...
                     fpop_2100_75_126.*ssp_mortality(3,3).*AFF_duration_2100_126+fpop_2100_80_126.*ssp_mortality(3,4).*AFF_duration_2100_126+...
                     fpop_2100_85_126.*ssp_mortality(3,5).*AFF_duration_2100_126+fpop_2100_90_126.*ssp_mortality(3,6).*AFF_duration_2100_126+...
                     fpop_2100_95_126.*ssp_mortality(3,7).*AFF_duration_2100_126+mpop_2100_65_126.*ssp_mortality(3,8).*AFM_duration_2100_126+...
                     mpop_2100_70_126.*ssp_mortality(3,9).*AFM_duration_2100_126+mpop_2100_75_126.*ssp_mortality(3,10).*AFM_duration_2100_126+...
                     mpop_2100_80_126.*ssp_mortality(3,11).*AFM_duration_2100_126+mpop_2100_85_126.*ssp_mortality(3,12).*AFM_duration_2100_126+...
                     mpop_2100_90_126.*ssp_mortality(3,13).*AFM_duration_2100_126+mpop_2100_95_126.*ssp_mortality(3,14).*AFM_duration_2100_126;

N_duration_2050_370=fpop_2050_65_370.*ssp_mortality(4,1).*AFF_duration_2050_370+fpop_2050_70_370.*ssp_mortality(4,2).*AFF_duration_2050_370+...
                     fpop_2050_75_370.*ssp_mortality(4,3).*AFF_duration_2050_370+fpop_2050_80_370.*ssp_mortality(4,4).*AFF_duration_2050_370+...
                     fpop_2050_85_370.*ssp_mortality(4,5).*AFF_duration_2050_370+fpop_2050_90_370.*ssp_mortality(4,6).*AFF_duration_2050_370+...
                     fpop_2050_95_370.*ssp_mortality(4,7).*AFF_duration_2050_370+mpop_2050_65_370.*ssp_mortality(4,8).*AFM_duration_2050_370+...
                     mpop_2050_70_370.*ssp_mortality(4,9).*AFM_duration_2050_370+mpop_2050_75_370.*ssp_mortality(4,10).*AFM_duration_2050_370+...
                     mpop_2050_80_370.*ssp_mortality(4,11).*AFM_duration_2050_370+mpop_2050_85_370.*ssp_mortality(4,12).*AFM_duration_2050_370+...
                     mpop_2050_90_370.*ssp_mortality(4,13).*AFM_duration_2050_370+mpop_2050_95_370.*ssp_mortality(4,14).*AFM_duration_2050_370;

N_duration_2100_370=fpop_2100_65_370.*ssp_mortality(5,1).*AFF_duration_2100_370+fpop_2100_70_370.*ssp_mortality(5,2).*AFF_duration_2100_370+...
                     fpop_2100_75_370.*ssp_mortality(5,3).*AFF_duration_2100_370+fpop_2100_80_370.*ssp_mortality(5,4).*AFF_duration_2100_370+...
                     fpop_2100_85_370.*ssp_mortality(5,5).*AFF_duration_2100_370+fpop_2100_90_370.*ssp_mortality(5,6).*AFF_duration_2100_370+...
                     fpop_2100_95_370.*ssp_mortality(5,7).*AFF_duration_2100_370+mpop_2100_65_370.*ssp_mortality(5,8).*AFM_duration_2100_370+...
                     mpop_2100_70_370.*ssp_mortality(5,9).*AFM_duration_2100_370+mpop_2100_75_370.*ssp_mortality(5,10).*AFM_duration_2100_370+...
                     mpop_2100_80_370.*ssp_mortality(5,11).*AFM_duration_2100_370+mpop_2100_85_370.*ssp_mortality(5,12).*AFM_duration_2100_370+...
                     mpop_2100_90_370.*ssp_mortality(5,13).*AFM_duration_2100_370+mpop_2100_95_370.*ssp_mortality(5,14).*AFM_duration_2100_370;

N_duration_2050_585=fpop_2050_65_585.*ssp_mortality(6,1).*AFF_duration_2050_585+fpop_2050_70_585.*ssp_mortality(6,2).*AFF_duration_2050_585+...
                     fpop_2050_75_585.*ssp_mortality(6,3).*AFF_duration_2050_585+fpop_2050_80_585.*ssp_mortality(6,4).*AFF_duration_2050_585+...
                     fpop_2050_85_585.*ssp_mortality(6,5).*AFF_duration_2050_585+fpop_2050_90_585.*ssp_mortality(6,6).*AFF_duration_2050_585+...
                     fpop_2050_95_585.*ssp_mortality(6,7).*AFF_duration_2050_585+mpop_2050_65_585.*ssp_mortality(6,8).*AFM_duration_2050_585+...
                     mpop_2050_70_585.*ssp_mortality(6,9).*AFM_duration_2050_585+mpop_2050_75_585.*ssp_mortality(6,10).*AFM_duration_2050_585+...
                     mpop_2050_80_585.*ssp_mortality(6,11).*AFM_duration_2050_585+mpop_2050_85_585.*ssp_mortality(6,12).*AFM_duration_2050_585+...
                     mpop_2050_90_585.*ssp_mortality(6,13).*AFM_duration_2050_585+mpop_2050_95_585.*ssp_mortality(6,14).*AFM_duration_2050_585;

N_duration_2100_585=fpop_2100_65_585.*ssp_mortality(7,1).*AFF_duration_2100_585+fpop_2100_70_585.*ssp_mortality(7,2).*AFF_duration_2100_585+...
                     fpop_2100_75_585.*ssp_mortality(7,3).*AFF_duration_2100_585+fpop_2100_80_585.*ssp_mortality(7,4).*AFF_duration_2100_585+...
                     fpop_2100_85_585.*ssp_mortality(7,5).*AFF_duration_2100_585+fpop_2100_90_585.*ssp_mortality(7,6).*AFF_duration_2100_585+...
                     fpop_2100_95_585.*ssp_mortality(7,7).*AFF_duration_2100_585+mpop_2100_65_585.*ssp_mortality(7,8).*AFM_duration_2100_585+...
                     mpop_2100_70_585.*ssp_mortality(7,9).*AFM_duration_2100_585+mpop_2100_75_585.*ssp_mortality(7,10).*AFM_duration_2100_585+...
                     mpop_2100_80_585.*ssp_mortality(7,11).*AFM_duration_2100_585+mpop_2100_85_585.*ssp_mortality(7,12).*AFM_duration_2100_585+...
                     mpop_2100_90_585.*ssp_mortality(7,13).*AFM_duration_2100_585+mpop_2100_95_585.*ssp_mortality(7,14).*AFM_duration_2100_585;

N_severity_2014=fpop_2014_65.*ssp_mortality(1,1).*AFF_severity_2014+fpop_2014_70.*ssp_mortality(1,2).*AFF_severity_2014+...
                 fpop_2014_75.*ssp_mortality(1,3).*AFF_severity_2014+fpop_2014_80.*ssp_mortality(1,4).*AFF_severity_2014+...
                 fpop_2014_85.*ssp_mortality(1,5).*AFF_severity_2014+fpop_2014_90.*ssp_mortality(1,6).*AFF_severity_2014+...
                 fpop_2014_95.*ssp_mortality(1,7).*AFF_severity_2014+mpop_2014_65.*ssp_mortality(1,8).*AFM_severity_2014+...
                 mpop_2014_70.*ssp_mortality(1,9).*AFM_severity_2014+mpop_2014_75.*ssp_mortality(1,10).*AFM_severity_2014+...
                 mpop_2014_80.*ssp_mortality(1,11).*AFM_severity_2014+mpop_2014_85.*ssp_mortality(1,12).*AFM_severity_2014+...
                 mpop_2014_90.*ssp_mortality(1,13).*AFM_severity_2014+mpop_2014_95.*ssp_mortality(1,14).*AFM_severity_2014;

N_severity_2050_126=fpop_2050_65_126.*ssp_mortality(2,1).*AFF_severity_2050_126+fpop_2050_70_126.*ssp_mortality(2,2).*AFF_severity_2050_126+...
                     fpop_2050_75_126.*ssp_mortality(2,3).*AFF_severity_2050_126+fpop_2050_80_126.*ssp_mortality(2,4).*AFF_severity_2050_126+...
                     fpop_2050_85_126.*ssp_mortality(2,5).*AFF_severity_2050_126+fpop_2050_90_126.*ssp_mortality(2,6).*AFF_severity_2050_126+...
                     fpop_2050_95_126.*ssp_mortality(2,7).*AFF_severity_2050_126+mpop_2050_65_126.*ssp_mortality(2,8).*AFM_severity_2050_126+...
                     mpop_2050_70_126.*ssp_mortality(2,9).*AFM_severity_2050_126+mpop_2050_75_126.*ssp_mortality(2,10).*AFM_severity_2050_126+...
                     mpop_2050_80_126.*ssp_mortality(2,11).*AFM_severity_2050_126+mpop_2050_85_126.*ssp_mortality(2,12).*AFM_severity_2050_126+...
                     mpop_2050_90_126.*ssp_mortality(2,13).*AFM_severity_2050_126+mpop_2050_95_126.*ssp_mortality(2,14).*AFM_severity_2050_126;

N_severity_2100_126=fpop_2100_65_126.*ssp_mortality(3,1).*AFF_severity_2100_126+fpop_2100_70_126.*ssp_mortality(3,2).*AFF_severity_2100_126+...
                     fpop_2100_75_126.*ssp_mortality(3,3).*AFF_severity_2100_126+fpop_2100_80_126.*ssp_mortality(3,4).*AFF_severity_2100_126+...
                     fpop_2100_85_126.*ssp_mortality(3,5).*AFF_severity_2100_126+fpop_2100_90_126.*ssp_mortality(3,6).*AFF_severity_2100_126+...
                     fpop_2100_95_126.*ssp_mortality(3,7).*AFF_severity_2100_126+mpop_2100_65_126.*ssp_mortality(3,8).*AFM_severity_2100_126+...
                     mpop_2100_70_126.*ssp_mortality(3,9).*AFM_severity_2100_126+mpop_2100_75_126.*ssp_mortality(3,10).*AFM_severity_2100_126+...
                     mpop_2100_80_126.*ssp_mortality(3,11).*AFM_severity_2100_126+mpop_2100_85_126.*ssp_mortality(3,12).*AFM_severity_2100_126+...
                     mpop_2100_90_126.*ssp_mortality(3,13).*AFM_severity_2100_126+mpop_2100_95_126.*ssp_mortality(3,14).*AFM_severity_2100_126;

N_severity_2050_370=fpop_2050_65_370.*ssp_mortality(4,1).*AFF_severity_2050_370+fpop_2050_70_370.*ssp_mortality(4,2).*AFF_severity_2050_370+...
                     fpop_2050_75_370.*ssp_mortality(4,3).*AFF_severity_2050_370+fpop_2050_80_370.*ssp_mortality(4,4).*AFF_severity_2050_370+...
                     fpop_2050_85_370.*ssp_mortality(4,5).*AFF_severity_2050_370+fpop_2050_90_370.*ssp_mortality(4,6).*AFF_severity_2050_370+...
                     fpop_2050_95_370.*ssp_mortality(4,7).*AFF_severity_2050_370+mpop_2050_65_370.*ssp_mortality(4,8).*AFM_severity_2050_370+...
                     mpop_2050_70_370.*ssp_mortality(4,9).*AFM_severity_2050_370+mpop_2050_75_370.*ssp_mortality(4,10).*AFM_severity_2050_370+...
                     mpop_2050_80_370.*ssp_mortality(4,11).*AFM_severity_2050_370+mpop_2050_85_370.*ssp_mortality(4,12).*AFM_severity_2050_370+...
                     mpop_2050_90_370.*ssp_mortality(4,13).*AFM_severity_2050_370+mpop_2050_95_370.*ssp_mortality(4,14).*AFM_severity_2050_370;

N_severity_2100_370=fpop_2100_65_370.*ssp_mortality(5,1).*AFF_severity_2100_370+fpop_2100_70_370.*ssp_mortality(5,2).*AFF_severity_2100_370+...
                     fpop_2100_75_370.*ssp_mortality(5,3).*AFF_severity_2100_370+fpop_2100_80_370.*ssp_mortality(5,4).*AFF_severity_2100_370+...
                     fpop_2100_85_370.*ssp_mortality(5,5).*AFF_severity_2100_370+fpop_2100_90_370.*ssp_mortality(5,6).*AFF_severity_2100_370+...
                     fpop_2100_95_370.*ssp_mortality(5,7).*AFF_severity_2100_370+mpop_2100_65_370.*ssp_mortality(5,8).*AFM_severity_2100_370+...
                     mpop_2100_70_370.*ssp_mortality(5,9).*AFM_severity_2100_370+mpop_2100_75_370.*ssp_mortality(5,10).*AFM_severity_2100_370+...
                     mpop_2100_80_370.*ssp_mortality(5,11).*AFM_severity_2100_370+mpop_2100_85_370.*ssp_mortality(5,12).*AFM_severity_2100_370+...
                     mpop_2100_90_370.*ssp_mortality(5,13).*AFM_severity_2100_370+mpop_2100_95_370.*ssp_mortality(5,14).*AFM_severity_2100_370;

N_severity_2050_585=fpop_2050_65_585.*ssp_mortality(6,1).*AFF_severity_2050_585+fpop_2050_70_585.*ssp_mortality(6,2).*AFF_severity_2050_585+...
                     fpop_2050_75_585.*ssp_mortality(6,3).*AFF_severity_2050_585+fpop_2050_80_585.*ssp_mortality(6,4).*AFF_severity_2050_585+...
                     fpop_2050_85_585.*ssp_mortality(6,5).*AFF_severity_2050_585+fpop_2050_90_585.*ssp_mortality(6,6).*AFF_severity_2050_585+...
                     fpop_2050_95_585.*ssp_mortality(6,7).*AFF_severity_2050_585+mpop_2050_65_585.*ssp_mortality(6,8).*AFM_severity_2050_585+...
                     mpop_2050_70_585.*ssp_mortality(6,9).*AFM_severity_2050_585+mpop_2050_75_585.*ssp_mortality(6,10).*AFM_severity_2050_585+...
                     mpop_2050_80_585.*ssp_mortality(6,11).*AFM_severity_2050_585+mpop_2050_85_585.*ssp_mortality(6,12).*AFM_severity_2050_585+...
                     mpop_2050_90_585.*ssp_mortality(6,13).*AFM_severity_2050_585+mpop_2050_95_585.*ssp_mortality(6,14).*AFM_severity_2050_585;

N_severity_2100_585=fpop_2100_65_585.*ssp_mortality(7,1).*AFF_severity_2100_585+fpop_2100_70_585.*ssp_mortality(7,2).*AFF_severity_2100_585+...
                     fpop_2100_75_585.*ssp_mortality(7,3).*AFF_severity_2100_585+fpop_2100_80_585.*ssp_mortality(7,4).*AFF_severity_2100_585+...
                     fpop_2100_85_585.*ssp_mortality(7,5).*AFF_severity_2100_585+fpop_2100_90_585.*ssp_mortality(7,6).*AFF_severity_2100_585+...
                     fpop_2100_95_585.*ssp_mortality(7,7).*AFF_severity_2100_585+mpop_2100_65_585.*ssp_mortality(7,8).*AFM_severity_2100_585+...
                     mpop_2100_70_585.*ssp_mortality(7,9).*AFM_severity_2100_585+mpop_2100_75_585.*ssp_mortality(7,10).*AFM_severity_2100_585+...
                     mpop_2100_80_585.*ssp_mortality(7,11).*AFM_severity_2100_585+mpop_2100_85_585.*ssp_mortality(7,12).*AFM_severity_2100_585+...
                     mpop_2100_90_585.*ssp_mortality(7,13).*AFM_severity_2100_585+mpop_2100_95_585.*ssp_mortality(7,14).*AFM_severity_2100_585;

clear AF_frequency_2014 AF_frequency_2050_126 AF_frequency_2100_126 AF_frequency_2050_370 AF_frequency_2100_370 AF_frequency_2050_585 AF_frequency_2100_585
clear AFF_duration_2014 AFF_duration_2050_126 AFF_duration_2100_126 AFF_duration_2050_370 AFF_duration_2100_370 AFF_duration_2050_585 AFF_duration_2100_585
clear AFM_duration_2014 AFM_duration_2050_126 AFM_duration_2100_126 AFM_duration_2050_370 AFM_duration_2100_370 AFM_duration_2050_585 AFM_duration_2100_585
clear AFF_severity_2014 AFF_severity_2050_126 AFF_severity_2100_126 AFF_severity_2050_370 AFF_severity_2100_370 AFF_severity_2050_585 AFF_severity_2100_585
clear AFM_severity_2014 AFM_severity_2050_126 AFM_severity_2100_126 AFM_severity_2050_370 AFM_severity_2100_370 AFM_severity_2050_585 AFM_severity_2100_585
clear fpop_2014_65 fpop_2014_70 fpop_2014_75 fpop_2014_80 fpop_2014_85 fpop_2014_90 fpop_2014_95
clear mpop_2014_65 mpop_2014_70 mpop_2014_75 mpop_2014_80 mpop_2014_85 mpop_2014_90 mpop_2014_95
clear fpop_2050_65_126 fpop_2050_70_126 fpop_2050_75_126 fpop_2050_80_126 fpop_2050_85_126 fpop_2050_90_126 fpop_2050_95_126
clear mpop_2050_65_126 mpop_2050_70_126 mpop_2050_75_126 mpop_2050_80_126 mpop_2050_85_126 mpop_2050_90_126 mpop_2050_95_126
clear fpop_2100_65_126 fpop_2100_70_126 fpop_2100_75_126 fpop_2100_80_126 fpop_2100_85_126 fpop_2100_90_126 fpop_2100_95_126
clear mpop_2100_65_126 mpop_2100_70_126 mpop_2100_75_126 mpop_2100_80_126 mpop_2100_85_126 mpop_2100_90_126 mpop_2100_95_126
clear fpop_2050_65_370 fpop_2050_70_370 fpop_2050_75_370 fpop_2050_80_370 fpop_2050_85_370 fpop_2050_90_370 fpop_2050_95_370
clear mpop_2050_65_370 mpop_2050_70_370 mpop_2050_75_370 mpop_2050_80_370 mpop_2050_85_370 mpop_2050_90_370 mpop_2050_95_370
clear fpop_2100_65_370 fpop_2100_70_370 fpop_2100_75_370 fpop_2100_80_370 fpop_2100_85_370 fpop_2100_90_370 fpop_2100_95_370
clear mpop_2100_65_370 mpop_2100_70_370 mpop_2100_75_370 mpop_2100_80_370 mpop_2100_85_370 mpop_2100_90_370 mpop_2100_95_370
clear fpop_2050_65_585 fpop_2050_70_585 fpop_2050_75_585 fpop_2050_80_585 fpop_2050_85_585 fpop_2050_90_585 fpop_2050_95_585
clear mpop_2050_65_585 mpop_2050_70_585 mpop_2050_75_585 mpop_2050_80_585 mpop_2050_85_585 mpop_2050_90_585 mpop_2050_95_585
clear fpop_2100_65_585 fpop_2100_70_585 fpop_2100_75_585 fpop_2100_80_585 fpop_2100_85_585 fpop_2100_90_585 fpop_2100_95_585
clear mpop_2100_65_585 mpop_2100_70_585 mpop_2100_75_585 mpop_2100_80_585 mpop_2100_85_585 mpop_2100_90_585 mpop_2100_95_585
clear ssp_mortality i


N_CDHW_2014=N_frequency_2014+N_duration_2014+N_severity_2014;
N_CDHW_2050_126=N_frequency_2050_126+N_duration_2050_126+N_severity_2050_126;
N_CDHW_2100_126=N_frequency_2100_126+N_duration_2100_126+N_severity_2100_126;
N_CDHW_2050_370=N_frequency_2050_370+N_duration_2050_370+N_severity_2050_370;
N_CDHW_2100_370=N_frequency_2100_370+N_duration_2100_370+N_severity_2100_370;
N_CDHW_2050_585=N_frequency_2050_585+N_duration_2050_585+N_severity_2050_585;
N_CDHW_2100_585=N_frequency_2100_585+N_duration_2100_585+N_severity_2100_585;


china=imread("C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\data\china2.tif");
china(china<0)=0;
china=china./10000;
china=china';


results_CDHW(:,1)=double(reshape(china,[],1));
results_CDHW(:,2)=reshape(N_CDHW_2014,[],1);
results_CDHW(:,3)=reshape(N_CDHW_2050_126,[],1);
results_CDHW(:,4)=reshape(N_CDHW_2100_126,[],1);
results_CDHW(:,5)=reshape(N_CDHW_2050_370,[],1);
results_CDHW(:,6)=reshape(N_CDHW_2100_370,[],1);
results_CDHW(:,7)=reshape(N_CDHW_2050_585,[],1);
results_CDHW(:,8)=reshape(N_CDHW_2100_585,[],1);


results_frequency(:,1)=double(reshape(china,[],1));
results_frequency(:,2)=reshape(N_frequency_2014,[],1);
results_frequency(:,3)=reshape(N_frequency_2050_126,[],1);
results_frequency(:,4)=reshape(N_frequency_2100_126,[],1);
results_frequency(:,5)=reshape(N_frequency_2050_370,[],1);
results_frequency(:,6)=reshape(N_frequency_2100_370,[],1);
results_frequency(:,7)=reshape(N_frequency_2050_585,[],1);
results_frequency(:,8)=reshape(N_frequency_2100_585,[],1);


results_duration(:,1)=double(reshape(china,[],1));
results_duration(:,2)=reshape(N_duration_2014,[],1);
results_duration(:,3)=reshape(N_duration_2050_126,[],1);
results_duration(:,4)=reshape(N_duration_2100_126,[],1);
results_duration(:,5)=reshape(N_duration_2050_370,[],1);
results_duration(:,6)=reshape(N_duration_2100_370,[],1);
results_duration(:,7)=reshape(N_duration_2050_585,[],1);
results_duration(:,8)=reshape(N_duration_2100_585,[],1);


results_severity(:,1)=double(reshape(china,[],1));
results_severity(:,2)=reshape(N_severity_2014,[],1);
results_severity(:,3)=reshape(N_severity_2050_126,[],1);
results_severity(:,4)=reshape(N_severity_2100_126,[],1);
results_severity(:,5)=reshape(N_severity_2050_370,[],1);
results_severity(:,6)=reshape(N_severity_2100_370,[],1);
results_severity(:,7)=reshape(N_severity_2050_585,[],1);
results_severity(:,8)=reshape(N_severity_2100_585,[],1);


     
results_frequency(:,1)=[];
results_duration(:,1)=[];
results_severity(:,1)=[];


results=[results_CDHW results_frequency results_duration results_severity];
clear results_CDHW results_frequency results_duration results_severity 

results(results(:,1)==0,:)=[];
results=round(results);

clearvars -except results


num_all=sum(results);
num_all(1,1)=1;
num_jiangsu=sum(results(results(:,1)==32,:));
num_jiangsu(1,1)=32;
num_shandong=sum(results(results(:,1)==37,:));
num_shandong(1,1)=37;
num_henan=sum(results(results(:,1)==41,:));
num_henan(1,1)=41;
num_guangdong=sum(results(results(:,1)==44,:));
num_guangdong(1,1)=44;
num_sichuan=sum(results(results(:,1)==51,:));
num_sichuan(1,1)=51;
num_yunnan=sum(results(results(:,1)==53,:));
num_yunnan(1,1)=53;
num_other=num_all-num_jiangsu-num_shandong-num_guangdong-num_henan-num_sichuan-num_yunnan;
num_other(1,1)=0;
num=[num_jiangsu;num_shandong;num_guangdong;num_henan;num_sichuan;num_yunnan;num_other];
clear num_other num_jiangsu num_shandong num_guangdong num_henan num_sichuan num_yunnan


%figure 4-1
figure('Position', [300, 300, 1050, 750])
edgecolor=[1,1,1];
Color(1,:)=[0.5451 0.27059 0.07451];
Color(2,:)=[0.69804 0.13333 0.13333];
Color(3,:)=[1 0.89412 0.76863];
Color(4,:)=[0.38824 0.72157 1];
Color(5,:)=[0.3098 0.58039 0.80392];
Color(6,:)=[0.47843 0.40392 0.93333];
Color(7,:)=[0.42353 0.48235 0.5451];
h = bar([num(:,2)'./1000000; num(:,3)'./1000000; num(:,5)'./1000000; num(:,7)'./1000000], 0.5, 'stacked','FaceColor','flat','EdgeColor',edgecolor);
hold on
for k = 1:7
    h(k).CData = Color(k,:);
end
hold on
line([1, 1], [num_all(30)./1000000, num_all(37)./1000000], 'Color', [0.2, 0.2, 0.2], 'LineWidth', 1.5);
hold on
line([2, 2], [num_all(31)./1000000, num_all(38)./1000000], 'Color', [0.2, 0.2, 0.2], 'LineWidth', 1.5);
hold on
line([3, 3], [num_all(33)./1000000, num_all(40)./1000000], 'Color', [0.2, 0.2, 0.2], 'LineWidth', 1.5);
hold on
line([4, 4], [num_all(35)./1000000, num_all(42)./1000000], 'Color', [0.2, 0.2, 0.2], 'LineWidth', 1.5);
xticklabels({'2014(Recent)', '2050(SSP1-2.6)', '2050(SSP3-7.0)','2050(SSP5-8.5)'})
hTitle = title('Deaths Associated with CDHW');
hYLabel = ylabel('Million people');
set(h,'LineWidth',0.3)
set(gca,'XTick', [1 2 3 4],'Xlim',[0.2 4.7]);
set(gca,'YTick', 0:2:16,'Ylim',[0 16]);
boxchi = get(gca, 'Children');
legend([boxchi(5),boxchi(6),boxchi(7),boxchi(8),boxchi(9),boxchi(10),boxchi(11)], ["Other provinces", "Yunnan", "Sichuan", "Henan", "Guangdong", ...
       "Shandong", "Jiangsu"], 'Location', 'northwest','Box', 'off', 'FontSize', 18);
set(gca, 'Box', 'on', ...                                % 边框
'LineWidth', 1,...                                       % 线宽
'XGrid', 'off', 'YGrid', 'off', ...                      % 网格
'TickDir', 'in', 'TickLength', [.01 .01], ...          % 刻度
'XMinorTick', 'off', 'YMinorTick', 'off', ...            % 小刻度
'XColor', [.1 .1 .1],  'YColor', [.1 .1 .1])             % 坐标轴颜色
% 字体和字号
set(gca, 'FontName', 'Helvetica')
set(gca, 'FontSize', 18)
set( hYLabel, 'FontSize', 20)
set(hTitle, 'FontSize', 25)
% 背景颜色
set(gcf,'Color',[1 1 1])
dpi = 300;  
print(gcf, 'C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\figure\fig4\fig4-1.jpg', '-djpeg', ['-r', num2str(dpi)]);


clearvars -except results num num_all

%figure 4-2
figure('Position', [300, 300, 1050, 750])
edgecolor=[1,1,1];
Color(1,:)=[0.5451 0.27059 0.07451];
Color(2,:)=[0.69804 0.13333 0.13333];
Color(3,:)=[1 0.89412 0.76863];
Color(4,:)=[0.38824 0.72157 1];
Color(5,:)=[0.3098 0.58039 0.80392];
Color(6,:)=[0.47843 0.40392 0.93333];
Color(7,:)=[0.42353 0.48235 0.5451];
h = bar([num(:,9)'./1000000; num(:,10)'./1000000; num(:,12)'./1000000; num(:,14)'./1000000], 0.5, 'stacked','FaceColor','flat','EdgeColor',edgecolor);
hold on
for k = 1:7
    h(k).CData = Color(k,:);
end
hold on
line([1, 1], [num_all(44)./1000000, num_all(51)./1000000], 'Color', [0.2, 0.2, 0.2], 'LineWidth', 1.5);
hold on
line([2, 2], [num_all(45)./1000000, num_all(52)./1000000], 'Color', [0.2, 0.2, 0.2], 'LineWidth', 1.5);
hold on
line([3, 3], [num_all(47)./1000000, num_all(54)./1000000], 'Color', [0.2, 0.2, 0.2], 'LineWidth', 1.5);
hold on
line([4, 4], [num_all(49)./1000000, num_all(56)./1000000], 'Color', [0.2, 0.2, 0.2], 'LineWidth', 1.5);
xticklabels({'2014(Recent)', '2050(SSP1-2.6)', '2050(SSP3-7.0)','2050(SSP5-8.5)'})
hTitle = title('Deaths Associated with Frequency of CDHW');
hYLabel = ylabel('Million people');
set(h,'LineWidth',0.3)
set(gca,'XTick', [1 2 3 4],'Xlim',[0.2 4.7]);
set(gca,'YTick', 0:1:8,'Ylim',[0 8]);
boxchi = get(gca, 'Children');
legend([boxchi(5),boxchi(6),boxchi(7),boxchi(8),boxchi(9),boxchi(10),boxchi(11)], ["Other provinces", "Yunnan", "Sichuan", "Henan", "Guangdong", ...
       "Shandong", "Jiangsu"], 'Location', 'northwest','Box', 'off', 'FontSize', 18);
set(gca, 'Box', 'on', ...                                % 边框
'LineWidth', 1,...                                       % 线宽
'XGrid', 'off', 'YGrid', 'off', ...                      % 网格
'TickDir', 'in', 'TickLength', [.01 .01], ...          % 刻度
'XMinorTick', 'off', 'YMinorTick', 'off', ...            % 小刻度
'XColor', [.1 .1 .1],  'YColor', [.1 .1 .1])             % 坐标轴颜色
% 字体和字号
set(gca, 'FontName', 'Helvetica')
set(gca, 'FontSize', 18)
set( hYLabel, 'FontSize', 20)
set(hTitle, 'FontSize', 25)
% 背景颜色
set(gcf,'Color',[1 1 1])
dpi = 300;  
print(gcf, 'C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\figure\fig4\fig4-2.jpg', '-djpeg', ['-r', num2str(dpi)]);

clearvars -except results num num_all

%figure 4-3
figure('Position', [300, 300, 1050, 750])
edgecolor=[1,1,1];
Color(1,:)=[0.5451 0.27059 0.07451];
Color(2,:)=[0.69804 0.13333 0.13333];
Color(3,:)=[1 0.89412 0.76863];
Color(4,:)=[0.38824 0.72157 1];
Color(5,:)=[0.3098 0.58039 0.80392];
Color(6,:)=[0.47843 0.40392 0.93333];
Color(7,:)=[0.42353 0.48235 0.5451];
h = bar([num(:,16)'./1000000; num(:,17)'./1000000; num(:,19)'./1000000; num(:,21)'./1000000], 0.5, 'stacked','FaceColor','flat','EdgeColor',edgecolor);
hold on
for k = 1:7
    h(k).CData = Color(k,:);
end
hold on
line([1, 1], [num_all(58)./1000000, num_all(65)./1000000], 'Color', [0.2, 0.2, 0.2], 'LineWidth', 1.5);
hold on
line([2, 2], [num_all(59)./1000000, num_all(66)./1000000], 'Color', [0.2, 0.2, 0.2], 'LineWidth', 1.5);
hold on
line([3, 3], [num_all(61)./1000000, num_all(68)./1000000], 'Color', [0.2, 0.2, 0.2], 'LineWidth', 1.5);
hold on
line([4, 4], [num_all(63)./1000000, num_all(70)./1000000], 'Color', [0.2, 0.2, 0.2], 'LineWidth', 1.5);
xticklabels({'2014(Recent)', '2050(SSP1-2.6)', '2050(SSP3-7.0)','2050(SSP5-8.5)'})
hTitle = title('Deaths Associated with Duration of CDHW');
hYLabel = ylabel('Million people');
set(h,'LineWidth',0.3)
set(gca,'XTick', [1 2 3 4],'Xlim',[0.2 4.7]);
set(gca,'YTick', 0:1:8,'Ylim',[0 8]);
boxchi = get(gca, 'Children');
legend([boxchi(5),boxchi(6),boxchi(7),boxchi(8),boxchi(9),boxchi(10),boxchi(11)], ["Other provinces", "Yunnan", "Sichuan", "Henan", "Guangdong", ...
       "Shandong", "Jiangsu"], 'Location', 'northwest','Box', 'off', 'FontSize', 18);
set(gca, 'Box', 'on', ...                                % 边框
'LineWidth', 1,...                                       % 线宽
'XGrid', 'off', 'YGrid', 'off', ...                      % 网格
'TickDir', 'in', 'TickLength', [.01 .01], ...          % 刻度
'XMinorTick', 'off', 'YMinorTick', 'off', ...            % 小刻度
'XColor', [.1 .1 .1],  'YColor', [.1 .1 .1])             % 坐标轴颜色
% 字体和字号
set(gca, 'FontName', 'Helvetica')
set(gca, 'FontSize', 18)
set( hYLabel, 'FontSize', 20)
set(hTitle, 'FontSize', 25)
% 背景颜色
set(gcf,'Color',[1 1 1])
dpi = 300;  
print(gcf, 'C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\figure\fig4\fig4-3.jpg', '-djpeg', ['-r', num2str(dpi)]);


clearvars -except results num num_all

%figure 4-4
figure('Position', [300, 300, 1050, 750])
edgecolor=[1,1,1];
Color(1,:)=[0.5451 0.27059 0.07451];
Color(2,:)=[0.69804 0.13333 0.13333];
Color(3,:)=[1 0.89412 0.76863];
Color(4,:)=[0.38824 0.72157 1];
Color(5,:)=[0.3098 0.58039 0.80392];
Color(6,:)=[0.47843 0.40392 0.93333];
Color(7,:)=[0.42353 0.48235 0.5451];
h = bar([num(:,23)'./1000000; num(:,24)'./1000000; num(:,26)'./1000000; num(:,28)'./1000000], 0.5, 'stacked','FaceColor','flat','EdgeColor',edgecolor);
hold on
for k = 1:7
    h(k).CData = Color(k,:);
end
hold on
line([1, 1], [num_all(72)./1000000, num_all(79)./1000000], 'Color', [0.2, 0.2, 0.2], 'LineWidth', 1.5);
hold on
line([2, 2], [num_all(73)./1000000, num_all(80)./1000000], 'Color', [0.2, 0.2, 0.2], 'LineWidth', 1.5);
hold on
line([3, 3], [num_all(75)./1000000, num_all(82)./1000000], 'Color', [0.2, 0.2, 0.2], 'LineWidth', 1.5);
hold on
line([4, 4], [num_all(77)./1000000, num_all(84)./1000000], 'Color', [0.2, 0.2, 0.2], 'LineWidth', 1.5);
xticklabels({'2014(Recent)', '2050(SSP1-2.6)', '2050(SSP3-7.0)','2050(SSP5-8.5)'})
hTitle = title('Deaths Associated with Severity of CDHW');
hYLabel = ylabel('Million people');
set(h,'LineWidth',0.3)
set(gca,'XTick', [1 2 3 4],'Xlim',[0.2 4.7]);
set(gca,'YTick', 0:1:8,'Ylim',[0 8]);
boxchi = get(gca, 'Children');
legend([boxchi(5),boxchi(6),boxchi(7),boxchi(8),boxchi(9),boxchi(10),boxchi(11)], ["Other provinces", "Yunnan", "Sichuan", "Henan", "Guangdong", ...
       "Shandong", "Jiangsu"], 'Location', 'northwest','Box', 'off', 'FontSize', 18);
set(gca, 'Box', 'on', ...                                % 边框
'LineWidth', 1,...                                       % 线宽
'XGrid', 'off', 'YGrid', 'off', ...                      % 网格
'TickDir', 'in', 'TickLength', [.01 .01], ...          % 刻度
'XMinorTick', 'off', 'YMinorTick', 'off', ...            % 小刻度
'XColor', [.1 .1 .1],  'YColor', [.1 .1 .1])             % 坐标轴颜色
% 字体和字号
set(gca, 'FontName', 'Helvetica')
set(gca, 'FontSize', 18)
set( hYLabel, 'FontSize', 20)
set(hTitle, 'FontSize', 25)
% 背景颜色
set(gcf,'Color',[1 1 1])
dpi = 300;  
print(gcf, 'C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\figure\fig4\fig4-4.jpg', '-djpeg', ['-r', num2str(dpi)]);



clearvars -except results num num_all

%figure 4-5
figure('Position', [300, 300, 1050, 750])
edgecolor=[1,1,1];
Color(1,:)=[0.5451 0.27059 0.07451];
Color(2,:)=[0.69804 0.13333 0.13333];
Color(3,:)=[1 0.89412 0.76863];
Color(4,:)=[0.38824 0.72157 1];
Color(5,:)=[0.3098 0.58039 0.80392];
Color(6,:)=[0.47843 0.40392 0.93333];
Color(7,:)=[0.42353 0.48235 0.5451];
h = bar([num(:,2)'./1000000; num(:,4)'./1000000; num(:,6)'./1000000; num(:,8)'./1000000], 0.5, 'stacked','FaceColor','flat','EdgeColor',edgecolor);
hold on
for k = 1:7
    h(k).CData = Color(k,:);
end
hold on
line([1, 1], [num_all(30)./1000000, num_all(37)./1000000], 'Color', [0.2, 0.2, 0.2], 'LineWidth', 1.5);
hold on
line([2, 2], [num_all(32)./1000000, num_all(39)./1000000], 'Color', [0.2, 0.2, 0.2], 'LineWidth', 1.5);
hold on
line([3, 3], [num_all(34)./1000000, num_all(41)./1000000], 'Color', [0.2, 0.2, 0.2], 'LineWidth', 1.5);
hold on
line([4, 4], [num_all(36)./1000000, num_all(43)./1000000], 'Color', [0.2, 0.2, 0.2], 'LineWidth', 1.5);
xticklabels({'2014(Recent)', '2100(SSP1-2.6)', '2100(SSP3-7.0)','2100(SSP5-8.5)'})
hTitle = title('Deaths Associated with CDHW');
hYLabel = ylabel('Million people');
set(h,'LineWidth',0.3)
set(gca,'XTick', [1 2 3 4],'Xlim',[0.2 4.7]);
set(gca,'YTick', 0:2:16,'Ylim',[0 16]);
boxchi = get(gca, 'Children');
legend([boxchi(5),boxchi(6),boxchi(7),boxchi(8),boxchi(9),boxchi(10),boxchi(11)], ["Other provinces", "Yunnan", "Sichuan", "Henan", "Guangdong", ...
       "Shandong", "Jiangsu"], 'Location', 'northwest','Box', 'off', 'FontSize', 18);
set(gca, 'Box', 'on', ...                                % 边框
'LineWidth', 1,...                                       % 线宽
'XGrid', 'off', 'YGrid', 'off', ...                      % 网格
'TickDir', 'in', 'TickLength', [.01 .01], ...          % 刻度
'XMinorTick', 'off', 'YMinorTick', 'off', ...            % 小刻度
'XColor', [.1 .1 .1],  'YColor', [.1 .1 .1])             % 坐标轴颜色
% 字体和字号
set(gca, 'FontName', 'Helvetica')
set(gca, 'FontSize', 18)
set( hYLabel, 'FontSize', 20)
set(hTitle, 'FontSize', 25)
% 背景颜色
set(gcf,'Color',[1 1 1])
dpi = 300;  
print(gcf, 'C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\figure\fig4\fig4-5.jpg', '-djpeg', ['-r', num2str(dpi)]);


clearvars -except results num num_all

%figure 4-6
figure('Position', [300, 300, 1050, 750])
edgecolor=[1,1,1];
Color(1,:)=[0.5451 0.27059 0.07451];
Color(2,:)=[0.69804 0.13333 0.13333];
Color(3,:)=[1 0.89412 0.76863];
Color(4,:)=[0.38824 0.72157 1];
Color(5,:)=[0.3098 0.58039 0.80392];
Color(6,:)=[0.47843 0.40392 0.93333];
Color(7,:)=[0.42353 0.48235 0.5451];
h = bar([num(:,9)'./1000000; num(:,11)'./1000000; num(:,13)'./1000000; num(:,15)'./1000000], 0.5, 'stacked','FaceColor','flat','EdgeColor',edgecolor);
hold on
for k = 1:7
    h(k).CData = Color(k,:);
end
hold on
line([1, 1], [num_all(44)./1000000, num_all(51)./1000000], 'Color', [0.2, 0.2, 0.2], 'LineWidth', 1.5);
hold on
line([2, 2], [num_all(46)./1000000, num_all(53)./1000000], 'Color', [0.2, 0.2, 0.2], 'LineWidth', 1.5);
hold on
line([3, 3], [num_all(48)./1000000, num_all(55)./1000000], 'Color', [0.2, 0.2, 0.2], 'LineWidth', 1.5);
hold on
line([4, 4], [num_all(50)./1000000, num_all(57)./1000000], 'Color', [0.2, 0.2, 0.2], 'LineWidth', 1.5);
xticklabels({'2014(Recent)', '2100(SSP1-2.6)', '2100(SSP3-7.0)','2100(SSP5-8.5)'})
hTitle = title('Deaths Associated with Frequency of CDHW');
hYLabel = ylabel('Million people');
set(h,'LineWidth',0.3)
set(gca,'XTick', [1 2 3 4],'Xlim',[0.2 4.7]);
set(gca,'YTick', 0:1:8,'Ylim',[0 8]);
boxchi = get(gca, 'Children');
legend([boxchi(5),boxchi(6),boxchi(7),boxchi(8),boxchi(9),boxchi(10),boxchi(11)], ["Other provinces", "Yunnan", "Sichuan", "Henan", "Guangdong", ...
       "Shandong", "Jiangsu"], 'Location', 'northwest','Box', 'off', 'FontSize', 18);
set(gca, 'Box', 'on', ...                                % 边框
'LineWidth', 1,...                                       % 线宽
'XGrid', 'off', 'YGrid', 'off', ...                      % 网格
'TickDir', 'in', 'TickLength', [.01 .01], ...          % 刻度
'XMinorTick', 'off', 'YMinorTick', 'off', ...            % 小刻度
'XColor', [.1 .1 .1],  'YColor', [.1 .1 .1])             % 坐标轴颜色
% 字体和字号
set(gca, 'FontName', 'Helvetica')
set(gca, 'FontSize', 18)
set( hYLabel, 'FontSize', 20)
set(hTitle, 'FontSize', 25)
% 背景颜色
set(gcf,'Color',[1 1 1])
dpi = 300;  
print(gcf, 'C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\figure\fig4\fig4-6.jpg', '-djpeg', ['-r', num2str(dpi)]);

clearvars -except results num num_all

%figure 4-7
figure('Position', [300, 300, 1050, 750])
edgecolor=[1,1,1];
Color(1,:)=[0.5451 0.27059 0.07451];
Color(2,:)=[0.69804 0.13333 0.13333];
Color(3,:)=[1 0.89412 0.76863];
Color(4,:)=[0.38824 0.72157 1];
Color(5,:)=[0.3098 0.58039 0.80392];
Color(6,:)=[0.47843 0.40392 0.93333];
Color(7,:)=[0.42353 0.48235 0.5451];
h = bar([num(:,16)'./1000000; num(:,18)'./1000000; num(:,20)'./1000000; num(:,22)'./1000000], 0.5, 'stacked','FaceColor','flat','EdgeColor',edgecolor);
hold on
for k = 1:7
    h(k).CData = Color(k,:);
end
hold on
line([1, 1], [num_all(58)./1000000, num_all(65)./1000000], 'Color', [0.2, 0.2, 0.2], 'LineWidth', 1.5);
hold on
line([2, 2], [num_all(60)./1000000, num_all(67)./1000000], 'Color', [0.2, 0.2, 0.2], 'LineWidth', 1.5);
hold on
line([3, 3], [num_all(62)./1000000, num_all(69)./1000000], 'Color', [0.2, 0.2, 0.2], 'LineWidth', 1.5);
hold on
line([4, 4], [num_all(64)./1000000, num_all(71)./1000000], 'Color', [0.2, 0.2, 0.2], 'LineWidth', 1.5);
xticklabels({'2014(Recent)', '2100(SSP1-2.6)', '2100(SSP3-7.0)','2100(SSP5-8.5)'})
hTitle = title('Deaths Associated with Duration of CDHW');
hYLabel = ylabel('Million people');
set(h,'LineWidth',0.3)
set(gca,'XTick', [1 2 3 4],'Xlim',[0.2 4.7]);
set(gca,'YTick', 0:1:8,'Ylim',[0 8]);
boxchi = get(gca, 'Children');
legend([boxchi(5),boxchi(6),boxchi(7),boxchi(8),boxchi(9),boxchi(10),boxchi(11)], ["Other provinces", "Yunnan", "Sichuan", "Henan", "Guangdong", ...
       "Shandong", "Jiangsu"], 'Location', 'northwest','Box', 'off', 'FontSize', 18);
set(gca, 'Box', 'on', ...                                % 边框
'LineWidth', 1,...                                       % 线宽
'XGrid', 'off', 'YGrid', 'off', ...                      % 网格
'TickDir', 'in', 'TickLength', [.01 .01], ...          % 刻度
'XMinorTick', 'off', 'YMinorTick', 'off', ...            % 小刻度
'XColor', [.1 .1 .1],  'YColor', [.1 .1 .1])             % 坐标轴颜色
% 字体和字号
set(gca, 'FontName', 'Helvetica')
set(gca, 'FontSize', 18)
set( hYLabel, 'FontSize', 20)
set(hTitle, 'FontSize', 25)
% 背景颜色
set(gcf,'Color',[1 1 1])
dpi = 300;  
print(gcf, 'C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\figure\fig4\fig4-7.jpg', '-djpeg', ['-r', num2str(dpi)]);


clearvars -except results num num_all

%figure 4-8
figure('Position', [300, 300, 1050, 750])
edgecolor=[1,1,1];
Color(1,:)=[0.5451 0.27059 0.07451];
Color(2,:)=[0.69804 0.13333 0.13333];
Color(3,:)=[1 0.89412 0.76863];
Color(4,:)=[0.38824 0.72157 1];
Color(5,:)=[0.3098 0.58039 0.80392];
Color(6,:)=[0.47843 0.40392 0.93333];
Color(7,:)=[0.42353 0.48235 0.5451];
h = bar([num(:,23)'./1000000; num(:,25)'./1000000; num(:,27)'./1000000; num(:,29)'./1000000], 0.5, 'stacked','FaceColor','flat','EdgeColor',edgecolor);
hold on
for k = 1:7
    h(k).CData = Color(k,:);
end
hold on
line([1, 1], [num_all(72)./1000000, num_all(79)./1000000], 'Color', [0.2, 0.2, 0.2], 'LineWidth', 1.5);
hold on
line([2, 2], [num_all(74)./1000000, num_all(81)./1000000], 'Color', [0.2, 0.2, 0.2], 'LineWidth', 1.5);
hold on
line([3, 3], [num_all(76)./1000000, num_all(83)./1000000], 'Color', [0.2, 0.2, 0.2], 'LineWidth', 1.5);
hold on
line([4, 4], [num_all(78)./1000000, num_all(85)./1000000], 'Color', [0.2, 0.2, 0.2], 'LineWidth', 1.5);
xticklabels({'2014(Recent)', '2100(SSP1-2.6)', '2100(SSP3-7.0)','2100(SSP5-8.5)'})
hTitle = title('Deaths Associated with Severity of CDHW');
hYLabel = ylabel('Million people');
set(h,'LineWidth',0.3)
set(gca,'XTick', [1 2 3 4],'Xlim',[0.2 4.7]);
set(gca,'YTick', 0:1:8,'Ylim',[0 8]);
boxchi = get(gca, 'Children');
legend([boxchi(5),boxchi(6),boxchi(7),boxchi(8),boxchi(9),boxchi(10),boxchi(11)], ["Other provinces", "Yunnan", "Sichuan", "Henan", "Guangdong", ...
       "Shandong", "Jiangsu"], 'Location', 'northwest','Box', 'off', 'FontSize', 18);
set(gca, 'Box', 'on', ...                                % 边框
'LineWidth', 1,...                                       % 线宽
'XGrid', 'off', 'YGrid', 'off', ...                      % 网格
'TickDir', 'in', 'TickLength', [.01 .01], ...          % 刻度
'XMinorTick', 'off', 'YMinorTick', 'off', ...            % 小刻度
'XColor', [.1 .1 .1],  'YColor', [.1 .1 .1])             % 坐标轴颜色
% 字体和字号
set(gca, 'FontName', 'Helvetica')
set(gca, 'FontSize', 18)
set( hYLabel, 'FontSize', 20)
set(hTitle, 'FontSize', 25)
% 背景颜色
set(gcf,'Color',[1 1 1])
dpi = 300;  
print(gcf, 'C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\figure\fig4\fig4-8.jpg', '-djpeg', ['-r', num2str(dpi)]);
