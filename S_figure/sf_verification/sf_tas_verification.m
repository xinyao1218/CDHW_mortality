clear
clc

folder_path = 'C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\data\TAS_verification';

tasmean_info = dir(fullfile(folder_path, '*.nc'));
names = {tasmean_info.name};
paths = fullfile(folder_path, names);

litedata=csvread('C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\data\TAS_verification\meantem_wide.csv');

row=ceil((litedata(:,4)-75).*2);
col=ceil((53-litedata(:,3)).*2);
year=litedata(:,2);
tasmean_lite=litedata(:,5:369);
tasmean_gcm=ones(14337*5,365);

for i=1:5
    temp=ncread(paths{i}, 'tas');
    for j=1:14337
        tas_temp=temp(row(j),col(j),(year(j)-1941)*365+1:(year(j)-1940)*365);
        tasmean_gcm((i-1)*14337+j,:)=reshape(tas_temp,[],365);
    end
end

results=ones(14337,5);

for i=1:5
    for j=1:14337
        results(j,i)=corr(tasmean_lite(j,:)',tasmean_gcm((i-1)*14337+j,:)');
    end
end

p=mean(results);
pp=p./(sum(p));


data_new=ones(14337,365);
data_pnew=ones(14337,365);
results_new=ones(14337,2);

for i=1:365
    for j=1:14337
        data_new(j,i)=mean([tasmean_gcm(j+0*14337,i) tasmean_gcm(j+1*14337,i) tasmean_gcm(j+2*14337,i) tasmean_gcm(j+3*14337,i) tasmean_gcm(j+4*14337,i)]);
        data_pnew(j,i)=tasmean_gcm(j+0*14337,i)*pp(1)+tasmean_gcm(j+1*14337,i)*pp(2)+tasmean_gcm(j+2*14337,i)*pp(3)+tasmean_gcm(j+3*14337,i)*pp(4)+tasmean_gcm(j+4*14337,i)*pp(5);
    end
end


for i=1:14337
    results_new(i,1)=corr(data_new(i,:)',tasmean_lite(i,:)');
    results_new(i,2)=corr(data_pnew(i,:)',tasmean_lite(i,:)');
end

key=[results results_new];

mean(key)

figure('Position', [100, 100, 2400, 1200])
edgecolor1=[0,0,0]; % black color
edgecolor2=[0,0,0]; % black color
fillcolor1=[1 0.64706 0];
fillcolor6=[32, 150, 50]/255;
fillcolors=[repmat(fillcolor6,2,1);repmat(fillcolor1,5,1)];
h= boxplot(key,'colors',edgecolor1,'width',0.15,'notch','on','Labels', {'GFDL-ESM4', 'IPSL-CM6A-LR', 'MPI-ESM1-2-HR', 'MRI-ESM2-0', 'UKESM1-0-LL', 'Arithmetic Mean','Weighted Mean'},'Symbol','.','outliersize',3);
hTitle = title('Validation of GCM TAS Mean Simulations with Meteorological Station Data');
hYLabel = ylabel('Pearson Correlation Coefficient');
set(h,'LineWidth',1.5)
boxobj = findobj(gca,'Tag','Box');
for j=1:length(boxobj)
    patch(get(boxobj(j),'XData'),get(boxobj(j),'YData'),fillcolors(j,:),'FaceAlpha',0.5);
end
set(gca,'XTick', [1 2 3 4 5 6 7],'Xlim',[0 8]);
set(gca,'YTick', [0.5 0.6 0.7 0.8 0.9 1.0],'Ylim',[0.45 1.05]);
boxchi = get(gca, 'Children');
legend([boxchi(1),boxchi(6)], ["GCM", "Multi-model Mean"], 'Location', 'southeast');
set(gca, 'Box', 'on', ...                                
'LineWidth', 1,...                                       
'XGrid', 'off', 'YGrid', 'off', ...                      
'TickDir', 'in', 'TickLength', [.01 .01], ...          
'XMinorTick', 'off', 'YMinorTick', 'off', ...            
'XColor', [.1 .1 .1],  'YColor', [.1 .1 .1])             

set(gca, 'FontName', 'Helvetica')
set(hYLabel, 'FontName', 'Times New Roman')
set(gca, 'FontSize', 30)
set( hYLabel, 'FontSize', 40, 'FontWeight' , 'bold')
set(hTitle, 'FontName', 'Times New Roman', 'FontSize', 42, 'FontWeight' , 'bold')

set(gcf,'Color',[1 1 1])
dpi = 300;  
print(gcf, 'C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\figure\sf_verification\tas_validation.jpg', '-djpeg', ['-r', num2str(dpi)]);

