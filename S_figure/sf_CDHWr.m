clear
clc

CDHW_folder_path = 'C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\data\CDHW_index_yearly';
HW_folder_path = 'C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\data\HW_index_yearly';


CDHW_frequency_ssp126_info = dir(fullfile(CDHW_folder_path, '*frequency_92_twsa_3_ssp126.nc'));
CDHW_frequency_ssp126_names = {CDHW_frequency_ssp126_info.name};
CDHW_frequency_ssp126_paths = fullfile(CDHW_folder_path, CDHW_frequency_ssp126_names);

CDHW_frequency_ssp370_info = dir(fullfile(CDHW_folder_path, '*frequency_92_twsa_3_ssp370.nc'));
CDHW_frequency_ssp370_names = {CDHW_frequency_ssp370_info.name};
CDHW_frequency_ssp370_paths = fullfile(CDHW_folder_path, CDHW_frequency_ssp370_names);

CDHW_frequency_ssp585_info = dir(fullfile(CDHW_folder_path, '*frequency_92_twsa_3_ssp585.nc'));
CDHW_frequency_ssp585_names = {CDHW_frequency_ssp585_info.name};
CDHW_frequency_ssp585_paths = fullfile(CDHW_folder_path, CDHW_frequency_ssp585_names);

HW_frequency_ssp126_info = dir(fullfile(HW_folder_path, '*frequency_92_ssp126.nc'));
HW_frequency_ssp126_names = {HW_frequency_ssp126_info.name};
HW_frequency_ssp126_paths = fullfile(HW_folder_path, HW_frequency_ssp126_names);

HW_frequency_ssp370_info = dir(fullfile(HW_folder_path, '*frequency_92_ssp370.nc'));
HW_frequency_ssp370_names = {HW_frequency_ssp370_info.name};
HW_frequency_ssp370_paths = fullfile(HW_folder_path, HW_frequency_ssp370_names);

HW_frequency_ssp585_info = dir(fullfile(HW_folder_path, '*frequency_92_ssp585.nc'));
HW_frequency_ssp585_names = {HW_frequency_ssp585_info.name};
HW_frequency_ssp585_paths = fullfile(HW_folder_path, HW_frequency_ssp585_names);



CDHW_126 = ones(10,160);
CDHW_370 = ones(10,160);
CDHW_585 = ones(10,160);

HW_126 = ones(5,160);
HW_370 = ones(5,160);
HW_585 = ones(5,160);


for i=1:10
    frequency_data=ncread(CDHW_frequency_ssp126_paths{i}, 'tws');
    frequency_data=frequency_data(1:125,1:72,:);
    for m=1:160
        temp=frequency_data(:,:,m);
        CDHW_126(i,m)=mean(temp(:));
    end
end

for i=1:10
    frequency_data=ncread(CDHW_frequency_ssp370_paths{i}, 'tws');
    frequency_data=frequency_data(1:125,1:72,:);
    for m=1:160
        temp=frequency_data(:,:,m);
        CDHW_370(i,m)=mean(temp(:));
    end
end

for i=1:10
    frequency_data=ncread(CDHW_frequency_ssp585_paths{i}, 'tws');
    frequency_data=frequency_data(1:125,1:72,:);
    for m=1:160
        temp=frequency_data(:,:,m);
        CDHW_585(i,m)=mean(temp(:));
    end
end


for i=1:5
    frequency_data=ncread(HW_frequency_ssp126_paths{i}, 'tws');
    frequency_data=frequency_data(1:125,1:72,:);
    for m=1:160
        temp=frequency_data(:,:,m);
        HW_126(i,m)=mean(temp(:));
    end
end

for i=1:5
    frequency_data=ncread(HW_frequency_ssp370_paths{i}, 'tws');
    frequency_data=frequency_data(1:125,1:72,:);
    for m=1:160
        temp=frequency_data(:,:,m);
        HW_370(i,m)=mean(temp(:));
    end
end

for i=1:5
    frequency_data=ncread(HW_frequency_ssp585_paths{i}, 'tws');
    frequency_data=frequency_data(1:125,1:72,:);
    for m=1:160
        temp=frequency_data(:,:,m);
        HW_585(i,m)=mean(temp(:));
    end
end

MMMCDHW_126 = mean(CDHW_126);
MMMCDHW_370 = mean(CDHW_370);
MMMCDHW_585 = mean(CDHW_585);

MMMHW_126 = mean(HW_126);
MMMHW_370 = mean(HW_370);
MMMHW_585 = mean(HW_585);


CDHWR_126=(MMMCDHW_126./MMMHW_126).*100;
CDHWR_370=(MMMCDHW_370./MMMHW_370).*100;
CDHWR_585=(MMMCDHW_585./MMMHW_585).*100;



clear temp


temp(:,1)=(1:74)';
temp(:,2)=CDHWR_126(1,1:74)';
[taub,~,h,~,~,~,~,~] = ktaub(temp, 0.05);
if h==0
    disp("mk_CDHWr_his: 0 ")
else 
    if taub>0
    disp("mk_CDHWr_his: 1 ")
    else
    disp("mk_CDHWr_his: -1 ")
    end
end
clear temp taub h

temp(:,1)=(1:86)';
temp(:,2)=CDHWR_126(1,75:160)';
[taub,~,h,~,~,~,~,~] = ktaub(temp, 0.05);
if h==0
    disp("mk_CDHWr_ssp126: 0 ")
else 
    if taub>0
    disp("mk_CDHWr_ssp126: 1 ")
    else
    disp("mk_CDHWr_ssp126: -1 ")
    end
end
clear temp taub h




figure('Position', [100, 100, 2400, 1200])
my_color=[0.41176, 0.41176, 0.41176; 0.18039, 0.5451, 0.34118; 0.22745, 0.37255, 0.80392; 1, 0.41569, 0.41569];
colormap(my_color);
plot(1941:2100,CDHWR_126,'color', [0.18039, 0.5451, 0.34118], 'LineWidth', 2)
hold on
scatter(1941:2100,CDHWR_126, 800, [0.18039, 0.5451, 0.34118],'.')
hold on
plot(1941:2014,CDHWR_126(1:74),'color', [0.41176, 0.41176, 0.41176], 'LineWidth', 2)
scatter(1941:2014,CDHWR_126(1:74), 800, [0.41176, 0.41176, 0.41176],'.')
hold on
ylim([5, 40]);
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
plot([2024.1 2031.1],[5.35/6*y_limits(2) 5.35/6*y_limits(2)],'color', [0.18039, 0.5451, 0.34118], 'LineWidth', 4)
hold on
text(1949.6,5.35/6*y_limits(2),'Historical & Recent', 'color', [0.41176, 0.41176, 0.41176],'FontSize', 30, 'FontName', 'Times New Roman')
text(2031.6,5.35/6*y_limits(2),'SSP1-2.6', 'color', [0.18039, 0.5451, 0.34118],'FontSize', 30, 'FontName', 'Times New Roman')
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
ylabel('Coincidence rate (%)', 'FontSize', 60, 'FontWeight', 'bold', 'FontName', 'Times New Roman');
title('Coincidence rate under SSP1-2.6', 'FontSize', 60, 'FontWeight', 'bold', 'FontName', 'Times New Roman')
dpi = 300;  
print(gcf, 'C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\figure\sf_CDHWr\sf-CDHWr-1.jpg', '-djpeg', ['-r', num2str(dpi)]);


temp(:,1)=(1:74)';
temp(:,2)=CDHWR_370(1,1:74)';
[taub,~,h,~,~,~,~,~] = ktaub(temp, 0.05);
if h==0
    disp("mk_CDHWr_his: 0 ")
else 
    if taub>0
    disp("mk_CDHWr_his: 1 ")
    else
    disp("mk_CDHWr_his: -1 ")
    end
end
clear temp taub h

temp(:,1)=(1:86)';
temp(:,2)=CDHWR_370(1,75:160)';
[taub,~,h,~,~,~,~,~] = ktaub(temp, 0.05);
if h==0
    disp("mk_CDHWr_ssp370: 0 ")
else 
    if taub>0
    disp("mk_CDHWr_ssp370: 1 ")
    else
    disp("mk_CDHWr_ssp370: -1 ")
    end
end
clear temp taub h


figure('Position', [100, 100, 2400, 1200])
my_color=[0.41176, 0.41176, 0.41176; 0.18039, 0.5451, 0.34118; 0.22745, 0.37255, 0.80392; 1, 0.41569, 0.41569];
colormap(my_color);
plot(1941:2100,CDHWR_370,'color', [0.22745, 0.37255, 0.80392], 'LineWidth', 2)
hold on
scatter(1941:2100,CDHWR_370, 800, [0.22745, 0.37255, 0.80392],'.')
hold on
plot(1941:2014,CDHWR_370(1:74),'color', [0.41176, 0.41176, 0.41176], 'LineWidth', 2)
scatter(1941:2014,CDHWR_370(1:74), 800, [0.41176, 0.41176, 0.41176],'.')
hold on
ylim([5, 40]);
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
plot([2024.1 2031.1],[5.35/6*y_limits(2) 5.35/6*y_limits(2)],'color', [0.22745, 0.37255, 0.80392], 'LineWidth', 4)
hold on
text(1949.6,5.35/6*y_limits(2),'Historical & Recent', 'color', [0.41176, 0.41176, 0.41176],'FontSize', 30, 'FontName', 'Times New Roman')
text(2031.6,5.35/6*y_limits(2),'SSP3-7.0', 'color', [0.22745, 0.37255, 0.80392],'FontSize', 30, 'FontName', 'Times New Roman')
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
ylabel('Coincidence rate (%)', 'FontSize', 60, 'FontWeight', 'bold', 'FontName', 'Times New Roman');
title('Coincidence rate under SSP3-7.0', 'FontSize', 60, 'FontWeight', 'bold', 'FontName', 'Times New Roman')
dpi = 300;  
print(gcf, 'C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\figure\sf_CDHWr\sf-CDHWr-2.jpg', '-djpeg', ['-r', num2str(dpi)]);


temp(:,1)=(1:74)';
temp(:,2)=CDHWR_585(1,1:74)';
[taub,~,h,~,~,~,~,~] = ktaub(temp, 0.05);
if h==0
    disp("mk_CDHWr_his: 0 ")
else 
    if taub>0
    disp("mk_CDHWr_his: 1 ")
    else
    disp("mk_CDHWr_his: -1 ")
    end
end
clear temp taub h

temp(:,1)=(1:86)';
temp(:,2)=CDHWR_585(1,75:160)';
[taub,~,h,~,~,~,~,~] = ktaub(temp, 0.05);
if h==0
    disp("mk_CDHWr_ssp585: 0 ")
else 
    if taub>0
    disp("mk_CDHWr_ssp585: 1 ")
    else
    disp("mk_CDHWr_ssp585: -1 ")
    end
end
clear temp taub h


figure('Position', [100, 100, 2400, 1200])
my_color=[0.41176, 0.41176, 0.41176; 0.18039, 0.5451, 0.34118; 0.22745, 0.37255, 0.80392; 1, 0.41569, 0.41569];
colormap(my_color);
plot(1941:2100,CDHWR_585,'color', [1, 0.41569, 0.41569], 'LineWidth', 2)
hold on
scatter(1941:2100,CDHWR_585, 800, [1, 0.41569, 0.41569],'.')
hold on
plot(1941:2014,CDHWR_585(1:74),'color', [0.41176, 0.41176, 0.41176], 'LineWidth', 2)
scatter(1941:2014,CDHWR_585(1:74), 800, [0.41176, 0.41176, 0.41176],'.')
hold on
ylim([5, 40]);
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
plot([2024.1 2031.1],[5.35/6*y_limits(2) 5.35/6*y_limits(2)],'color', [1, 0.41569, 0.41569], 'LineWidth', 4)
hold on
text(1949.6,5.35/6*y_limits(2),'Historical & Recent', 'color', [0.41176, 0.41176, 0.41176],'FontSize', 30, 'FontName', 'Times New Roman')
text(2031.6,5.35/6*y_limits(2),'SSP5-8.5', 'color', [1, 0.41569, 0.41569],'FontSize', 30, 'FontName', 'Times New Roman')
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
ylabel('Coincidence rate (%)', 'FontSize', 60, 'FontWeight', 'bold', 'FontName', 'Times New Roman');
title('Coincidence rate under SSP5-8.5', 'FontSize', 60, 'FontWeight', 'bold', 'FontName', 'Times New Roman')
dpi = 300;  
print(gcf, 'C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\figure\sf_CDHWr\sf-CDHWr-3.jpg', '-djpeg', ['-r', num2str(dpi)]);

