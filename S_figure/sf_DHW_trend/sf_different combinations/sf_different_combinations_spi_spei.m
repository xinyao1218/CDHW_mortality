clear
clc

folder_path = 'C:\Users\yaoxin\Desktop\ISIMIP3b\CDHW_index_yearly';


frequency_ssp126_info = dir(fullfile(folder_path, '*frequency_99_spei_4_ssp126.nc'));
frequency_ssp126_names = {frequency_ssp126_info.name};
frequency_ssp126_paths = fullfile(folder_path, frequency_ssp126_names);

frequency_ssp370_info = dir(fullfile(folder_path, '*frequency_99_spei_4_ssp370.nc'));
frequency_ssp370_names = {frequency_ssp370_info.name};
frequency_ssp370_paths = fullfile(folder_path, frequency_ssp370_names);

frequency_ssp585_info = dir(fullfile(folder_path, '*frequency_99_spei_4_ssp585.nc'));
frequency_ssp585_names = {frequency_ssp585_info.name};
frequency_ssp585_paths = fullfile(folder_path, frequency_ssp585_names);



duration_ssp126_info = dir(fullfile(folder_path, '*duration_99_spei_4_ssp126.nc'));
duration_ssp126_names = {duration_ssp126_info.name};
duration_ssp126_paths = fullfile(folder_path, duration_ssp126_names);

duration_ssp370_info = dir(fullfile(folder_path, '*duration_99_spei_4_ssp370.nc'));
duration_ssp370_names = {duration_ssp370_info.name};
duration_ssp370_paths = fullfile(folder_path, duration_ssp370_names);

duration_ssp585_info = dir(fullfile(folder_path, '*duration_99_spei_4_ssp585.nc'));
duration_ssp585_names = {duration_ssp585_info.name};
duration_ssp585_paths = fullfile(folder_path, duration_ssp585_names);





severity_ssp126_info = dir(fullfile(folder_path, '*severity_99_spei_4_ssp126.nc'));
severity_ssp126_names = {severity_ssp126_info.name};
severity_ssp126_paths = fullfile(folder_path, severity_ssp126_names);

severity_ssp370_info = dir(fullfile(folder_path, '*severity_99_spei_4_ssp370.nc'));
severity_ssp370_names = {severity_ssp370_info.name};
severity_ssp370_paths = fullfile(folder_path, severity_ssp370_names);

severity_ssp585_info = dir(fullfile(folder_path, '*severity_99_spei_4_ssp585.nc'));
severity_ssp585_names = {severity_ssp585_info.name};
severity_ssp585_paths = fullfile(folder_path, severity_ssp585_names);




frequency=ones(15,160);
duration=ones(15,160);
severity=ones(15,160);


for i=1:5
    frequency_data=ncread(frequency_ssp126_paths{i}, 'tws');
    frequency_data=frequency_data(1:125,1:72,:);
    for j=1:160
        temp=frequency_data(:,:,j);
        frequency(i,j)=mean(temp(:));
    end
end

for i=6:10
    frequency_data=ncread(frequency_ssp370_paths{i-5}, 'tws');
    frequency_data=frequency_data(1:125,1:72,:);
    for j=1:160
        temp=frequency_data(:,:,j);
        frequency(i,j)=mean(temp(:));
    end
end

for i=11:15
    frequency_data=ncread(frequency_ssp585_paths{i-10}, 'tws');
    frequency_data=frequency_data(1:125,1:72,:);
    for j=1:160
        temp=frequency_data(:,:,j);
        frequency(i,j)=mean(temp(:));
    end
end


for i=1:5
    duration_data=ncread(duration_ssp126_paths{i}, 'tws');
    duration_data=duration_data(1:125,1:72,:);
    for j=1:160
        temp=duration_data(:,:,j);
        duration(i,j)=mean(temp(:));
    end
end

for i=6:10
    duration_data=ncread(duration_ssp370_paths{i-5}, 'tws');
    duration_data=duration_data(1:125,1:72,:);
    for j=1:160
        temp=duration_data(:,:,j);
        duration(i,j)=mean(temp(:));
    end
end

for i=11:15
    duration_data=ncread(duration_ssp585_paths{i-10}, 'tws');
    duration_data=duration_data(1:125,1:72,:);
    for j=1:160
        temp=duration_data(:,:,j);
        duration(i,j)=mean(temp(:));
    end
end


for i=1:5
    severity_data=ncread(severity_ssp126_paths{i}, 'tws');
    severity_data=severity_data(1:125,1:72,:);
    for j=1:160
        temp=severity_data(:,:,j);
        severity(i,j)=mean(temp(:));
    end
end

for i=6:10
    severity_data=ncread(severity_ssp370_paths{i-5}, 'tws');
    severity_data=severity_data(1:125,1:72,:);
    for j=1:160
        temp=severity_data(:,:,j);
        severity(i,j)=mean(temp(:));
    end
end

for i=11:15
    severity_data=ncread(severity_ssp585_paths{i-10}, 'tws');
    severity_data=severity_data(1:125,1:72,:);
    for j=1:160
        temp=severity_data(:,:,j);
        severity(i,j)=mean(temp(:));
    end
end


clear frequency_ssp126_info frequency_ssp126_names frequency_ssp126_paths
clear frequency_ssp370_info frequency_ssp370_names frequency_ssp370_paths
clear frequency_ssp585_info frequency_ssp585_names frequency_ssp585_paths
clear duration_ssp126_info duration_ssp126_names duration_ssp126_paths
clear duration_ssp370_info duration_ssp370_names duration_ssp370_paths
clear duration_ssp585_info duration_ssp585_names duration_ssp585_paths
clear severity_ssp126_info severity_ssp126_names severity_ssp126_paths
clear severity_ssp370_info severity_ssp370_names severity_ssp370_paths
clear severity_ssp585_info severity_ssp585_names severity_ssp585_paths
clear frequency_data duration_data severity_data temp folder_path i j



frequency_ssp126_mean=mean(frequency(1:5,1:160));
frequency_ssp126_std=std(frequency(1:5,1:160),0);
frequency_ssp370_mean=mean(frequency(6:10,1:160));
frequency_ssp370_std=std(frequency(6:10,1:160),0);
frequency_ssp585_mean=mean(frequency(11:15,1:160));
frequency_ssp585_std=std(frequency(11:15,1:160),0);
frequency_ssp126_lower=frequency_ssp126_mean-frequency_ssp126_std.*1.96;
frequency_ssp126_upper=frequency_ssp126_mean+frequency_ssp126_std.*1.96;
frequency_ssp370_lower=frequency_ssp370_mean-frequency_ssp370_std.*1.96;
frequency_ssp370_upper=frequency_ssp370_mean+frequency_ssp370_std.*1.96;
frequency_ssp585_lower=frequency_ssp585_mean-frequency_ssp585_std.*1.96;
frequency_ssp585_upper=frequency_ssp585_mean+frequency_ssp585_std.*1.96;


duration_ssp126_mean=mean(duration(1:5,1:160));
duration_ssp126_std=std(duration(1:5,1:160),0);
duration_ssp370_mean=mean(duration(6:10,1:160));
duration_ssp370_std=std(duration(6:10,1:160),0);
duration_ssp585_mean=mean(duration(11:15,1:160));
duration_ssp585_std=std(duration(11:15,1:160),0);
duration_ssp126_lower=duration_ssp126_mean-duration_ssp126_std.*1.96;
duration_ssp126_upper=duration_ssp126_mean+duration_ssp126_std.*1.96;
duration_ssp370_lower=duration_ssp370_mean-duration_ssp370_std.*1.96;
duration_ssp370_upper=duration_ssp370_mean+duration_ssp370_std.*1.96;
duration_ssp585_lower=duration_ssp585_mean-duration_ssp585_std.*1.96;
duration_ssp585_upper=duration_ssp585_mean+duration_ssp585_std.*1.96;



severity_ssp126_mean=mean(severity(1:5,1:160));
severity_ssp126_std=std(severity(1:5,1:160),0);
severity_ssp370_mean=mean(severity(6:10,1:160));
severity_ssp370_std=std(severity(6:10,1:160),0);
severity_ssp585_mean=mean(severity(11:15,1:160));
severity_ssp585_std=std(severity(11:15,1:160),0);
severity_ssp126_lower=severity_ssp126_mean-severity_ssp126_std.*1.96;
severity_ssp126_upper=severity_ssp126_mean+severity_ssp126_std.*1.96;
severity_ssp370_lower=severity_ssp370_mean-severity_ssp370_std.*1.96;
severity_ssp370_upper=severity_ssp370_mean+severity_ssp370_std.*1.96;
severity_ssp585_lower=severity_ssp585_mean-severity_ssp585_std.*1.96;
severity_ssp585_upper=severity_ssp585_mean+severity_ssp585_std.*1.96;


temp(:,1)=(1:74)';
temp(:,2)=frequency_ssp126_mean(1,1:74)';
[taub,~,h,~,~,~,~,~] = ktaub(temp, 0.05);
if h==0
    disp("mk_frequency_his: 0 ")
else 
    if taub>0
    disp("mk_frequency_his: 1 ")
    else
    disp("mk_frequency_his: -1 ")
    end
end
clear temp taub h

temp(:,1)=(1:86)';
temp(:,2)=frequency_ssp126_mean(1,75:160)';
[taub,~,h,~,~,~,~,~] = ktaub(temp, 0.05);
if h==0
    disp("mk_frequency_ssp126: 0 ")
else 
    if taub>0
    disp("mk_frequency_ssp126: 1 ")
    else
    disp("mk_frequency_ssp126: -1 ")
    end
end
clear temp taub h

temp(:,1)=(1:86)';
temp(:,2)=frequency_ssp370_mean(1,75:160)';
[taub,~,h,~,~,~,~,~] = ktaub(temp, 0.05);
if h==0
    disp("mk_frequency_ssp370: 0 ")
else 
    if taub>0
    disp("mk_frequency_ssp370: 1 ")
    else
    disp("mk_frequency_ssp370: -1 ")
    end
end
clear temp taub h

temp(:,1)=(1:86)';
temp(:,2)=frequency_ssp585_mean(1,75:160)';
[taub,~,h,~,~,~,~,~] = ktaub(temp, 0.05);
if h==0
    disp("mk_frequency_ssp585: 0 ")
else 
    if taub>0
    disp("mk_frequency_ssp585: 1 ")
    else
    disp("mk_frequency_ssp585: -1 ")
    end
end
clear temp taub h



figure('Position', [100, 100, 2400, 1200])
my_color=[0.41176, 0.41176, 0.41176; 0.18039, 0.5451, 0.34118; 0.22745, 0.37255, 0.80392; 1, 0.41569, 0.41569];
colormap(my_color);
fill([1941:2014, fliplr(1941:2014)], [frequency_ssp126_lower(1,1:74), fliplr(frequency_ssp126_upper(1,1:74))], 1, 'FaceAlpha', 0.5, 'EdgeColor', 'none')
hold on
fill([2014:2100, fliplr(2014:2100)], [frequency_ssp126_lower(1,74:160), fliplr(frequency_ssp126_upper(1,74:160))], 2, 'FaceAlpha', 0.4, 'EdgeColor', 'none')
hold on
fill([2014:2100, fliplr(2014:2100)], [frequency_ssp370_lower(1,74:160), fliplr(frequency_ssp370_upper(1,74:160))], 3, 'FaceAlpha', 0.4, 'EdgeColor', 'none')
hold on
fill([2014:2100, fliplr(2014:2100)], [frequency_ssp585_lower(1,74:160), fliplr(frequency_ssp585_upper(1,74:160))], 4, 'FaceAlpha', 0.4, 'EdgeColor', 'none')
hold on
plot(1941:2100,frequency_ssp126_mean,'color', [0.18039, 0.5451, 0.34118], 'LineWidth', 4)
hold on
plot(1941:2100,frequency_ssp370_mean,'color', [0.22745, 0.37255, 0.80392], 'LineWidth', 4)
hold on
plot(1941:2100,frequency_ssp585_mean,'color', [1, 0.41569, 0.41569], 'LineWidth', 4)
hold on
plot(1941:2014,frequency_ssp585_mean(1:74),'color', [0.41176, 0.41176, 0.41176], 'LineWidth', 4)
ylim([0, max(frequency_ssp585_upper.*1.2)]);
y_limits = ylim;
hold on
line([1980, 1980], y_limits, 'Color', [0.41176, 0.41176, 0.41176], 'LineStyle', '--');
hold on
line([2014, 2014], y_limits, 'Color', [0.41176, 0.41176, 0.41176], 'LineStyle', '--');
hold on
line([2057, 2057], y_limits, 'Color', [0.41176, 0.41176, 0.41176], 'LineStyle', '--');
hold on
text(1954,5.75/6*y_limits(2),'Historical', 'FontSize', 35, 'FontName', 'Times New Roman')
text(1991,5.75/6*y_limits(2),'Recent', 'FontSize', 35, 'FontName', 'Times New Roman')
text(2025,5.75/6*y_limits(2),'Near-Future', 'FontSize', 35, 'FontName', 'Times New Roman')
text(2070,5.75/6*y_limits(2),'Far-Future', 'FontSize', 35, 'FontName', 'Times New Roman')
hold on
plot([1942.1 1949.1],[5.35/6*y_limits(2) 5.35/6*y_limits(2)],'color', [0.41176, 0.41176, 0.41176], 'LineWidth', 4)
hold on
plot([1986 1993],[5.35/6*y_limits(2) 5.35/6*y_limits(2)],'color', [0.18039, 0.5451, 0.34118], 'LineWidth', 4)
hold on
plot([2024.1 2031.1],[5.35/6*y_limits(2) 5.35/6*y_limits(2)],'color', [0.22745, 0.37255, 0.80392], 'LineWidth', 4)
hold on
plot([2068.1 2075.1],[5.35/6*y_limits(2) 5.35/6*y_limits(2)],'color', [1, 0.41569, 0.41569], 'LineWidth', 4)
hold on
text(1949.6,5.35/6*y_limits(2),'Historical & Recent*', 'color', [0.41176, 0.41176, 0.41176],'FontSize', 30, 'FontName', 'Times New Roman')
text(1993.5,5.35/6*y_limits(2),'SSP1-2.6*', 'color', [0.18039, 0.5451, 0.34118],'FontSize', 30, 'FontName', 'Times New Roman')
text(2031.6,5.35/6*y_limits(2),'SSP3-7.0*', 'color', [0.22745, 0.37255, 0.80392],'FontSize', 30, 'FontName', 'Times New Roman')
text(2075.6,5.35/6*y_limits(2),'SSP5-8.5*', 'color', [1, 0.41569, 0.41569],'FontSize', 30, 'FontName', 'Times New Roman')
set(gca, 'Box', 'on', ...                                % 边框
'LineWidth', 1,...                                       % 线宽
'XGrid', 'off', 'YGrid', 'off', ...                      % 网格
'TickDir', 'in', 'TickLength', [.01 .01], ...          % 刻度
'XMinorTick', 'off', 'YMinorTick', 'off', ...            % 小刻度
'XColor', [.1 .1 .1],  'YColor', [.1 .1 .1])             % 坐标轴颜色
set(gca, 'FontName', 'Helvetica')
set(gcf,'Color',[1 1 1])
ax = gca();  
ax.XAxis.FontSize = 30;  
ax.YAxis.FontSize = 30;  
xlabel('Year', 'FontSize', 60, 'FontWeight', 'bold', 'FontName', 'Times New Roman');
ylabel('Frequency (times per year)', 'FontSize', 60, 'FontWeight', 'bold', 'FontName', 'Times New Roman');
title('Compound drought and heatwave (99th-4 days-SPEI)', 'FontSize', 60, 'FontWeight', 'bold', 'FontName', 'Times New Roman')
dpi = 300;  
print(gcf, 'C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\figure\sf_different combinations\CDHW_frequency_99_4_spei.jpg', '-djpeg', ['-r', num2str(dpi)]);


temp(:,1)=(1:74)';
temp(:,2)=duration_ssp126_mean(1,1:74)';
[taub,~,h,~,~,~,~,~] = ktaub(temp, 0.05);
if h==0
    disp("mk_duration_his: 0 ")
else 
    if taub>0
    disp("mk_duration_his: 1 ")
    else
    disp("mk_duration_his: -1 ")
    end
end
clear temp taub h

temp(:,1)=(1:86)';
temp(:,2)=duration_ssp126_mean(1,75:160)';
[taub,~,h,~,~,~,~,~] = ktaub(temp, 0.05);
if h==0
    disp("mk_duration_ssp126: 0 ")
else 
    if taub>0
    disp("mk_duration_ssp126: 1 ")
    else
    disp("mk_duration_ssp126: -1 ")
    end
end
clear temp taub h

temp(:,1)=(1:86)';
temp(:,2)=duration_ssp370_mean(1,75:160)';
[taub,~,h,~,~,~,~,~] = ktaub(temp, 0.05);
if h==0
    disp("mk_duration_ssp370: 0 ")
else 
    if taub>0
    disp("mk_duration_ssp370: 1 ")
    else
    disp("mk_duration_ssp370: -1 ")
    end
end
clear temp taub h

temp(:,1)=(1:86)';
temp(:,2)=duration_ssp585_mean(1,75:160)';
[taub,~,h,~,~,~,~,~] = ktaub(temp, 0.05);
if h==0
    disp("mk_duration_ssp585: 0 ")
else 
    if taub>0
    disp("mk_duration_ssp585: 1 ")
    else
    disp("mk_duration_ssp585: -1 ")
    end
end
clear temp taub h


figure('Position', [100, 100, 2400, 1200])
my_color=[0.41176, 0.41176, 0.41176; 0.18039, 0.5451, 0.34118; 0.22745, 0.37255, 0.80392; 1, 0.41569, 0.41569];
colormap(my_color);
fill([1941:2014, fliplr(1941:2014)], [duration_ssp126_lower(1,1:74), fliplr(duration_ssp126_upper(1,1:74))], 1, 'FaceAlpha', 0.5, 'EdgeColor', 'none')
hold on
fill([2014:2100, fliplr(2014:2100)], [duration_ssp126_lower(1,74:160), fliplr(duration_ssp126_upper(1,74:160))], 2, 'FaceAlpha', 0.4, 'EdgeColor', 'none')
hold on
fill([2014:2100, fliplr(2014:2100)], [duration_ssp370_lower(1,74:160), fliplr(duration_ssp370_upper(1,74:160))], 3, 'FaceAlpha', 0.4, 'EdgeColor', 'none')
hold on
fill([2014:2100, fliplr(2014:2100)], [duration_ssp585_lower(1,74:160), fliplr(duration_ssp585_upper(1,74:160))], 4, 'FaceAlpha', 0.4, 'EdgeColor', 'none')
hold on
plot(1941:2100,duration_ssp126_mean,'color', [0.18039, 0.5451, 0.34118], 'LineWidth', 4)
hold on
plot(1941:2100,duration_ssp370_mean,'color', [0.22745, 0.37255, 0.80392], 'LineWidth', 4)
hold on
plot(1941:2100,duration_ssp585_mean,'color', [1, 0.41569, 0.41569], 'LineWidth', 4)
hold on
plot(1941:2014,duration_ssp585_mean(1:74),'color', [0.41176, 0.41176, 0.41176], 'LineWidth', 4)
ylim([0, max(duration_ssp585_upper.*1.2)]);
y_limits = ylim;
hold on
line([1980, 1980], y_limits, 'Color', [0.41176, 0.41176, 0.41176], 'LineStyle', '--');
hold on
line([2014, 2014], y_limits, 'Color', [0.41176, 0.41176, 0.41176], 'LineStyle', '--');
hold on
line([2057, 2057], y_limits, 'Color', [0.41176, 0.41176, 0.41176], 'LineStyle', '--');
hold on
text(1954,5.75/6*y_limits(2),'Historical', 'FontSize', 35, 'FontName', 'Times New Roman')
text(1991,5.75/6*y_limits(2),'Recent', 'FontSize', 35, 'FontName', 'Times New Roman')
text(2025,5.75/6*y_limits(2),'Near-Future', 'FontSize', 35, 'FontName', 'Times New Roman')
text(2070,5.75/6*y_limits(2),'Far-Future', 'FontSize', 35, 'FontName', 'Times New Roman')
hold on
plot([1942.1 1949.1],[5.35/6*y_limits(2) 5.35/6*y_limits(2)],'color', [0.41176, 0.41176, 0.41176], 'LineWidth', 4)
hold on
plot([1986.1 1993.1],[5.35/6*y_limits(2) 5.35/6*y_limits(2)],'color', [0.18039, 0.5451, 0.34118], 'LineWidth', 4)
hold on
plot([2024.1 2031.1],[5.35/6*y_limits(2) 5.35/6*y_limits(2)],'color', [0.22745, 0.37255, 0.80392], 'LineWidth', 4)
hold on
plot([2068.1 2075.1],[5.35/6*y_limits(2) 5.35/6*y_limits(2)],'color', [1, 0.41569, 0.41569], 'LineWidth', 4)
hold on
text(1949.6,5.35/6*y_limits(2),'Historical & Recent*', 'color', [0.41176, 0.41176, 0.41176],'FontSize', 30, 'FontName', 'Times New Roman')
text(1993.6,5.35/6*y_limits(2),'SSP1-2.6*', 'color', [0.18039, 0.5451, 0.34118],'FontSize', 30, 'FontName', 'Times New Roman')
text(2031.6,5.35/6*y_limits(2),'SSP3-7.0*', 'color', [0.22745, 0.37255, 0.80392],'FontSize', 30, 'FontName', 'Times New Roman')
text(2075.6,5.35/6*y_limits(2),'SSP5-8.5*', 'color', [1, 0.41569, 0.41569],'FontSize', 30, 'FontName', 'Times New Roman')
set(gca, 'Box', 'on', ...                                % 边框
'LineWidth', 1,...                                       % 线宽
'XGrid', 'off', 'YGrid', 'off', ...                      % 网格
'TickDir', 'in', 'TickLength', [.01 .01], ...          % 刻度
'XMinorTick', 'off', 'YMinorTick', 'off', ...            % 小刻度
'XColor', [.1 .1 .1],  'YColor', [.1 .1 .1])             % 坐标轴颜色
set(gca, 'FontName', 'Helvetica')
set(gcf,'Color',[1 1 1])
ax = gca();  
ax.XAxis.FontSize = 30;  
ax.YAxis.FontSize = 30;  
xlabel('Year', 'FontSize', 60, 'FontWeight', 'bold', 'FontName', 'Times New Roman');
ylabel('Duration (days per time)', 'FontSize', 60, 'FontWeight', 'bold', 'FontName', 'Times New Roman');
title('Compound drought and heatwave (99th-4 days-SPEI)', 'FontSize', 60, 'FontWeight', 'bold', 'FontName', 'Times New Roman')
dpi = 300;  
print(gcf, 'C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\figure\sf_different combinations\CDHW_duration_99_4_spei.jpg', '-djpeg', ['-r', num2str(dpi)]);


temp(:,1)=(1:74)';
temp(:,2)=severity_ssp126_mean(1,1:74)';
[taub,~,h,~,~,~,~,~] = ktaub(temp, 0.05);
if h==0
    disp("mk_severity_his: 0 ")
else 
    if taub>0
    disp("mk_severity_his: 1 ")
    else
    disp("mk_severity_his: -1 ")
    end
end
clear temp taub h

temp(:,1)=(1:86)';
temp(:,2)=severity_ssp126_mean(1,75:160)';
[taub,~,h,~,~,~,~,~] = ktaub(temp, 0.05);
if h==0
    disp("mk_severity_ssp126: 0 ")
else 
    if taub>0
    disp("mk_severity_ssp126: 1 ")
    else
    disp("mk_severity_ssp126: -1 ")
    end
end
clear temp taub h

temp(:,1)=(1:86)';
temp(:,2)=severity_ssp370_mean(1,75:160)';
[taub,~,h,~,~,~,~,~] = ktaub(temp, 0.05);
if h==0
    disp("mk_severity_ssp370: 0 ")
else 
    if taub>0
    disp("mk_severity_ssp370: 1 ")
    else
    disp("mk_severity_ssp370: -1 ")
    end
end
clear temp taub h

temp(:,1)=(1:86)';
temp(:,2)=severity_ssp585_mean(1,75:160)';
[taub,~,h,~,~,~,~,~] = ktaub(temp, 0.05);
if h==0
    disp("mk_severity_ssp585: 0 ")
else 
    if taub>0
    disp("mk_severity_ssp585: 1 ")
    else
    disp("mk_severity_ssp585: -1 ")
    end
end
clear temp taub h


figure('Position', [100, 100, 2400, 1200])
my_color=[0.41176, 0.41176, 0.41176; 0.18039, 0.5451, 0.34118; 0.22745, 0.37255, 0.80392; 1, 0.41569, 0.41569];
colormap(my_color);
fill([1941:2014, fliplr(1941:2014)], [severity_ssp126_lower(1,1:74), fliplr(severity_ssp126_upper(1,1:74))], 1, 'FaceAlpha', 0.5, 'EdgeColor', 'none')
hold on
fill([2014:2100, fliplr(2014:2100)], [severity_ssp126_lower(1,74:160), fliplr(severity_ssp126_upper(1,74:160))], 2, 'FaceAlpha', 0.4, 'EdgeColor', 'none')
hold on
fill([2014:2100, fliplr(2014:2100)], [severity_ssp370_lower(1,74:160), fliplr(severity_ssp370_upper(1,74:160))], 3, 'FaceAlpha', 0.4, 'EdgeColor', 'none')
hold on
fill([2014:2100, fliplr(2014:2100)], [severity_ssp585_lower(1,74:160), fliplr(severity_ssp585_upper(1,74:160))], 4, 'FaceAlpha', 0.4, 'EdgeColor', 'none')
hold on
plot(1941:2100,severity_ssp126_mean,'color', [0.18039, 0.5451, 0.34118], 'LineWidth', 4)
hold on
plot(1941:2100,severity_ssp370_mean,'color', [0.22745, 0.37255, 0.80392], 'LineWidth', 4)
hold on
plot(1941:2100,severity_ssp585_mean,'color', [1, 0.41569, 0.41569], 'LineWidth', 4)
hold on
plot(1941:2014,severity_ssp585_mean(1:74),'color', [0.41176, 0.41176, 0.41176], 'LineWidth', 4)
ylim([0, max(severity_ssp585_upper.*1.2)]);
y_limits = ylim;
hold on
line([1980, 1980], y_limits, 'Color', [0.41176, 0.41176, 0.41176], 'LineStyle', '--');
hold on
line([2014, 2014], y_limits, 'Color', [0.41176, 0.41176, 0.41176], 'LineStyle', '--');
hold on
line([2057, 2057], y_limits, 'Color', [0.41176, 0.41176, 0.41176], 'LineStyle', '--');
hold on
text(1954,5.75/6*y_limits(2),'Historical', 'FontSize', 35, 'FontName', 'Times New Roman')
text(1991,5.75/6*y_limits(2),'Recent', 'FontSize', 35, 'FontName', 'Times New Roman')
text(2025,5.75/6*y_limits(2),'Near-Future', 'FontSize', 35, 'FontName', 'Times New Roman')
text(2070,5.75/6*y_limits(2),'Far-Future', 'FontSize', 35, 'FontName', 'Times New Roman')
hold on
plot([1942 1949],[5.35/6*y_limits(2) 5.35/6*y_limits(2)],'color', [0.41176, 0.41176, 0.41176], 'LineWidth', 4)
hold on
plot([1986.1 1993.1],[5.35/6*y_limits(2) 5.35/6*y_limits(2)],'color', [0.18039, 0.5451, 0.34118], 'LineWidth', 4)
hold on
plot([2024.1 2031.1],[5.35/6*y_limits(2) 5.35/6*y_limits(2)],'color', [0.22745, 0.37255, 0.80392], 'LineWidth', 4)
hold on
plot([2068.1 2075.1],[5.35/6*y_limits(2) 5.35/6*y_limits(2)],'color', [1, 0.41569, 0.41569], 'LineWidth', 4)
hold on
text(1949.6,5.35/6*y_limits(2),'Historical & Recent*', 'color', [0.41176, 0.41176, 0.41176],'FontSize', 30, 'FontName', 'Times New Roman')
text(1993.6,5.35/6*y_limits(2),'SSP1-2.6*', 'color', [0.18039, 0.5451, 0.34118],'FontSize', 30, 'FontName', 'Times New Roman')
text(2031.6,5.35/6*y_limits(2),'SSP3-7.0*', 'color', [0.22745, 0.37255, 0.80392],'FontSize', 30, 'FontName', 'Times New Roman')
text(2075.6,5.35/6*y_limits(2),'SSP5-8.5*', 'color', [1, 0.41569, 0.41569],'FontSize', 30, 'FontName', 'Times New Roman')
set(gca, 'Box', 'on', ...                                % 边框
'LineWidth', 1,...                                       % 线宽
'XGrid', 'off', 'YGrid', 'off', ...                      % 网格
'TickDir', 'in', 'TickLength', [.01 .01], ...          % 刻度
'XMinorTick', 'off', 'YMinorTick', 'off', ...            % 小刻度
'XColor', [.1 .1 .1],  'YColor', [.1 .1 .1])             % 坐标轴颜色
set(gca, 'FontName', 'Helvetica')
set(gcf,'Color',[1 1 1])
ax = gca();  
ax.XAxis.FontSize = 30;  
ax.YAxis.FontSize = 30;
xlabel('Year', 'FontSize', 60, 'FontWeight', 'bold', 'FontName', 'Times New Roman');
ylabel('Severity', 'FontSize', 60, 'FontWeight', 'bold', 'FontName', 'Times New Roman');
title('Compound drought and heatwave (99th-4 days-SPEI)', 'FontSize', 60, 'FontWeight', 'bold', 'FontName', 'Times New Roman')
dpi = 300;  
print(gcf, 'C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\figure\sf_different combinations\CDHW_severity_99_4_spei.jpg', '-djpeg', ['-r', num2str(dpi)]);



