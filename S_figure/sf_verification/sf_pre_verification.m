clear
clc

folder_path = 'C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\data\PRE_verification';

pre_info = dir(fullfile(folder_path, '*.nc'));
names = {pre_info.name};
paths = fullfile(folder_path, names);

litedata=csvread('C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\data\PRE_verification\pre_wide.csv');

row=ceil((litedata(:,4)-75).*2);
col=ceil((53-litedata(:,3)).*2);
year=litedata(:,2);
pre_lite=litedata(:,5:369);
pre_gcm=ones(6072*5,365);

for i=1:5
    temp=ncread(paths{i}, 'pr');
    for j=1:6072
        pre_temp=temp(row(j),col(j),(year(j)-1941)*365+1:(year(j)-1940)*365);
        pre_gcm((i-1)*6072+j,:)=reshape(pre_temp,[],365);
    end
end

results=ones(6072,5);

for i=1:5
    for j=1:6072
        results(j,i)=corr(pre_lite(j,:)',pre_gcm((i-1)*6072+j,:)');
    end
end

p=mean(results);
pp=p./(sum(p));


data_new=ones(6072,365);
data_pnew=ones(6072,365);
results_new=ones(6072,2);

for i=1:365
    for j=1:6072
        data_new(j,i)=mean([pre_gcm(j+0*6072,i) pre_gcm(j+1*6072,i) pre_gcm(j+2*6072,i) pre_gcm(j+3*6072,i) pre_gcm(j+4*6072,i)]);
        data_pnew(j,i)=pre_gcm(j+0*6072,i)*pp(1)+pre_gcm(j+1*6072,i)*pp(2)+pre_gcm(j+2*6072,i)*pp(3)+pre_gcm(j+3*6072,i)*pp(4)+pre_gcm(j+4*6072,i)*pp(5);
    end
end


for i=1:6072
    results_new(i,1)=corr(data_new(i,:)',pre_lite(i,:)');
    results_new(i,2)=corr(data_pnew(i,:)',pre_lite(i,:)');
end

key=[results results_new];

mean(key)

figure('Position', [100, 100, 2400, 1200])
edgecolor1=[0,0,0]; % black color
edgecolor2=[0,0,0]; % black color
fillcolor1=[0.06275 0.30588 0.5451];
fillcolor6=[32, 150, 50]/255;
fillcolors=[repmat(fillcolor6,2,1);repmat(fillcolor1,5,1)];
h= boxplot(key,'colors',edgecolor1,'width',0.15,'notch','on','Labels', {'GFDL-ESM4', 'IPSL-CM6A-LR', 'MPI-ESM1-2-HR', 'MRI-ESM2-0', 'UKESM1-0-LL', 'Arithmetic Mean','Weighted Mean'},'Symbol','.','outliersize',3);
hTitle = title('Validation of GCM Precipitation Simulations with Meteorological Station Data');
hYLabel = ylabel('Pearson Correlation Coefficient');
set(h,'LineWidth',1.5)
boxobj = findobj(gca,'Tag','Box');
for j=1:length(boxobj)
    patch(get(boxobj(j),'XData'),get(boxobj(j),'YData'),fillcolors(j,:),'FaceAlpha',0.5);
end
set(gca,'XTick', [1 2 3 4 5 6 7],'Xlim',[0 8]);
set(gca,'YTick', [0.3 0.4 0.5 0.6 0.7 0.8 0.9],'Ylim',[0.25 0.95]);
boxchi = get(gca, 'Children');
legend([boxchi(1),boxchi(6)], ["GCM", "Multi-model Mean"], 'Location', 'southeast');
set(gca, 'Box', 'on', ...                                % 边框
'LineWidth', 1,...                                       % 线宽
'XGrid', 'off', 'YGrid', 'off', ...                      % 网格
'TickDir', 'in', 'TickLength', [.01 .01], ...          % 刻度
'XMinorTick', 'off', 'YMinorTick', 'off', ...            % 小刻度
'XColor', [.1 .1 .1],  'YColor', [.1 .1 .1])             % 坐标轴颜色
% 字体和字号
set(gca, 'FontName', 'Helvetica')
set(hYLabel, 'FontName', 'Times New Roman')
set(gca, 'FontSize', 30)
set( hYLabel, 'FontSize', 40, 'FontWeight' , 'bold')
set(hTitle, 'FontName', 'Times New Roman', 'FontSize', 42, 'FontWeight' , 'bold')
% 背景颜色
set(gcf,'Color',[1 1 1])
dpi = 300;  
print(gcf, 'C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\figure\sf_verification\pr_validation.jpg', '-djpeg', ['-r', num2str(dpi)]);

