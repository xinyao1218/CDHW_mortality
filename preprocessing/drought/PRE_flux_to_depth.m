clear
clc

pre_data_his = ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\mme_pre_month\mme_his_pre_month.nc", 'pr');
pre_data_ssp126 = ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\mme_pre_month\mme_ssp126_pre_month.nc", 'pr');
pre_data_ssp370 = ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\mme_pre_month\mme_ssp370_pre_month.nc", 'pr');
pre_data_ssp585 = ncread("C:\Users\yaoxin\Desktop\ISIMIP3b\mme_pre_month\mme_ssp585_pre_month.nc", 'pr');

pre_data_his=pre_data_his.*86400;
pre_data_ssp126=pre_data_ssp126.*86400;
pre_data_ssp370=pre_data_ssp370.*86400;
pre_data_ssp585=pre_data_ssp585.*86400;


pre_data_his(pre_data_his<0)=0;
pre_data_ssp126(pre_data_ssp126<0)=0;
pre_data_ssp370(pre_data_ssp370<0)=0;
pre_data_ssp585(pre_data_ssp585<0)=0;

ncwrite('C:\Users\yaoxin\Desktop\ISIMIP3b\mme_pre_month_mm\mme_his_pre_mm_month.nc', 'pr', pre_data_his);
ncwrite('C:\Users\yaoxin\Desktop\ISIMIP3b\mme_pre_month_mm\mme_ssp126_pre_mm_month.nc', 'pr', pre_data_ssp126);
ncwrite('C:\Users\yaoxin\Desktop\ISIMIP3b\mme_pre_month_mm\mme_ssp370_pre_mm_month.nc', 'pr', pre_data_ssp370);
ncwrite('C:\Users\yaoxin\Desktop\ISIMIP3b\mme_pre_month_mm\mme_ssp585_pre_mm_month.nc', 'pr', pre_data_ssp585);
