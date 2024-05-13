clear
clc

folder_path = 'C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\data\TWS_verification';

twsa_info = dir(fullfile(folder_path, '*.nc'));
names = {twsa_info.name};
paths = fullfile(folder_path, names);

data=ones(2013,1540);

for i=1:10
    temp=ncread(paths{i}, 'tws');
    temp=reshape(temp,[],140);
    data(:,1+(i-1)*140:i*140)=temp;
end
temp=ncread(paths{11}, 'lwe_thickness');
temp=reshape(temp,[],140);
data(:,1401:1540)=temp;

data(isnan(data(:,1)),:)=[];

results=ones(1671,10);

for i=1:10
    for j=1:1671
        results(j,i)=corr(data(j,1+(i-1)*140:i*140)',data(j,1401:1540)');
    end
end

p=mean(results);
pp=p./(sum(p));


data_new=ones(1671,140);
data_pnew=ones(1671,140);
results_new=ones(1671,2);

for i=1:140
    for j=1:1671
        data_new(j,i)=mean([data(j,i) data(j,i+140*1) data(j,i+140*2) data(j,i+140*3) data(j,i+140*4) data(j,i+140*5) data(j,i+140*6) data(j,i+140*7) data(j,i+140*8) data(j,i+140*9)]);
        data_pnew(j,i)=data(j,i)*pp(1)+data(j,i+140*1)*pp(2)+data(j,i+140*2)*pp(3)+data(j,i+140*3)*pp(4)+data(j,i+140*4)*pp(5)+data(j,i+140*5)*pp(6)+data(j,i+140*6)*pp(7)+data(j,i+140*7)*pp(8)+data(j,i+140*8)*pp(9)+data(j,i+140*9)*pp(10);
    end
end

for i=1:1671
    results_new(i,1)=corr(data_new(i,1:140)',data(i,1401:1540)');
    results_new(i,2)=corr(data_pnew(i,1:140)',data(i,1401:1540)');
end

key=[results results_new];

mean(key)


figure('Position', [100, 100, 2400, 1200])
edgecolor1=[0,0,0]; % black color
edgecolor2=[0,0,0]; % black color
fillcolor1=[206, 85, 30]/255; % fillcolors = rand(24, 3);
fillcolor2=[46, 114, 188]/255;
fillcolor3=[32, 150, 50]/255;
fillcolors=[repmat(fillcolor3,2,1);repmat(fillcolor1,5,1);repmat(fillcolor2,5,1);];
h= boxplot(key,'colors',edgecolor1,'width',0.2,'notch','on','Labels', {'GFDL-ESM4', 'IPSL-CM6A-LR', 'MPI-ESM1-2-HR', 'MRI-ESM2-0', 'UKESM1-0-LL', 'GFDL-ESM4', 'IPSL-CM6A-LR', 'MPI-ESM1-2-HR', 'MRI-ESM2-0', 'UKESM1-0-LL','Arithmetic Mean','Weighted Mean'});
hTitle = title('Validation of GCM-THM TWS Simulations with GRACE Satellite Measurements');
hYLabel = ylabel('Pearson Correlation Coefficient');
set(h,'LineWidth',1.5)
boxobj = findobj(gca,'Tag','Box');
for j=1:length(boxobj)
    patch(get(boxobj(j),'XData'),get(boxobj(j),'YData'),fillcolors(j,:),'FaceAlpha',0.5);
end
set(gca,'XTick', [1 2 3 4 5 6 7 8 9 10 11 12],'Xlim',[0 13]);
set(gca,'YTick', [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0],'Ylim',[0.05 1.05]);
boxchi = get(gca, 'Children');
legend([boxchi(1),boxchi(6),boxchi(11)], ["THM:CWATM", "THM:H08","Multi-model Mean"], 'Location', 'southeast');
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
print(gcf, 'C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\figure\sf_verification\tws_validation.jpg', '-djpeg', ['-r', num2str(dpi)]);













