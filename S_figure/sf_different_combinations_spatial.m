clear
clc

CDHW_folder_path = 'C:\Users\yaoxin\Desktop\ISIMIP3b\CDHW_index_yearly';



CDHW_frequency_twsa_ssp585_info = dir(fullfile(CDHW_folder_path, '*_cdhw_frequency_*_twsa_*_ssp585.nc'));
CDHW_frequency_twsa_ssp585_names = {CDHW_frequency_twsa_ssp585_info.name};
CDHW_frequency_twsa_ssp585_paths = fullfile(CDHW_folder_path, CDHW_frequency_twsa_ssp585_names);

CDHW_frequency_spi_ssp585_info = dir(fullfile(CDHW_folder_path, '*_cdhw_frequency_*_spi_*_ssp585.nc'));
CDHW_frequency_spi_ssp585_names = {CDHW_frequency_spi_ssp585_info.name};
CDHW_frequency_spi_ssp585_paths = fullfile(CDHW_folder_path, CDHW_frequency_spi_ssp585_names);

CDHW_frequency_spei_ssp585_info = dir(fullfile(CDHW_folder_path, '*_cdhw_frequency_*_spei_*_ssp585.nc'));
CDHW_frequency_spei_ssp585_names = {CDHW_frequency_spei_ssp585_info.name};
CDHW_frequency_spei_ssp585_paths = fullfile(CDHW_folder_path, CDHW_frequency_spei_ssp585_names);

CDHW_duration_twsa_ssp585_info = dir(fullfile(CDHW_folder_path, '*_cdhw_duration_*_twsa_*_ssp585.nc'));
CDHW_duration_twsa_ssp585_names = {CDHW_duration_twsa_ssp585_info.name};
CDHW_duration_twsa_ssp585_paths = fullfile(CDHW_folder_path, CDHW_duration_twsa_ssp585_names);

CDHW_duration_spi_ssp585_info = dir(fullfile(CDHW_folder_path, '*_cdhw_duration_*_spi_*_ssp585.nc'));
CDHW_duration_spi_ssp585_names = {CDHW_duration_spi_ssp585_info.name};
CDHW_duration_spi_ssp585_paths = fullfile(CDHW_folder_path, CDHW_duration_spi_ssp585_names);

CDHW_duration_spei_ssp585_info = dir(fullfile(CDHW_folder_path, '*_cdhw_duration_*_spei_*_ssp585.nc'));
CDHW_duration_spei_ssp585_names = {CDHW_duration_spei_ssp585_info.name};
CDHW_duration_spei_ssp585_paths = fullfile(CDHW_folder_path, CDHW_duration_spei_ssp585_names);

CDHW_severity_twsa_ssp585_info = dir(fullfile(CDHW_folder_path, '*_cdhw_severity_*_twsa_*_ssp585.nc'));
CDHW_severity_twsa_ssp585_names = {CDHW_severity_twsa_ssp585_info.name};
CDHW_severity_twsa_ssp585_paths = fullfile(CDHW_folder_path, CDHW_severity_twsa_ssp585_names);

CDHW_severity_spi_ssp585_info = dir(fullfile(CDHW_folder_path, '*_cdhw_severity_*_spi_*_ssp585.nc'));
CDHW_severity_spi_ssp585_names = {CDHW_severity_spi_ssp585_info.name};
CDHW_severity_spi_ssp585_paths = fullfile(CDHW_folder_path, CDHW_severity_spi_ssp585_names);

CDHW_severity_spei_ssp585_info = dir(fullfile(CDHW_folder_path, '*_cdhw_severity_*_spei_*_ssp585.nc'));
CDHW_severity_spei_ssp585_names = {CDHW_severity_spei_ssp585_info.name};
CDHW_severity_spei_ssp585_paths = fullfile(CDHW_folder_path, CDHW_severity_spei_ssp585_names);

clear CDHW_frequency_twsa_ssp585_info CDHW_frequency_twsa_ssp585_names CDHW_frequency_spi_ssp585_info CDHW_frequency_spi_ssp585_names CDHW_frequency_spei_ssp585_info CDHW_frequency_spei_ssp585_names
clear CDHW_duration_twsa_ssp585_info CDHW_duration_twsa_ssp585_names CDHW_duration_spi_ssp585_info CDHW_duration_spi_ssp585_names CDHW_duration_spei_ssp585_info CDHW_duration_spei_ssp585_names
clear CDHW_severity_twsa_ssp585_info CDHW_severity_twsa_ssp585_names CDHW_severity_spi_ssp585_info CDHW_severity_spi_ssp585_names CDHW_severity_spei_ssp585_info CDHW_severity_spei_ssp585_names

frequency_spatial = ones(126,102,45);
duration_spatial = ones(126,102,45);
severity_spatial = ones(126,102,45);

for k=1:15
    CDHW_frequency_twsa = ones(126,102,40);
    CDHW_duration_twsa = ones(126,102,40);
    CDHW_severity_twsa = ones(126,102,40);
    CDHW_frequency_spi = ones(126,102,20);
    CDHW_duration_spi = ones(126,102,20);
    CDHW_severity_spi = ones(126,102,20);
    CDHW_frequency_spei = ones(126,102,20);
    CDHW_duration_spei = ones(126,102,20);
    CDHW_severity_spei = ones(126,102,20);

    MMMCDHW_frequency_twsa = ones(126,102,4);
    MMMCDHW_duration_twsa = ones(126,102,4);
    MMMCDHW_severity_twsa = ones(126,102,4);
    MMMCDHW_frequency_spi = ones(126,102,4);
    MMMCDHW_duration_spi = ones(126,102,4);
    MMMCDHW_severity_spi = ones(126,102,4);
    MMMCDHW_frequency_spei = ones(126,102,4);
    MMMCDHW_duration_spei = ones(126,102,4);
    MMMCDHW_severity_spei = ones(126,102,4);

    for i=1:4
        for j=1:10
            frequency_data=ncread(CDHW_frequency_twsa_ssp585_paths{(j-1)*15+k}, 'tws');
            for m=1:126
                for n=1:102
                    temp=frequency_data(m,n,1+(i-1)*40:i*40);
                    CDHW_frequency_twsa(m,n,10*(i-1)+j)=mean(temp(:));
                end
            end
        end
    end

    for i=1:4
        for j=1:5
            frequency_data=ncread(CDHW_frequency_spi_ssp585_paths{(j-1)*15+k}, 'tws');
            for m=1:126
                for n=1:102
                    temp=frequency_data(m,n,1+(i-1)*40:i*40);
                    CDHW_frequency_spi(m,n,5*(i-1)+j)=mean(temp(:));
                end
            end
        end
    end

    for i=1:4
        for j=1:5
            frequency_data=ncread(CDHW_frequency_spei_ssp585_paths{(j-1)*15+k}, 'tws');
            for m=1:126
                for n=1:102
                    temp=frequency_data(m,n,1+(i-1)*40:i*40);
                    CDHW_frequency_spei(m,n,5*(i-1)+j)=mean(temp(:));
                end
            end
        end
    end

    for i=1:4
        for j=1:10
            duration_data=ncread(CDHW_duration_twsa_ssp585_paths{(j-1)*15+k}, 'tws');
            for m=1:126
                for n=1:102
                    temp=duration_data(m,n,1+(i-1)*40:i*40);
                    CDHW_duration_twsa(m,n,10*(i-1)+j)=mean(temp(:));
                end
            end
        end
    end

    for i=1:4
        for j=1:5
            duration_data=ncread(CDHW_duration_spi_ssp585_paths{(j-1)*15+k}, 'tws');
            for m=1:126
                for n=1:102
                    temp=duration_data(m,n,1+(i-1)*40:i*40);
                    CDHW_duration_spi(m,n,5*(i-1)+j)=mean(temp(:));
                end
            end
        end
    end

    for i=1:4
        for j=1:5
            duration_data=ncread(CDHW_duration_spei_ssp585_paths{(j-1)*15+k}, 'tws');
            for m=1:126
                for n=1:102
                    temp=duration_data(m,n,1+(i-1)*40:i*40);
                    CDHW_duration_spei(m,n,5*(i-1)+j)=mean(temp(:));
                end
            end
        end
    end

    for i=1:4
        for j=1:10
            severity_data=ncread(CDHW_severity_twsa_ssp585_paths{(j-1)*15+k}, 'tws');
            for m=1:126
                for n=1:102
                    temp=severity_data(m,n,1+(i-1)*40:i*40);
                    CDHW_severity_twsa(m,n,10*(i-1)+j)=mean(temp(:));
                end
            end
        end
    end

    for i=1:4
        for j=1:5
            severity_data=ncread(CDHW_severity_spi_ssp585_paths{(j-1)*15+k}, 'tws');
            for m=1:126
                for n=1:102
                    temp=severity_data(m,n,1+(i-1)*40:i*40);
                    CDHW_severity_spi(m,n,5*(i-1)+j)=mean(temp(:));
                end
            end
        end
    end

    for i=1:4
        for j=1:5
            severity_data=ncread(CDHW_severity_spei_ssp585_paths{(j-1)*15+k}, 'tws');
            for m=1:126
                for n=1:102
                    temp=severity_data(m,n,1+(i-1)*40:i*40);
                    CDHW_severity_spei(m,n,5*(i-1)+j)=mean(temp(:));
                end
            end
        end
    end


    for i=1:4
        for m=1:126
            for n=1:102
                MMMCDHW_frequency_twsa(m,n,i) = mean(CDHW_frequency_twsa(m,n,1+(i-1)*10:i*10));
                MMMCDHW_duration_twsa(m,n,i) = mean(CDHW_duration_twsa(m,n,1+(i-1)*10:i*10));
                MMMCDHW_severity_twsa(m,n,i) = mean(CDHW_severity_twsa(m,n,1+(i-1)*10:i*10));
                MMMCDHW_frequency_spi(m,n,i) = mean(CDHW_frequency_spi(m,n,1+(i-1)*5:i*5));
                MMMCDHW_duration_spi(m,n,i) = mean(CDHW_duration_spi(m,n,1+(i-1)*5:i*5));
                MMMCDHW_severity_spi(m,n,i) = mean(CDHW_severity_spi(m,n,1+(i-1)*5:i*5));
                MMMCDHW_frequency_spei(m,n,i) = mean(CDHW_frequency_spei(m,n,1+(i-1)*5:i*5));
                MMMCDHW_duration_spei(m,n,i) = mean(CDHW_duration_spei(m,n,1+(i-1)*5:i*5));
                MMMCDHW_severity_spei(m,n,i) = mean(CDHW_severity_spei(m,n,1+(i-1)*5:i*5));
            end
        end
    end

    frequency_spatial(:,:,(k-1)*3+1)=(MMMCDHW_frequency_twsa(:,:,4)-MMMCDHW_frequency_twsa(:,:,2))./MMMCDHW_frequency_twsa(:,:,2);
    frequency_spatial(:,:,(k-1)*3+2)=(MMMCDHW_frequency_spi(:,:,4)-MMMCDHW_frequency_spi(:,:,2))./MMMCDHW_frequency_spi(:,:,2);
    frequency_spatial(:,:,k*3)=(MMMCDHW_frequency_spei(:,:,4)-MMMCDHW_frequency_spei(:,:,2))./MMMCDHW_frequency_spei(:,:,2);
    duration_spatial(:,:,(k-1)*3+1)=(MMMCDHW_duration_twsa(:,:,4)-MMMCDHW_duration_twsa(:,:,2))./MMMCDHW_duration_twsa(:,:,2);
    duration_spatial(:,:,(k-1)*3+2)=(MMMCDHW_duration_spi(:,:,4)-MMMCDHW_duration_spi(:,:,2))./MMMCDHW_duration_spi(:,:,2);
    duration_spatial(:,:,k*3)=(MMMCDHW_duration_spei(:,:,4)-MMMCDHW_duration_spei(:,:,2))./MMMCDHW_duration_spei(:,:,2);
    severity_spatial(:,:,(k-1)*3+1)=(MMMCDHW_severity_twsa(:,:,4)-MMMCDHW_severity_twsa(:,:,2))./MMMCDHW_severity_twsa(:,:,2);
    severity_spatial(:,:,(k-1)*3+2)=(MMMCDHW_severity_spi(:,:,4)-MMMCDHW_severity_spi(:,:,2))./MMMCDHW_severity_spi(:,:,2);
    severity_spatial(:,:,k*3)=(MMMCDHW_severity_spei(:,:,4)-MMMCDHW_severity_spei(:,:,2))./MMMCDHW_severity_spei(:,:,2);

    clear CDHW_frequency_twsa CDHW_duration_twsa CDHW_severity_twsa 
    clear CDHW_frequency_spi CDHW_duration_spi CDHW_severity_spi
    clear CDHW_frequency_spei CDHW_duration_spei CDHW_severity_spei
    clear MMMCDHW_frequency_twsa MMMCDHW_duration_twsa MMMCDHW_severity_twsa 
    clear MMMCDHW_frequency_spi MMMCDHW_duration_spi MMMCDHW_severity_spi
    clear MMMCDHW_frequency_spei MMMCDHW_duration_spei MMMCDHW_severity_spei
end


frequency_spatial=frequency_spatial.*100;
duration_spatial=duration_spatial.*100;
severity_spatial=severity_spatial.*100;



china=imread("C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\data\china.tif");
china=double(china)';
china(china==0)=nan;
frequency_spatial=frequency_spatial.*china;
duration_spatial=duration_spatial.*china;
severity_spatial=severity_spatial.*china;



ncwrite("C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\figure\sf_different combinations_spatial\frequency_spatial_ssp585.nc", 'tws', frequency_spatial);
ncwrite("C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\figure\sf_different combinations_spatial\duration_spatial_ssp585.nc", 'tws', duration_spatial);
ncwrite("C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China\figure\sf_different combinations_spatial\severity_spatial_ssp585.nc", 'tws', severity_spatial);





