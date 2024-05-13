clear
clc


m1_hw92_ssp126=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\HWS\m1_ssp126_hws92.nc", 'tasmax');
m2_hw92_ssp126=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\HWS\m2_ssp126_hws92.nc", 'tasmax');
m3_hw92_ssp126=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\HWS\m3_ssp126_hws92.nc", 'tasmax');
m4_hw92_ssp126=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\HWS\m4_ssp126_hws92.nc", 'tasmax');
m5_hw92_ssp126=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\HWS\m5_ssp126_hws92.nc", 'tasmax');

m1_hw92_ssp370=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\HWS\m1_ssp370_hws92.nc", 'tasmax');
m2_hw92_ssp370=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\HWS\m2_ssp370_hws92.nc", 'tasmax');
m3_hw92_ssp370=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\HWS\m3_ssp370_hws92.nc", 'tasmax');
m4_hw92_ssp370=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\HWS\m4_ssp370_hws92.nc", 'tasmax');
m5_hw92_ssp370=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\HWS\m5_ssp370_hws92.nc", 'tasmax');

m1_hw92_ssp585=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\HWS\m1_ssp585_hws92.nc", 'tasmax');
m2_hw92_ssp585=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\HWS\m2_ssp585_hws92.nc", 'tasmax');
m3_hw92_ssp585=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\HWS\m3_ssp585_hws92.nc", 'tasmax');
m4_hw92_ssp585=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\HWS\m4_ssp585_hws92.nc", 'tasmax');
m5_hw92_ssp585=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\HWS\m5_ssp585_hws92.nc", 'tasmax');



hw_frequency_m1_ssp126=ones(126,102,160);
hw_frequency_m2_ssp126=ones(126,102,160);
hw_frequency_m3_ssp126=ones(126,102,160);
hw_frequency_m4_ssp126=ones(126,102,160);
hw_frequency_m5_ssp126=ones(126,102,160);

hw_duration_m1_ssp126=ones(126,102,160);
hw_duration_m2_ssp126=ones(126,102,160);
hw_duration_m3_ssp126=ones(126,102,160);
hw_duration_m4_ssp126=ones(126,102,160);
hw_duration_m5_ssp126=ones(126,102,160);

hw_severity_m1_ssp126=ones(126,102,160);
hw_severity_m2_ssp126=ones(126,102,160);
hw_severity_m3_ssp126=ones(126,102,160);
hw_severity_m4_ssp126=ones(126,102,160);
hw_severity_m5_ssp126=ones(126,102,160);

hw_frequency_m1_ssp370=ones(126,102,160);
hw_frequency_m2_ssp370=ones(126,102,160);
hw_frequency_m3_ssp370=ones(126,102,160);
hw_frequency_m4_ssp370=ones(126,102,160);
hw_frequency_m5_ssp370=ones(126,102,160);

hw_duration_m1_ssp370=ones(126,102,160);
hw_duration_m2_ssp370=ones(126,102,160);
hw_duration_m3_ssp370=ones(126,102,160);
hw_duration_m4_ssp370=ones(126,102,160);
hw_duration_m5_ssp370=ones(126,102,160);

hw_severity_m1_ssp370=ones(126,102,160);
hw_severity_m2_ssp370=ones(126,102,160);
hw_severity_m3_ssp370=ones(126,102,160);
hw_severity_m4_ssp370=ones(126,102,160);
hw_severity_m5_ssp370=ones(126,102,160);

hw_frequency_m1_ssp585=ones(126,102,160);
hw_frequency_m2_ssp585=ones(126,102,160);
hw_frequency_m3_ssp585=ones(126,102,160);
hw_frequency_m4_ssp585=ones(126,102,160);
hw_frequency_m5_ssp585=ones(126,102,160);

hw_duration_m1_ssp585=ones(126,102,160);
hw_duration_m2_ssp585=ones(126,102,160);
hw_duration_m3_ssp585=ones(126,102,160);
hw_duration_m4_ssp585=ones(126,102,160);
hw_duration_m5_ssp585=ones(126,102,160);

hw_severity_m1_ssp585=ones(126,102,160);
hw_severity_m2_ssp585=ones(126,102,160);
hw_severity_m3_ssp585=ones(126,102,160);
hw_severity_m4_ssp585=ones(126,102,160);
hw_severity_m5_ssp585=ones(126,102,160);






for i=1:160
    for j=1:126
        for k=1:102
            hw_frequency_m1_ssp126(j,k,i)=cdhw_frequency(m1_hw92_ssp126(j,k,365*(i-1)+1:365*i),3);
            hw_frequency_m2_ssp126(j,k,i)=cdhw_frequency(m2_hw92_ssp126(j,k,365*(i-1)+1:365*i),3);
            hw_frequency_m3_ssp126(j,k,i)=cdhw_frequency(m3_hw92_ssp126(j,k,365*(i-1)+1:365*i),3);
            hw_frequency_m4_ssp126(j,k,i)=cdhw_frequency(m4_hw92_ssp126(j,k,365*(i-1)+1:365*i),3);
            hw_frequency_m5_ssp126(j,k,i)=cdhw_frequency(m5_hw92_ssp126(j,k,365*(i-1)+1:365*i),3);
            hw_duration_m1_ssp126(j,k,i)=cdhw_duration(m1_hw92_ssp126(j,k,365*(i-1)+1:365*i),3);
            hw_duration_m2_ssp126(j,k,i)=cdhw_duration(m2_hw92_ssp126(j,k,365*(i-1)+1:365*i),3);
            hw_duration_m3_ssp126(j,k,i)=cdhw_duration(m3_hw92_ssp126(j,k,365*(i-1)+1:365*i),3);
            hw_duration_m4_ssp126(j,k,i)=cdhw_duration(m4_hw92_ssp126(j,k,365*(i-1)+1:365*i),3);
            hw_duration_m5_ssp126(j,k,i)=cdhw_duration(m5_hw92_ssp126(j,k,365*(i-1)+1:365*i),3);
            hw_severity_m1_ssp126(j,k,i)=cdhw_severity(m1_hw92_ssp126(j,k,365*(i-1)+1:365*i),3);
            hw_severity_m2_ssp126(j,k,i)=cdhw_severity(m2_hw92_ssp126(j,k,365*(i-1)+1:365*i),3);
            hw_severity_m3_ssp126(j,k,i)=cdhw_severity(m3_hw92_ssp126(j,k,365*(i-1)+1:365*i),3);
            hw_severity_m4_ssp126(j,k,i)=cdhw_severity(m4_hw92_ssp126(j,k,365*(i-1)+1:365*i),3);
            hw_severity_m5_ssp126(j,k,i)=cdhw_severity(m5_hw92_ssp126(j,k,365*(i-1)+1:365*i),3);
            hw_frequency_m1_ssp370(j,k,i)=cdhw_frequency(m1_hw92_ssp370(j,k,365*(i-1)+1:365*i),3);
            hw_frequency_m2_ssp370(j,k,i)=cdhw_frequency(m2_hw92_ssp370(j,k,365*(i-1)+1:365*i),3);
            hw_frequency_m3_ssp370(j,k,i)=cdhw_frequency(m3_hw92_ssp370(j,k,365*(i-1)+1:365*i),3);
            hw_frequency_m4_ssp370(j,k,i)=cdhw_frequency(m4_hw92_ssp370(j,k,365*(i-1)+1:365*i),3);
            hw_frequency_m5_ssp370(j,k,i)=cdhw_frequency(m5_hw92_ssp370(j,k,365*(i-1)+1:365*i),3);
            hw_duration_m1_ssp370(j,k,i)=cdhw_duration(m1_hw92_ssp370(j,k,365*(i-1)+1:365*i),3);
            hw_duration_m2_ssp370(j,k,i)=cdhw_duration(m2_hw92_ssp370(j,k,365*(i-1)+1:365*i),3);
            hw_duration_m3_ssp370(j,k,i)=cdhw_duration(m3_hw92_ssp370(j,k,365*(i-1)+1:365*i),3);
            hw_duration_m4_ssp370(j,k,i)=cdhw_duration(m4_hw92_ssp370(j,k,365*(i-1)+1:365*i),3);
            hw_duration_m5_ssp370(j,k,i)=cdhw_duration(m5_hw92_ssp370(j,k,365*(i-1)+1:365*i),3);
            hw_severity_m1_ssp370(j,k,i)=cdhw_severity(m1_hw92_ssp370(j,k,365*(i-1)+1:365*i),3);
            hw_severity_m2_ssp370(j,k,i)=cdhw_severity(m2_hw92_ssp370(j,k,365*(i-1)+1:365*i),3);
            hw_severity_m3_ssp370(j,k,i)=cdhw_severity(m3_hw92_ssp370(j,k,365*(i-1)+1:365*i),3);
            hw_severity_m4_ssp370(j,k,i)=cdhw_severity(m4_hw92_ssp370(j,k,365*(i-1)+1:365*i),3);
            hw_severity_m5_ssp370(j,k,i)=cdhw_severity(m5_hw92_ssp370(j,k,365*(i-1)+1:365*i),3);
            hw_frequency_m1_ssp585(j,k,i)=cdhw_frequency(m1_hw92_ssp585(j,k,365*(i-1)+1:365*i),3);
            hw_frequency_m2_ssp585(j,k,i)=cdhw_frequency(m2_hw92_ssp585(j,k,365*(i-1)+1:365*i),3);
            hw_frequency_m3_ssp585(j,k,i)=cdhw_frequency(m3_hw92_ssp585(j,k,365*(i-1)+1:365*i),3);
            hw_frequency_m4_ssp585(j,k,i)=cdhw_frequency(m4_hw92_ssp585(j,k,365*(i-1)+1:365*i),3);
            hw_frequency_m5_ssp585(j,k,i)=cdhw_frequency(m5_hw92_ssp585(j,k,365*(i-1)+1:365*i),3);
            hw_duration_m1_ssp585(j,k,i)=cdhw_duration(m1_hw92_ssp585(j,k,365*(i-1)+1:365*i),3);
            hw_duration_m2_ssp585(j,k,i)=cdhw_duration(m2_hw92_ssp585(j,k,365*(i-1)+1:365*i),3);
            hw_duration_m3_ssp585(j,k,i)=cdhw_duration(m3_hw92_ssp585(j,k,365*(i-1)+1:365*i),3);
            hw_duration_m4_ssp585(j,k,i)=cdhw_duration(m4_hw92_ssp585(j,k,365*(i-1)+1:365*i),3);
            hw_duration_m5_ssp585(j,k,i)=cdhw_duration(m5_hw92_ssp585(j,k,365*(i-1)+1:365*i),3);
            hw_severity_m1_ssp585(j,k,i)=cdhw_severity(m1_hw92_ssp585(j,k,365*(i-1)+1:365*i),3);
            hw_severity_m2_ssp585(j,k,i)=cdhw_severity(m2_hw92_ssp585(j,k,365*(i-1)+1:365*i),3);
            hw_severity_m3_ssp585(j,k,i)=cdhw_severity(m3_hw92_ssp585(j,k,365*(i-1)+1:365*i),3);
            hw_severity_m4_ssp585(j,k,i)=cdhw_severity(m4_hw92_ssp585(j,k,365*(i-1)+1:365*i),3);
            hw_severity_m5_ssp585(j,k,i)=cdhw_severity(m5_hw92_ssp585(j,k,365*(i-1)+1:365*i),3);
        end
    end
end



ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m1_hw_frequency_92_ssp126.nc", 'tws', hw_frequency_m1_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m2_hw_frequency_92_ssp126.nc", 'tws', hw_frequency_m2_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m3_hw_frequency_92_ssp126.nc", 'tws', hw_frequency_m3_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m4_hw_frequency_92_ssp126.nc", 'tws', hw_frequency_m4_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m5_hw_frequency_92_ssp126.nc", 'tws', hw_frequency_m5_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m1_hw_duration_92_ssp126.nc", 'tws', hw_duration_m1_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m2_hw_duration_92_ssp126.nc", 'tws', hw_duration_m2_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m3_hw_duration_92_ssp126.nc", 'tws', hw_duration_m3_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m4_hw_duration_92_ssp126.nc", 'tws', hw_duration_m4_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m5_hw_duration_92_ssp126.nc", 'tws', hw_duration_m5_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m1_hw_severity_92_ssp126.nc", 'tws', hw_severity_m1_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m2_hw_severity_92_ssp126.nc", 'tws', hw_severity_m2_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m3_hw_severity_92_ssp126.nc", 'tws', hw_severity_m3_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m4_hw_severity_92_ssp126.nc", 'tws', hw_severity_m4_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m5_hw_severity_92_ssp126.nc", 'tws', hw_severity_m5_ssp126);

ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m1_hw_frequency_92_ssp370.nc", 'tws', hw_frequency_m1_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m2_hw_frequency_92_ssp370.nc", 'tws', hw_frequency_m2_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m3_hw_frequency_92_ssp370.nc", 'tws', hw_frequency_m3_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m4_hw_frequency_92_ssp370.nc", 'tws', hw_frequency_m4_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m5_hw_frequency_92_ssp370.nc", 'tws', hw_frequency_m5_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m1_hw_duration_92_ssp370.nc", 'tws', hw_duration_m1_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m2_hw_duration_92_ssp370.nc", 'tws', hw_duration_m2_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m3_hw_duration_92_ssp370.nc", 'tws', hw_duration_m3_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m4_hw_duration_92_ssp370.nc", 'tws', hw_duration_m4_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m5_hw_duration_92_ssp370.nc", 'tws', hw_duration_m5_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m1_hw_severity_92_ssp370.nc", 'tws', hw_severity_m1_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m2_hw_severity_92_ssp370.nc", 'tws', hw_severity_m2_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m3_hw_severity_92_ssp370.nc", 'tws', hw_severity_m3_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m4_hw_severity_92_ssp370.nc", 'tws', hw_severity_m4_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m5_hw_severity_92_ssp370.nc", 'tws', hw_severity_m5_ssp370);

ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m1_hw_frequency_92_ssp585.nc", 'tws', hw_frequency_m1_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m2_hw_frequency_92_ssp585.nc", 'tws', hw_frequency_m2_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m3_hw_frequency_92_ssp585.nc", 'tws', hw_frequency_m3_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m4_hw_frequency_92_ssp585.nc", 'tws', hw_frequency_m4_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m5_hw_frequency_92_ssp585.nc", 'tws', hw_frequency_m5_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m1_hw_duration_92_ssp585.nc", 'tws', hw_duration_m1_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m2_hw_duration_92_ssp585.nc", 'tws', hw_duration_m2_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m3_hw_duration_92_ssp585.nc", 'tws', hw_duration_m3_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m4_hw_duration_92_ssp585.nc", 'tws', hw_duration_m4_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m5_hw_duration_92_ssp585.nc", 'tws', hw_duration_m5_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m1_hw_severity_92_ssp585.nc", 'tws', hw_severity_m1_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m2_hw_severity_92_ssp585.nc", 'tws', hw_severity_m2_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m3_hw_severity_92_ssp585.nc", 'tws', hw_severity_m3_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m4_hw_severity_92_ssp585.nc", 'tws', hw_severity_m4_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\HW_index_yearly\m5_hw_severity_92_ssp585.nc", 'tws', hw_severity_m5_ssp585);






