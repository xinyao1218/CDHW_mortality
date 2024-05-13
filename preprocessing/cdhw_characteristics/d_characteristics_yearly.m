clear
clc


m1_d_ssp126=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\TWSA_DSI\m1_ssp126_twsa_dsi.nc", 'tws');
m2_d_ssp126=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\TWSA_DSI\m2_ssp126_twsa_dsi.nc", 'tws');
m3_d_ssp126=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\TWSA_DSI\m3_ssp126_twsa_dsi.nc", 'tws');
m4_d_ssp126=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\TWSA_DSI\m4_ssp126_twsa_dsi.nc", 'tws');
m5_d_ssp126=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\TWSA_DSI\m5_ssp126_twsa_dsi.nc", 'tws');
m6_d_ssp126=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\TWSA_DSI\m6_ssp126_twsa_dsi.nc", 'tws');
m7_d_ssp126=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\TWSA_DSI\m7_ssp126_twsa_dsi.nc", 'tws');
m8_d_ssp126=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\TWSA_DSI\m8_ssp126_twsa_dsi.nc", 'tws');
m9_d_ssp126=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\TWSA_DSI\m9_ssp126_twsa_dsi.nc", 'tws');
m10_d_ssp126=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\TWSA_DSI\m10_ssp126_twsa_dsi.nc", 'tws');


m1_d_ssp370=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\TWSA_DSI\m1_ssp370_twsa_dsi.nc", 'tws');
m2_d_ssp370=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\TWSA_DSI\m2_ssp370_twsa_dsi.nc", 'tws');
m3_d_ssp370=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\TWSA_DSI\m3_ssp370_twsa_dsi.nc", 'tws');
m4_d_ssp370=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\TWSA_DSI\m4_ssp370_twsa_dsi.nc", 'tws');
m5_d_ssp370=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\TWSA_DSI\m5_ssp370_twsa_dsi.nc", 'tws');
m6_d_ssp370=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\TWSA_DSI\m6_ssp370_twsa_dsi.nc", 'tws');
m7_d_ssp370=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\TWSA_DSI\m7_ssp370_twsa_dsi.nc", 'tws');
m8_d_ssp370=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\TWSA_DSI\m8_ssp370_twsa_dsi.nc", 'tws');
m9_d_ssp370=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\TWSA_DSI\m9_ssp370_twsa_dsi.nc", 'tws');
m10_d_ssp370=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\TWSA_DSI\m10_ssp370_twsa_dsi.nc", 'tws');


m1_d_ssp585=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\TWSA_DSI\m1_ssp585_twsa_dsi.nc", 'tws');
m2_d_ssp585=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\TWSA_DSI\m2_ssp585_twsa_dsi.nc", 'tws');
m3_d_ssp585=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\TWSA_DSI\m3_ssp585_twsa_dsi.nc", 'tws');
m4_d_ssp585=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\TWSA_DSI\m4_ssp585_twsa_dsi.nc", 'tws');
m5_d_ssp585=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\TWSA_DSI\m5_ssp585_twsa_dsi.nc", 'tws');
m6_d_ssp585=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\TWSA_DSI\m6_ssp585_twsa_dsi.nc", 'tws');
m7_d_ssp585=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\TWSA_DSI\m7_ssp585_twsa_dsi.nc", 'tws');
m8_d_ssp585=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\TWSA_DSI\m8_ssp585_twsa_dsi.nc", 'tws');
m9_d_ssp585=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\TWSA_DSI\m9_ssp585_twsa_dsi.nc", 'tws');
m10_d_ssp585=ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\TWSA_DSI\m10_ssp585_twsa_dsi.nc", 'tws');



m1_d_ssp126(m1_d_ssp126>-0.8)=0;
m1_d_ssp126(m1_d_ssp126<=-0.8)=abs(m1_d_ssp126(m1_d_ssp126<=-0.8));
m2_d_ssp126(m2_d_ssp126>-0.8)=0;
m2_d_ssp126(m2_d_ssp126<=-0.8)=abs(m2_d_ssp126(m2_d_ssp126<=-0.8));
m3_d_ssp126(m3_d_ssp126>-0.8)=0;
m3_d_ssp126(m3_d_ssp126<=-0.8)=abs(m3_d_ssp126(m3_d_ssp126<=-0.8));
m4_d_ssp126(m4_d_ssp126>-0.8)=0;
m4_d_ssp126(m4_d_ssp126<=-0.8)=abs(m4_d_ssp126(m4_d_ssp126<=-0.8));
m5_d_ssp126(m5_d_ssp126>-0.8)=0;
m5_d_ssp126(m5_d_ssp126<=-0.8)=abs(m5_d_ssp126(m5_d_ssp126<=-0.8));
m6_d_ssp126(m6_d_ssp126>-0.8)=0;
m6_d_ssp126(m6_d_ssp126<=-0.8)=abs(m6_d_ssp126(m6_d_ssp126<=-0.8));
m7_d_ssp126(m7_d_ssp126>-0.8)=0;
m7_d_ssp126(m7_d_ssp126<=-0.8)=abs(m7_d_ssp126(m7_d_ssp126<=-0.8));
m8_d_ssp126(m8_d_ssp126>-0.8)=0;
m8_d_ssp126(m8_d_ssp126<=-0.8)=abs(m8_d_ssp126(m8_d_ssp126<=-0.8));
m9_d_ssp126(m9_d_ssp126>-0.8)=0;
m9_d_ssp126(m9_d_ssp126<=-0.8)=abs(m9_d_ssp126(m9_d_ssp126<=-0.8));
m10_d_ssp126(m10_d_ssp126>-0.8)=0;
m10_d_ssp126(m10_d_ssp126<=-0.8)=abs(m10_d_ssp126(m10_d_ssp126<=-0.8));


m1_d_ssp370(m1_d_ssp370>-0.8)=0;
m1_d_ssp370(m1_d_ssp370<=-0.8)=abs(m1_d_ssp370(m1_d_ssp370<=-0.8));
m2_d_ssp370(m2_d_ssp370>-0.8)=0;
m2_d_ssp370(m2_d_ssp370<=-0.8)=abs(m2_d_ssp370(m2_d_ssp370<=-0.8));
m3_d_ssp370(m3_d_ssp370>-0.8)=0;
m3_d_ssp370(m3_d_ssp370<=-0.8)=abs(m3_d_ssp370(m3_d_ssp370<=-0.8));
m4_d_ssp370(m4_d_ssp370>-0.8)=0;
m4_d_ssp370(m4_d_ssp370<=-0.8)=abs(m4_d_ssp370(m4_d_ssp370<=-0.8));
m5_d_ssp370(m5_d_ssp370>-0.8)=0;
m5_d_ssp370(m5_d_ssp370<=-0.8)=abs(m5_d_ssp370(m5_d_ssp370<=-0.8));
m6_d_ssp370(m6_d_ssp370>-0.8)=0;
m6_d_ssp370(m6_d_ssp370<=-0.8)=abs(m6_d_ssp370(m6_d_ssp370<=-0.8));
m7_d_ssp370(m7_d_ssp370>-0.8)=0;
m7_d_ssp370(m7_d_ssp370<=-0.8)=abs(m7_d_ssp370(m7_d_ssp370<=-0.8));
m8_d_ssp370(m8_d_ssp370>-0.8)=0;
m8_d_ssp370(m8_d_ssp370<=-0.8)=abs(m8_d_ssp370(m8_d_ssp370<=-0.8));
m9_d_ssp370(m9_d_ssp370>-0.8)=0;
m9_d_ssp370(m9_d_ssp370<=-0.8)=abs(m9_d_ssp370(m9_d_ssp370<=-0.8));
m10_d_ssp370(m10_d_ssp370>-0.8)=0;
m10_d_ssp370(m10_d_ssp370<=-0.8)=abs(m10_d_ssp370(m10_d_ssp370<=-0.8));


m1_d_ssp585(m1_d_ssp585>-0.8)=0;
m1_d_ssp585(m1_d_ssp585<=-0.8)=abs(m1_d_ssp585(m1_d_ssp585<=-0.8));
m2_d_ssp585(m2_d_ssp585>-0.8)=0;
m2_d_ssp585(m2_d_ssp585<=-0.8)=abs(m2_d_ssp585(m2_d_ssp585<=-0.8));
m3_d_ssp585(m3_d_ssp585>-0.8)=0;
m3_d_ssp585(m3_d_ssp585<=-0.8)=abs(m3_d_ssp585(m3_d_ssp585<=-0.8));
m4_d_ssp585(m4_d_ssp585>-0.8)=0;
m4_d_ssp585(m4_d_ssp585<=-0.8)=abs(m4_d_ssp585(m4_d_ssp585<=-0.8));
m5_d_ssp585(m5_d_ssp585>-0.8)=0;
m5_d_ssp585(m5_d_ssp585<=-0.8)=abs(m5_d_ssp585(m5_d_ssp585<=-0.8));
m6_d_ssp585(m6_d_ssp585>-0.8)=0;
m6_d_ssp585(m6_d_ssp585<=-0.8)=abs(m6_d_ssp585(m6_d_ssp585<=-0.8));
m7_d_ssp585(m7_d_ssp585>-0.8)=0;
m7_d_ssp585(m7_d_ssp585<=-0.8)=abs(m7_d_ssp585(m7_d_ssp585<=-0.8));
m8_d_ssp585(m8_d_ssp585>-0.8)=0;
m8_d_ssp585(m8_d_ssp585<=-0.8)=abs(m8_d_ssp585(m8_d_ssp585<=-0.8));
m9_d_ssp585(m9_d_ssp585>-0.8)=0;
m9_d_ssp585(m9_d_ssp585<=-0.8)=abs(m9_d_ssp585(m9_d_ssp585<=-0.8));
m10_d_ssp585(m10_d_ssp585>-0.8)=0;
m10_d_ssp585(m10_d_ssp585<=-0.8)=abs(m10_d_ssp585(m10_d_ssp585<=-0.8));




d_frequency_m1_ssp126=ones(126,102,160);
d_frequency_m2_ssp126=ones(126,102,160);
d_frequency_m3_ssp126=ones(126,102,160);
d_frequency_m4_ssp126=ones(126,102,160);
d_frequency_m5_ssp126=ones(126,102,160);
d_frequency_m6_ssp126=ones(126,102,160);
d_frequency_m7_ssp126=ones(126,102,160);
d_frequency_m8_ssp126=ones(126,102,160);
d_frequency_m9_ssp126=ones(126,102,160);
d_frequency_m10_ssp126=ones(126,102,160);

d_duration_m1_ssp126=ones(126,102,160);
d_duration_m2_ssp126=ones(126,102,160);
d_duration_m3_ssp126=ones(126,102,160);
d_duration_m4_ssp126=ones(126,102,160);
d_duration_m5_ssp126=ones(126,102,160);
d_duration_m6_ssp126=ones(126,102,160);
d_duration_m7_ssp126=ones(126,102,160);
d_duration_m8_ssp126=ones(126,102,160);
d_duration_m9_ssp126=ones(126,102,160);
d_duration_m10_ssp126=ones(126,102,160);

d_severity_m1_ssp126=ones(126,102,160);
d_severity_m2_ssp126=ones(126,102,160);
d_severity_m3_ssp126=ones(126,102,160);
d_severity_m4_ssp126=ones(126,102,160);
d_severity_m5_ssp126=ones(126,102,160);
d_severity_m6_ssp126=ones(126,102,160);
d_severity_m7_ssp126=ones(126,102,160);
d_severity_m8_ssp126=ones(126,102,160);
d_severity_m9_ssp126=ones(126,102,160);
d_severity_m10_ssp126=ones(126,102,160);

d_frequency_m1_ssp370=ones(126,102,160);
d_frequency_m2_ssp370=ones(126,102,160);
d_frequency_m3_ssp370=ones(126,102,160);
d_frequency_m4_ssp370=ones(126,102,160);
d_frequency_m5_ssp370=ones(126,102,160);
d_frequency_m6_ssp370=ones(126,102,160);
d_frequency_m7_ssp370=ones(126,102,160);
d_frequency_m8_ssp370=ones(126,102,160);
d_frequency_m9_ssp370=ones(126,102,160);
d_frequency_m10_ssp370=ones(126,102,160);

d_duration_m1_ssp370=ones(126,102,160);
d_duration_m2_ssp370=ones(126,102,160);
d_duration_m3_ssp370=ones(126,102,160);
d_duration_m4_ssp370=ones(126,102,160);
d_duration_m5_ssp370=ones(126,102,160);
d_duration_m6_ssp370=ones(126,102,160);
d_duration_m7_ssp370=ones(126,102,160);
d_duration_m8_ssp370=ones(126,102,160);
d_duration_m9_ssp370=ones(126,102,160);
d_duration_m10_ssp370=ones(126,102,160);

d_severity_m1_ssp370=ones(126,102,160);
d_severity_m2_ssp370=ones(126,102,160);
d_severity_m3_ssp370=ones(126,102,160);
d_severity_m4_ssp370=ones(126,102,160);
d_severity_m5_ssp370=ones(126,102,160);
d_severity_m6_ssp370=ones(126,102,160);
d_severity_m7_ssp370=ones(126,102,160);
d_severity_m8_ssp370=ones(126,102,160);
d_severity_m9_ssp370=ones(126,102,160);
d_severity_m10_ssp370=ones(126,102,160);

d_frequency_m1_ssp585=ones(126,102,160);
d_frequency_m2_ssp585=ones(126,102,160);
d_frequency_m3_ssp585=ones(126,102,160);
d_frequency_m4_ssp585=ones(126,102,160);
d_frequency_m5_ssp585=ones(126,102,160);
d_frequency_m6_ssp585=ones(126,102,160);
d_frequency_m7_ssp585=ones(126,102,160);
d_frequency_m8_ssp585=ones(126,102,160);
d_frequency_m9_ssp585=ones(126,102,160);
d_frequency_m10_ssp585=ones(126,102,160);

d_duration_m1_ssp585=ones(126,102,160);
d_duration_m2_ssp585=ones(126,102,160);
d_duration_m3_ssp585=ones(126,102,160);
d_duration_m4_ssp585=ones(126,102,160);
d_duration_m5_ssp585=ones(126,102,160);
d_duration_m6_ssp585=ones(126,102,160);
d_duration_m7_ssp585=ones(126,102,160);
d_duration_m8_ssp585=ones(126,102,160);
d_duration_m9_ssp585=ones(126,102,160);
d_duration_m10_ssp585=ones(126,102,160);

d_severity_m1_ssp585=ones(126,102,160);
d_severity_m2_ssp585=ones(126,102,160);
d_severity_m3_ssp585=ones(126,102,160);
d_severity_m4_ssp585=ones(126,102,160);
d_severity_m5_ssp585=ones(126,102,160);
d_severity_m6_ssp585=ones(126,102,160);
d_severity_m7_ssp585=ones(126,102,160);
d_severity_m8_ssp585=ones(126,102,160);
d_severity_m9_ssp585=ones(126,102,160);
d_severity_m10_ssp585=ones(126,102,160);






for i=1:160
    for j=1:126
        for k=1:102
            d_frequency_m1_ssp126(j,k,i)=sum(m1_d_ssp126(j,k,1+(i-1)*12:i*12)>0);
            d_frequency_m2_ssp126(j,k,i)=sum(m2_d_ssp126(j,k,1+(i-1)*12:i*12)>0);
            d_frequency_m3_ssp126(j,k,i)=sum(m3_d_ssp126(j,k,1+(i-1)*12:i*12)>0);
            d_frequency_m4_ssp126(j,k,i)=sum(m4_d_ssp126(j,k,1+(i-1)*12:i*12)>0);
            d_frequency_m5_ssp126(j,k,i)=sum(m5_d_ssp126(j,k,1+(i-1)*12:i*12)>0);
            d_frequency_m6_ssp126(j,k,i)=sum(m6_d_ssp126(j,k,1+(i-1)*12:i*12)>0);
            d_frequency_m7_ssp126(j,k,i)=sum(m7_d_ssp126(j,k,1+(i-1)*12:i*12)>0);
            d_frequency_m8_ssp126(j,k,i)=sum(m8_d_ssp126(j,k,1+(i-1)*12:i*12)>0);
            d_frequency_m9_ssp126(j,k,i)=sum(m9_d_ssp126(j,k,1+(i-1)*12:i*12)>0);
            d_frequency_m10_ssp126(j,k,i)=sum(m10_d_ssp126(j,k,1+(i-1)*12:i*12)>0);
            d_duration_m1_ssp126(j,k,i)=d_duration(m1_d_ssp126(j,k,1+(i-1)*12:i*12));
            d_duration_m2_ssp126(j,k,i)=d_duration(m2_d_ssp126(j,k,1+(i-1)*12:i*12));
            d_duration_m3_ssp126(j,k,i)=d_duration(m3_d_ssp126(j,k,1+(i-1)*12:i*12));
            d_duration_m4_ssp126(j,k,i)=d_duration(m4_d_ssp126(j,k,1+(i-1)*12:i*12));
            d_duration_m5_ssp126(j,k,i)=d_duration(m5_d_ssp126(j,k,1+(i-1)*12:i*12));
            d_duration_m6_ssp126(j,k,i)=d_duration(m6_d_ssp126(j,k,1+(i-1)*12:i*12));
            d_duration_m7_ssp126(j,k,i)=d_duration(m7_d_ssp126(j,k,1+(i-1)*12:i*12));
            d_duration_m8_ssp126(j,k,i)=d_duration(m8_d_ssp126(j,k,1+(i-1)*12:i*12));
            d_duration_m9_ssp126(j,k,i)=d_duration(m9_d_ssp126(j,k,1+(i-1)*12:i*12));
            d_duration_m10_ssp126(j,k,i)=d_duration(m10_d_ssp126(j,k,1+(i-1)*12:i*12));
            temp=m1_d_ssp126(j,k,1+(i-1)*12:i*12);
            d_severity_m1_ssp126(j,k,i)=mean(temp(temp>0));
            clear temp
            temp=m2_d_ssp126(j,k,1+(i-1)*12:i*12);
            d_severity_m2_ssp126(j,k,i)=mean(temp(temp>0));
            clear temp
            temp=m3_d_ssp126(j,k,1+(i-1)*12:i*12);
            d_severity_m3_ssp126(j,k,i)=mean(temp(temp>0));
            clear temp
            temp=m4_d_ssp126(j,k,1+(i-1)*12:i*12);
            d_severity_m4_ssp126(j,k,i)=mean(temp(temp>0));
            clear temp
            temp=m5_d_ssp126(j,k,1+(i-1)*12:i*12);
            d_severity_m5_ssp126(j,k,i)=mean(temp(temp>0));
            clear temp
            temp=m6_d_ssp126(j,k,1+(i-1)*12:i*12);
            d_severity_m6_ssp126(j,k,i)=mean(temp(temp>0));
            clear temp
            temp=m7_d_ssp126(j,k,1+(i-1)*12:i*12);
            d_severity_m7_ssp126(j,k,i)=mean(temp(temp>0));
            clear temp
            temp=m8_d_ssp126(j,k,1+(i-1)*12:i*12);
            d_severity_m8_ssp126(j,k,i)=mean(temp(temp>0));
            clear temp
            temp=m9_d_ssp126(j,k,1+(i-1)*12:i*12);
            d_severity_m9_ssp126(j,k,i)=mean(temp(temp>0));
            clear temp
            temp=m10_d_ssp126(j,k,1+(i-1)*12:i*12);
            d_severity_m10_ssp126(j,k,i)=mean(temp(temp>0));
            clear temp
            d_frequency_m1_ssp370(j,k,i)=sum(m1_d_ssp370(j,k,1+(i-1)*12:i*12)>0);
            d_frequency_m2_ssp370(j,k,i)=sum(m2_d_ssp370(j,k,1+(i-1)*12:i*12)>0);
            d_frequency_m3_ssp370(j,k,i)=sum(m3_d_ssp370(j,k,1+(i-1)*12:i*12)>0);
            d_frequency_m4_ssp370(j,k,i)=sum(m4_d_ssp370(j,k,1+(i-1)*12:i*12)>0);
            d_frequency_m5_ssp370(j,k,i)=sum(m5_d_ssp370(j,k,1+(i-1)*12:i*12)>0);
            d_frequency_m6_ssp370(j,k,i)=sum(m6_d_ssp370(j,k,1+(i-1)*12:i*12)>0);
            d_frequency_m7_ssp370(j,k,i)=sum(m7_d_ssp370(j,k,1+(i-1)*12:i*12)>0);
            d_frequency_m8_ssp370(j,k,i)=sum(m8_d_ssp370(j,k,1+(i-1)*12:i*12)>0);
            d_frequency_m9_ssp370(j,k,i)=sum(m9_d_ssp370(j,k,1+(i-1)*12:i*12)>0);
            d_frequency_m10_ssp370(j,k,i)=sum(m10_d_ssp370(j,k,1+(i-1)*12:i*12)>0);
            d_duration_m1_ssp370(j,k,i)=d_duration(m1_d_ssp370(j,k,1+(i-1)*12:i*12));
            d_duration_m2_ssp370(j,k,i)=d_duration(m2_d_ssp370(j,k,1+(i-1)*12:i*12));
            d_duration_m3_ssp370(j,k,i)=d_duration(m3_d_ssp370(j,k,1+(i-1)*12:i*12));
            d_duration_m4_ssp370(j,k,i)=d_duration(m4_d_ssp370(j,k,1+(i-1)*12:i*12));
            d_duration_m5_ssp370(j,k,i)=d_duration(m5_d_ssp370(j,k,1+(i-1)*12:i*12));
            d_duration_m6_ssp370(j,k,i)=d_duration(m6_d_ssp370(j,k,1+(i-1)*12:i*12));
            d_duration_m7_ssp370(j,k,i)=d_duration(m7_d_ssp370(j,k,1+(i-1)*12:i*12));
            d_duration_m8_ssp370(j,k,i)=d_duration(m8_d_ssp370(j,k,1+(i-1)*12:i*12));
            d_duration_m9_ssp370(j,k,i)=d_duration(m9_d_ssp370(j,k,1+(i-1)*12:i*12));
            d_duration_m10_ssp370(j,k,i)=d_duration(m10_d_ssp370(j,k,1+(i-1)*12:i*12));
            temp=m1_d_ssp370(j,k,1+(i-1)*12:i*12);
            d_severity_m1_ssp370(j,k,i)=mean(temp(temp>0));
            clear temp
            temp=m2_d_ssp370(j,k,1+(i-1)*12:i*12);
            d_severity_m2_ssp370(j,k,i)=mean(temp(temp>0));
            clear temp
            temp=m3_d_ssp370(j,k,1+(i-1)*12:i*12);
            d_severity_m3_ssp370(j,k,i)=mean(temp(temp>0));
            clear temp
            temp=m4_d_ssp370(j,k,1+(i-1)*12:i*12);
            d_severity_m4_ssp370(j,k,i)=mean(temp(temp>0));
            clear temp
            temp=m5_d_ssp370(j,k,1+(i-1)*12:i*12);
            d_severity_m5_ssp370(j,k,i)=mean(temp(temp>0));
            clear temp
            temp=m6_d_ssp370(j,k,1+(i-1)*12:i*12);
            d_severity_m6_ssp370(j,k,i)=mean(temp(temp>0));
            clear temp
            temp=m7_d_ssp370(j,k,1+(i-1)*12:i*12);
            d_severity_m7_ssp370(j,k,i)=mean(temp(temp>0));
            clear temp
            temp=m8_d_ssp370(j,k,1+(i-1)*12:i*12);
            d_severity_m8_ssp370(j,k,i)=mean(temp(temp>0));
            clear temp
            temp=m9_d_ssp370(j,k,1+(i-1)*12:i*12);
            d_severity_m9_ssp370(j,k,i)=mean(temp(temp>0));
            clear temp
            temp=m10_d_ssp370(j,k,1+(i-1)*12:i*12);
            d_severity_m10_ssp370(j,k,i)=mean(temp(temp>0));
            clear temp
            d_frequency_m1_ssp585(j,k,i)=sum(m1_d_ssp585(j,k,1+(i-1)*12:i*12)>0);
            d_frequency_m2_ssp585(j,k,i)=sum(m2_d_ssp585(j,k,1+(i-1)*12:i*12)>0);
            d_frequency_m3_ssp585(j,k,i)=sum(m3_d_ssp585(j,k,1+(i-1)*12:i*12)>0);
            d_frequency_m4_ssp585(j,k,i)=sum(m4_d_ssp585(j,k,1+(i-1)*12:i*12)>0);
            d_frequency_m5_ssp585(j,k,i)=sum(m5_d_ssp585(j,k,1+(i-1)*12:i*12)>0);
            d_frequency_m6_ssp585(j,k,i)=sum(m6_d_ssp585(j,k,1+(i-1)*12:i*12)>0);
            d_frequency_m7_ssp585(j,k,i)=sum(m7_d_ssp585(j,k,1+(i-1)*12:i*12)>0);
            d_frequency_m8_ssp585(j,k,i)=sum(m8_d_ssp585(j,k,1+(i-1)*12:i*12)>0);
            d_frequency_m9_ssp585(j,k,i)=sum(m9_d_ssp585(j,k,1+(i-1)*12:i*12)>0);
            d_frequency_m10_ssp585(j,k,i)=sum(m10_d_ssp585(j,k,1+(i-1)*12:i*12)>0);
            d_duration_m1_ssp585(j,k,i)=d_duration(m1_d_ssp585(j,k,1+(i-1)*12:i*12));
            d_duration_m2_ssp585(j,k,i)=d_duration(m2_d_ssp585(j,k,1+(i-1)*12:i*12));
            d_duration_m3_ssp585(j,k,i)=d_duration(m3_d_ssp585(j,k,1+(i-1)*12:i*12));
            d_duration_m4_ssp585(j,k,i)=d_duration(m4_d_ssp585(j,k,1+(i-1)*12:i*12));
            d_duration_m5_ssp585(j,k,i)=d_duration(m5_d_ssp585(j,k,1+(i-1)*12:i*12));
            d_duration_m6_ssp585(j,k,i)=d_duration(m6_d_ssp585(j,k,1+(i-1)*12:i*12));
            d_duration_m7_ssp585(j,k,i)=d_duration(m7_d_ssp585(j,k,1+(i-1)*12:i*12));
            d_duration_m8_ssp585(j,k,i)=d_duration(m8_d_ssp585(j,k,1+(i-1)*12:i*12));
            d_duration_m9_ssp585(j,k,i)=d_duration(m9_d_ssp585(j,k,1+(i-1)*12:i*12));
            d_duration_m10_ssp585(j,k,i)=d_duration(m10_d_ssp585(j,k,1+(i-1)*12:i*12));
            temp=m1_d_ssp585(j,k,1+(i-1)*12:i*12);
            d_severity_m1_ssp585(j,k,i)=mean(temp(temp>0));
            clear temp
            temp=m2_d_ssp585(j,k,1+(i-1)*12:i*12);
            d_severity_m2_ssp585(j,k,i)=mean(temp(temp>0));
            clear temp
            temp=m3_d_ssp585(j,k,1+(i-1)*12:i*12);
            d_severity_m3_ssp585(j,k,i)=mean(temp(temp>0));
            clear temp
            temp=m4_d_ssp585(j,k,1+(i-1)*12:i*12);
            d_severity_m4_ssp585(j,k,i)=mean(temp(temp>0));
            clear temp
            temp=m5_d_ssp585(j,k,1+(i-1)*12:i*12);
            d_severity_m5_ssp585(j,k,i)=mean(temp(temp>0));
            clear temp
            temp=m6_d_ssp585(j,k,1+(i-1)*12:i*12);
            d_severity_m6_ssp585(j,k,i)=mean(temp(temp>0));
            clear temp
            temp=m7_d_ssp585(j,k,1+(i-1)*12:i*12);
            d_severity_m7_ssp585(j,k,i)=mean(temp(temp>0));
            clear temp
            temp=m8_d_ssp585(j,k,1+(i-1)*12:i*12);
            d_severity_m8_ssp585(j,k,i)=mean(temp(temp>0));
            clear temp
            temp=m9_d_ssp585(j,k,1+(i-1)*12:i*12);
            d_severity_m9_ssp585(j,k,i)=mean(temp(temp>0));
            clear temp
            temp=m10_d_ssp585(j,k,1+(i-1)*12:i*12);
            d_severity_m10_ssp585(j,k,i)=mean(temp(temp>0));
            clear temp
        end
    end
end



ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m1_d_frequency_ssp126.nc", 'tws', d_frequency_m1_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m2_d_frequency_ssp126.nc", 'tws', d_frequency_m2_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m3_d_frequency_ssp126.nc", 'tws', d_frequency_m3_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m4_d_frequency_ssp126.nc", 'tws', d_frequency_m4_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m5_d_frequency_ssp126.nc", 'tws', d_frequency_m5_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m6_d_frequency_ssp126.nc", 'tws', d_frequency_m6_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m7_d_frequency_ssp126.nc", 'tws', d_frequency_m7_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m8_d_frequency_ssp126.nc", 'tws', d_frequency_m8_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m9_d_frequency_ssp126.nc", 'tws', d_frequency_m9_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m10_d_frequency_ssp126.nc", 'tws', d_frequency_m10_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m1_d_duration_ssp126.nc", 'tws', d_duration_m1_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m2_d_duration_ssp126.nc", 'tws', d_duration_m2_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m3_d_duration_ssp126.nc", 'tws', d_duration_m3_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m4_d_duration_ssp126.nc", 'tws', d_duration_m4_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m5_d_duration_ssp126.nc", 'tws', d_duration_m5_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m6_d_duration_ssp126.nc", 'tws', d_duration_m6_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m7_d_duration_ssp126.nc", 'tws', d_duration_m7_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m8_d_duration_ssp126.nc", 'tws', d_duration_m8_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m9_d_duration_ssp126.nc", 'tws', d_duration_m9_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m10_d_duration_ssp126.nc", 'tws', d_duration_m10_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m1_d_severity_ssp126.nc", 'tws', d_severity_m1_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m2_d_severity_ssp126.nc", 'tws', d_severity_m2_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m3_d_severity_ssp126.nc", 'tws', d_severity_m3_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m4_d_severity_ssp126.nc", 'tws', d_severity_m4_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m5_d_severity_ssp126.nc", 'tws', d_severity_m5_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m6_d_severity_ssp126.nc", 'tws', d_severity_m6_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m7_d_severity_ssp126.nc", 'tws', d_severity_m7_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m8_d_severity_ssp126.nc", 'tws', d_severity_m8_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m9_d_severity_ssp126.nc", 'tws', d_severity_m9_ssp126);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m10_d_severity_ssp126.nc", 'tws', d_severity_m10_ssp126);

ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m1_d_frequency_ssp370.nc", 'tws', d_frequency_m1_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m2_d_frequency_ssp370.nc", 'tws', d_frequency_m2_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m3_d_frequency_ssp370.nc", 'tws', d_frequency_m3_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m4_d_frequency_ssp370.nc", 'tws', d_frequency_m4_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m5_d_frequency_ssp370.nc", 'tws', d_frequency_m5_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m6_d_frequency_ssp370.nc", 'tws', d_frequency_m6_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m7_d_frequency_ssp370.nc", 'tws', d_frequency_m7_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m8_d_frequency_ssp370.nc", 'tws', d_frequency_m8_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m9_d_frequency_ssp370.nc", 'tws', d_frequency_m9_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m10_d_frequency_ssp370.nc", 'tws', d_frequency_m10_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m1_d_duration_ssp370.nc", 'tws', d_duration_m1_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m2_d_duration_ssp370.nc", 'tws', d_duration_m2_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m3_d_duration_ssp370.nc", 'tws', d_duration_m3_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m4_d_duration_ssp370.nc", 'tws', d_duration_m4_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m5_d_duration_ssp370.nc", 'tws', d_duration_m5_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m6_d_duration_ssp370.nc", 'tws', d_duration_m6_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m7_d_duration_ssp370.nc", 'tws', d_duration_m7_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m8_d_duration_ssp370.nc", 'tws', d_duration_m8_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m9_d_duration_ssp370.nc", 'tws', d_duration_m9_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m10_d_duration_ssp370.nc", 'tws', d_duration_m10_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m1_d_severity_ssp370.nc", 'tws', d_severity_m1_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m2_d_severity_ssp370.nc", 'tws', d_severity_m2_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m3_d_severity_ssp370.nc", 'tws', d_severity_m3_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m4_d_severity_ssp370.nc", 'tws', d_severity_m4_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m5_d_severity_ssp370.nc", 'tws', d_severity_m5_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m6_d_severity_ssp370.nc", 'tws', d_severity_m6_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m7_d_severity_ssp370.nc", 'tws', d_severity_m7_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m8_d_severity_ssp370.nc", 'tws', d_severity_m8_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m9_d_severity_ssp370.nc", 'tws', d_severity_m9_ssp370);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m10_d_severity_ssp370.nc", 'tws', d_severity_m10_ssp370);

ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m1_d_frequency_ssp585.nc", 'tws', d_frequency_m1_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m2_d_frequency_ssp585.nc", 'tws', d_frequency_m2_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m3_d_frequency_ssp585.nc", 'tws', d_frequency_m3_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m4_d_frequency_ssp585.nc", 'tws', d_frequency_m4_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m5_d_frequency_ssp585.nc", 'tws', d_frequency_m5_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m6_d_frequency_ssp585.nc", 'tws', d_frequency_m6_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m7_d_frequency_ssp585.nc", 'tws', d_frequency_m7_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m8_d_frequency_ssp585.nc", 'tws', d_frequency_m8_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m9_d_frequency_ssp585.nc", 'tws', d_frequency_m9_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m10_d_frequency_ssp585.nc", 'tws', d_frequency_m10_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m1_d_duration_ssp585.nc", 'tws', d_duration_m1_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m2_d_duration_ssp585.nc", 'tws', d_duration_m2_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m3_d_duration_ssp585.nc", 'tws', d_duration_m3_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m4_d_duration_ssp585.nc", 'tws', d_duration_m4_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m5_d_duration_ssp585.nc", 'tws', d_duration_m5_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m6_d_duration_ssp585.nc", 'tws', d_duration_m6_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m7_d_duration_ssp585.nc", 'tws', d_duration_m7_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m8_d_duration_ssp585.nc", 'tws', d_duration_m8_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m9_d_duration_ssp585.nc", 'tws', d_duration_m9_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m10_d_duration_ssp585.nc", 'tws', d_duration_m10_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m1_d_severity_ssp585.nc", 'tws', d_severity_m1_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m2_d_severity_ssp585.nc", 'tws', d_severity_m2_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m3_d_severity_ssp585.nc", 'tws', d_severity_m3_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m4_d_severity_ssp585.nc", 'tws', d_severity_m4_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m5_d_severity_ssp585.nc", 'tws', d_severity_m5_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m6_d_severity_ssp585.nc", 'tws', d_severity_m6_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m7_d_severity_ssp585.nc", 'tws', d_severity_m7_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m8_d_severity_ssp585.nc", 'tws', d_severity_m8_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m9_d_severity_ssp585.nc", 'tws', d_severity_m9_ssp585);
ncwrite("C:\Users\yaoxin\Desktop\ISIMIP3b\D_index_yearly\m10_d_severity_ssp585.nc", 'tws', d_severity_m10_ssp585);







