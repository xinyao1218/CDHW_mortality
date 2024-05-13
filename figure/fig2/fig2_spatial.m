clear
clc

CDHW_folder_path = 'C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\data\CDHW_index_yearly';

CDHW_frequency_ssp126_info = dir(fullfile(CDHW_folder_path, '*frequency_92_twsa_3_ssp126.nc'));
CDHW_frequency_ssp126_names = {CDHW_frequency_ssp126_info.name};
CDHW_frequency_ssp126_paths = fullfile(CDHW_folder_path, CDHW_frequency_ssp126_names);

CDHW_frequency_ssp370_info = dir(fullfile(CDHW_folder_path, '*frequency_92_twsa_3_ssp370.nc'));
CDHW_frequency_ssp370_names = {CDHW_frequency_ssp370_info.name};
CDHW_frequency_ssp370_paths = fullfile(CDHW_folder_path, CDHW_frequency_ssp370_names);

CDHW_frequency_ssp585_info = dir(fullfile(CDHW_folder_path, '*frequency_92_twsa_3_ssp585.nc'));
CDHW_frequency_ssp585_names = {CDHW_frequency_ssp585_info.name};
CDHW_frequency_ssp585_paths = fullfile(CDHW_folder_path, CDHW_frequency_ssp585_names);

CDHW_duration_ssp126_info = dir(fullfile(CDHW_folder_path, '*duration_92_twsa_3_ssp126.nc'));
CDHW_duration_ssp126_names = {CDHW_duration_ssp126_info.name};
CDHW_duration_ssp126_paths = fullfile(CDHW_folder_path, CDHW_duration_ssp126_names);

CDHW_duration_ssp370_info = dir(fullfile(CDHW_folder_path, '*duration_92_twsa_3_ssp370.nc'));
CDHW_duration_ssp370_names = {CDHW_duration_ssp370_info.name};
CDHW_duration_ssp370_paths = fullfile(CDHW_folder_path, CDHW_duration_ssp370_names);

CDHW_duration_ssp585_info = dir(fullfile(CDHW_folder_path, '*duration_92_twsa_3_ssp585.nc'));
CDHW_duration_ssp585_names = {CDHW_duration_ssp585_info.name};
CDHW_duration_ssp585_paths = fullfile(CDHW_folder_path, CDHW_duration_ssp585_names);

CDHW_severity_ssp126_info = dir(fullfile(CDHW_folder_path, '*severity_92_twsa_3_ssp126.nc'));
CDHW_severity_ssp126_names = {CDHW_severity_ssp126_info.name};
CDHW_severity_ssp126_paths = fullfile(CDHW_folder_path, CDHW_severity_ssp126_names);

CDHW_severity_ssp370_info = dir(fullfile(CDHW_folder_path, '*severity_92_twsa_3_ssp370.nc'));
CDHW_severity_ssp370_names = {CDHW_severity_ssp370_info.name};
CDHW_severity_ssp370_paths = fullfile(CDHW_folder_path, CDHW_severity_ssp370_names);

CDHW_severity_ssp585_info = dir(fullfile(CDHW_folder_path, '*severity_92_twsa_3_ssp585.nc'));
CDHW_severity_ssp585_names = {CDHW_severity_ssp585_info.name};
CDHW_severity_ssp585_paths = fullfile(CDHW_folder_path, CDHW_severity_ssp585_names);

CDHW_frequency_126 = ones(126,102,40);
CDHW_duration_126 = ones(126,102,40);
CDHW_severity_126 = ones(126,102,40);

MMMCDHW_frequency_126 = ones(126,102,4);
MMMCDHW_duration_126 = ones(126,102,4);
MMMCDHW_severity_126 = ones(126,102,4);

CDHW_frequency_370 = ones(126,102,40);
CDHW_duration_370 = ones(126,102,40);
CDHW_severity_370 = ones(126,102,40);

MMMCDHW_frequency_370 = ones(126,102,4);
MMMCDHW_duration_370 = ones(126,102,4);
MMMCDHW_severity_370 = ones(126,102,4);

CDHW_frequency_585 = ones(126,102,40);
CDHW_duration_585 = ones(126,102,40);
CDHW_severity_585 = ones(126,102,40);

MMMCDHW_frequency_585 = ones(126,102,4);
MMMCDHW_duration_585 = ones(126,102,4);
MMMCDHW_severity_585 = ones(126,102,4);


for i=1:4
    for j=1:10
        frequency_data=ncread(CDHW_frequency_ssp126_paths{j}, 'tws');
        frequency_data=frequency_data(:,:,:);
        for m=1:126
            for n=1:102
                temp=frequency_data(m,n,1+(i-1)*40:i*40);
                CDHW_frequency_126(m,n,10*(i-1)+j)=mean(temp(:));
            end
        end
    end
end

for i=1:4
    for j=1:10
        duration_data=ncread(CDHW_duration_ssp126_paths{j}, 'tws');
        duration_data=duration_data(:,:,:);
        for m=1:126
            for n=1:102
                temp=duration_data(m,n,1+(i-1)*40:i*40);
                CDHW_duration_126(m,n,10*(i-1)+j)=mean(temp(:));
            end
        end
    end
end

for i=1:4
    for j=1:10
        severity_data=ncread(CDHW_severity_ssp126_paths{j}, 'tws');
        severity_data=severity_data(:,:,:);
        for m=1:126
            for n=1:102
                temp=severity_data(m,n,1+(i-1)*40:i*40);
                CDHW_severity_126(m,n,10*(i-1)+j)=mean(temp(:));
            end
        end
    end
end


for i=1:4
    for j=1:10
        frequency_data=ncread(CDHW_frequency_ssp370_paths{j}, 'tws');
        frequency_data=frequency_data(:,:,:);
        for m=1:126
            for n=1:102
                temp=frequency_data(m,n,1+(i-1)*40:i*40);
                CDHW_frequency_370(m,n,10*(i-1)+j)=mean(temp(:));
            end
        end
    end
end

for i=1:4
    for j=1:10
        duration_data=ncread(CDHW_duration_ssp370_paths{j}, 'tws');
        duration_data=duration_data(:,:,:);
        for m=1:126
            for n=1:102
                temp=duration_data(m,n,1+(i-1)*40:i*40);
                CDHW_duration_370(m,n,10*(i-1)+j)=mean(temp(:));
            end
        end
    end
end

for i=1:4
    for j=1:10
        severity_data=ncread(CDHW_severity_ssp370_paths{j}, 'tws');
        severity_data=severity_data(:,:,:);
        for m=1:126
            for n=1:102
                temp=severity_data(m,n,1+(i-1)*40:i*40);
                CDHW_severity_370(m,n,10*(i-1)+j)=mean(temp(:));
            end
        end
    end
end


for i=1:4
    for j=1:10
        frequency_data=ncread(CDHW_frequency_ssp585_paths{j}, 'tws');
        frequency_data=frequency_data(:,:,:);
        for m=1:126
            for n=1:102
                temp=frequency_data(m,n,1+(i-1)*40:i*40);
                CDHW_frequency_585(m,n,10*(i-1)+j)=mean(temp(:));
            end
        end
    end
end

for i=1:4
    for j=1:10
        duration_data=ncread(CDHW_duration_ssp585_paths{j}, 'tws');
        duration_data=duration_data(:,:,:);
        for m=1:126
            for n=1:102
                temp=duration_data(m,n,1+(i-1)*40:i*40);
                CDHW_duration_585(m,n,10*(i-1)+j)=mean(temp(:));
            end
        end
    end
end

for i=1:4
    for j=1:10
        severity_data=ncread(CDHW_severity_ssp585_paths{j}, 'tws');
        severity_data=severity_data(:,:,:);
        for m=1:126
            for n=1:102
                temp=severity_data(m,n,1+(i-1)*40:i*40);
                CDHW_severity_585(m,n,10*(i-1)+j)=mean(temp(:));
            end
        end
    end
end

for i=1:4
    for m=1:126
        for n=1:102
            MMMCDHW_frequency_126(m,n,i) = mean(CDHW_frequency_126(m,n,1+(i-1)*10:i*10));
            MMMCDHW_duration_126(m,n,i) = mean(CDHW_duration_126(m,n,1+(i-1)*10:i*10));
            MMMCDHW_severity_126(m,n,i) = mean(CDHW_severity_126(m,n,1+(i-1)*10:i*10));
            MMMCDHW_frequency_370(m,n,i) = mean(CDHW_frequency_370(m,n,1+(i-1)*10:i*10));
            MMMCDHW_duration_370(m,n,i) = mean(CDHW_duration_370(m,n,1+(i-1)*10:i*10));
            MMMCDHW_severity_370(m,n,i) = mean(CDHW_severity_370(m,n,1+(i-1)*10:i*10));
            MMMCDHW_frequency_585(m,n,i) = mean(CDHW_frequency_585(m,n,1+(i-1)*10:i*10));
            MMMCDHW_duration_585(m,n,i) = mean(CDHW_duration_585(m,n,1+(i-1)*10:i*10));
            MMMCDHW_severity_585(m,n,i) = mean(CDHW_severity_585(m,n,1+(i-1)*10:i*10));
        end
    end
end




spatial=ones(126,102,21);
data=ones(126,102,24);
spatial(:,:,1)=(MMMCDHW_frequency_126(:,:,2)-MMMCDHW_frequency_126(:,:,1))./MMMCDHW_frequency_126(:,:,1);
spatial(:,:,2)=(MMMCDHW_duration_126(:,:,2)-MMMCDHW_duration_126(:,:,1))./MMMCDHW_duration_126(:,:,1);
spatial(:,:,3)=(MMMCDHW_severity_126(:,:,2)-MMMCDHW_severity_126(:,:,1))./MMMCDHW_severity_126(:,:,1);
spatial(:,:,4)=(MMMCDHW_frequency_126(:,:,3)-MMMCDHW_frequency_126(:,:,2))./MMMCDHW_frequency_126(:,:,2);
spatial(:,:,5)=(MMMCDHW_duration_126(:,:,3)-MMMCDHW_duration_126(:,:,2))./MMMCDHW_duration_126(:,:,2);
spatial(:,:,6)=(MMMCDHW_severity_126(:,:,3)-MMMCDHW_severity_126(:,:,2))./MMMCDHW_severity_126(:,:,2);
spatial(:,:,7)=(MMMCDHW_frequency_370(:,:,3)-MMMCDHW_frequency_370(:,:,2))./MMMCDHW_frequency_370(:,:,2);
spatial(:,:,8)=(MMMCDHW_duration_370(:,:,3)-MMMCDHW_duration_370(:,:,2))./MMMCDHW_duration_370(:,:,2);
spatial(:,:,9)=(MMMCDHW_severity_370(:,:,3)-MMMCDHW_severity_370(:,:,2))./MMMCDHW_severity_370(:,:,2);
spatial(:,:,10)=(MMMCDHW_frequency_585(:,:,3)-MMMCDHW_frequency_585(:,:,2))./MMMCDHW_frequency_585(:,:,2);
spatial(:,:,11)=(MMMCDHW_duration_585(:,:,3)-MMMCDHW_duration_585(:,:,2))./MMMCDHW_duration_585(:,:,2);
spatial(:,:,12)=(MMMCDHW_severity_585(:,:,3)-MMMCDHW_severity_585(:,:,2))./MMMCDHW_severity_585(:,:,2);
spatial(:,:,13)=(MMMCDHW_frequency_126(:,:,4)-MMMCDHW_frequency_126(:,:,2))./MMMCDHW_frequency_126(:,:,2);
spatial(:,:,14)=(MMMCDHW_duration_126(:,:,4)-MMMCDHW_duration_126(:,:,2))./MMMCDHW_duration_126(:,:,2);
spatial(:,:,15)=(MMMCDHW_severity_126(:,:,4)-MMMCDHW_severity_126(:,:,2))./MMMCDHW_severity_126(:,:,2);
spatial(:,:,16)=(MMMCDHW_frequency_370(:,:,4)-MMMCDHW_frequency_370(:,:,2))./MMMCDHW_frequency_370(:,:,2);
spatial(:,:,17)=(MMMCDHW_duration_370(:,:,4)-MMMCDHW_duration_370(:,:,2))./MMMCDHW_duration_370(:,:,2);
spatial(:,:,18)=(MMMCDHW_severity_370(:,:,4)-MMMCDHW_severity_370(:,:,2))./MMMCDHW_severity_370(:,:,2);
spatial(:,:,19)=(MMMCDHW_frequency_585(:,:,4)-MMMCDHW_frequency_585(:,:,2))./MMMCDHW_frequency_585(:,:,2);
spatial(:,:,20)=(MMMCDHW_duration_585(:,:,4)-MMMCDHW_duration_585(:,:,2))./MMMCDHW_duration_585(:,:,2);
spatial(:,:,21)=(MMMCDHW_severity_585(:,:,4)-MMMCDHW_severity_585(:,:,2))./MMMCDHW_severity_585(:,:,2);
spatial=spatial.*100;


data(:,:,1)=MMMCDHW_frequency_126(:,:,1);
data(:,:,2)=MMMCDHW_duration_126(:,:,1);
data(:,:,3)=MMMCDHW_severity_126(:,:,1);
data(:,:,4)=MMMCDHW_frequency_126(:,:,2);
data(:,:,5)=MMMCDHW_duration_126(:,:,2);
data(:,:,6)=MMMCDHW_severity_126(:,:,2);
data(:,:,7)=MMMCDHW_frequency_126(:,:,3);
data(:,:,8)=MMMCDHW_duration_126(:,:,3);
data(:,:,9)=MMMCDHW_severity_126(:,:,3);
data(:,:,10)=MMMCDHW_frequency_370(:,:,3);
data(:,:,11)=MMMCDHW_duration_370(:,:,3);
data(:,:,12)=MMMCDHW_severity_370(:,:,3);
data(:,:,13)=MMMCDHW_frequency_585(:,:,3);
data(:,:,14)=MMMCDHW_duration_585(:,:,3);
data(:,:,15)=MMMCDHW_severity_585(:,:,3);
data(:,:,16)=MMMCDHW_frequency_126(:,:,4);
data(:,:,17)=MMMCDHW_duration_126(:,:,4);
data(:,:,18)=MMMCDHW_severity_126(:,:,4);
data(:,:,19)=MMMCDHW_frequency_370(:,:,4);
data(:,:,20)=MMMCDHW_duration_370(:,:,4);
data(:,:,21)=MMMCDHW_severity_370(:,:,4);
data(:,:,22)=MMMCDHW_frequency_585(:,:,4);
data(:,:,23)=MMMCDHW_duration_585(:,:,4);
data(:,:,24)=MMMCDHW_severity_585(:,:,4);




ncwrite("C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\figure\fig2\spatial.nc", 'tws', spatial);
ncwrite("C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\figure\fig2\meandata.nc", 'tws', data);




