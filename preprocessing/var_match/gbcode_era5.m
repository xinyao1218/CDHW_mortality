clear
clc

% % % % % % % %  ��ȡ�¶����ݲ�����ʱ�����  % % % % % % % % % % % % 
data_11=xlsread('������.xlsx');          data_11(:,2:4)=[];  data_11(:,7)=floor(data_11(:,2)./10000);  data_11(:,8)=floor(mod(data_11(:,2),10000)./100);  data_11(:,9)=mod(data_11(:,2),100);
data_12=xlsread('�����.xlsx');          data_12(:,2:4)=[];  data_12(:,7)=floor(data_12(:,2)./10000);  data_12(:,8)=floor(mod(data_12(:,2),10000)./100);  data_12(:,9)=mod(data_12(:,2),100);
data_13=xlsread('�ӱ�ʡ_1.xlsx');        data_13(:,2:4)=[];  data_13(:,7)=floor(data_13(:,2)./10000);  data_13(:,8)=floor(mod(data_13(:,2),10000)./100);  data_13(:,9)=mod(data_13(:,2),100);
data_131=xlsread('�ӱ�ʡ_2.xlsx');       data_131(:,2:4)=[];  data_131(:,7)=floor(data_131(:,2)./10000);  data_131(:,8)=floor(mod(data_131(:,2),10000)./100);  data_131(:,9)=mod(data_131(:,2),100);
data_13(795334:795333+length(data_131),:)=data_131;
data_14=xlsread('ɽ��ʡ.xlsx');          data_14(:,2:4)=[];  data_14(:,7)=floor(data_14(:,2)./10000);  data_14(:,8)=floor(mod(data_14(:,2),10000)./100);  data_14(:,9)=mod(data_14(:,2),100);
data_15=xlsread('���ɹ�������.xlsx');    data_15(:,2:4)=[];  data_15(:,7)=floor(data_15(:,2)./10000);  data_15(:,8)=floor(mod(data_15(:,2),10000)./100);  data_15(:,9)=mod(data_15(:,2),100);
data_21=xlsread('����ʡ.xlsx');          data_21(:,2:4)=[];  data_21(:,7)=floor(data_21(:,2)./10000);  data_21(:,8)=floor(mod(data_21(:,2),10000)./100);  data_21(:,9)=mod(data_21(:,2),100);
data_22=xlsread('����ʡ.xlsx');          data_22(:,2:4)=[];  data_22(:,7)=floor(data_22(:,2)./10000);  data_22(:,8)=floor(mod(data_22(:,2),10000)./100);  data_22(:,9)=mod(data_22(:,2),100);
data_23=xlsread('������ʡ.xlsx');        data_23(:,2:4)=[];  data_23(:,7)=floor(data_23(:,2)./10000);  data_23(:,8)=floor(mod(data_23(:,2),10000)./100);  data_23(:,9)=mod(data_23(:,2),100);
data_31=xlsread('�Ϻ���.xlsx');          data_31(:,2:4)=[];  data_31(:,7)=floor(data_31(:,2)./10000);  data_31(:,8)=floor(mod(data_31(:,2),10000)./100);  data_31(:,9)=mod(data_31(:,2),100);
data_32=xlsread('����ʡ.xlsx');          data_32(:,2:4)=[];  data_32(:,7)=floor(data_32(:,2)./10000);  data_32(:,8)=floor(mod(data_32(:,2),10000)./100);  data_32(:,9)=mod(data_32(:,2),100);
data_33=xlsread('�㽭ʡ.xlsx');          data_33(:,2:4)=[];  data_33(:,7)=floor(data_33(:,2)./10000);  data_33(:,8)=floor(mod(data_33(:,2),10000)./100);  data_33(:,9)=mod(data_33(:,2),100);
data_34=xlsread('����ʡ.xlsx');          data_34(:,2:4)=[];  data_34(:,7)=floor(data_34(:,2)./10000);  data_34(:,8)=floor(mod(data_34(:,2),10000)./100);  data_34(:,9)=mod(data_34(:,2),100);
data_35=xlsread('����ʡ.xlsx');          data_35(:,2:4)=[];  data_35(:,7)=floor(data_35(:,2)./10000);  data_35(:,8)=floor(mod(data_35(:,2),10000)./100);  data_35(:,9)=mod(data_35(:,2),100);
data_36=xlsread('����ʡ.xlsx');          data_36(:,2:4)=[];  data_36(:,7)=floor(data_36(:,2)./10000);  data_36(:,8)=floor(mod(data_36(:,2),10000)./100);  data_36(:,9)=mod(data_36(:,2),100);
data_37=xlsread('ɽ��ʡ.xlsx');          data_37(:,2:4)=[];  data_37(:,7)=floor(data_37(:,2)./10000);  data_37(:,8)=floor(mod(data_37(:,2),10000)./100);  data_37(:,9)=mod(data_37(:,2),100);
data_41=xlsread('����ʡ.xlsx');          data_41(:,2:4)=[];  data_41(:,7)=floor(data_41(:,2)./10000);  data_41(:,8)=floor(mod(data_41(:,2),10000)./100);  data_41(:,9)=mod(data_41(:,2),100);
data_42=xlsread('����ʡ.xlsx');          data_42(:,2:4)=[];  data_42(:,7)=floor(data_42(:,2)./10000);  data_42(:,8)=floor(mod(data_42(:,2),10000)./100);  data_42(:,9)=mod(data_42(:,2),100);
data_43=xlsread('����ʡ.xlsx');          data_43(:,2:4)=[];  data_43(:,7)=floor(data_43(:,2)./10000);  data_43(:,8)=floor(mod(data_43(:,2),10000)./100);  data_43(:,9)=mod(data_43(:,2),100);
data_44=xlsread('�㶫ʡ.xlsx');          data_44(:,2:4)=[];  data_44(:,7)=floor(data_44(:,2)./10000);  data_44(:,8)=floor(mod(data_44(:,2),10000)./100);  data_44(:,9)=mod(data_44(:,2),100);
data_45=xlsread('����׳��������.xlsx');   data_45(:,2:4)=[];  data_45(:,7)=floor(data_45(:,2)./10000);  data_45(:,8)=floor(mod(data_45(:,2),10000)./100);  data_45(:,9)=mod(data_45(:,2),100);
data_46=xlsread('����ʡ.xlsx');          data_46(:,2:4)=[];  data_46(:,7)=floor(data_46(:,2)./10000);  data_46(:,8)=floor(mod(data_46(:,2),10000)./100);  data_46(:,9)=mod(data_46(:,2),100);
data_50=xlsread('������.xlsx');          data_50(:,2:4)=[];  data_50(:,7)=floor(data_50(:,2)./10000);  data_50(:,8)=floor(mod(data_50(:,2),10000)./100);  data_50(:,9)=mod(data_50(:,2),100);
data_51=xlsread('�Ĵ�ʡ_1.xlsx');          data_51(:,2:4)=[];  data_51(:,7)=floor(data_51(:,2)./10000);  data_51(:,8)=floor(mod(data_51(:,2),10000)./100);  data_51(:,9)=mod(data_51(:,2),100);
data_151=xlsread('�Ĵ�ʡ_2.xlsx');          data_151(:,2:4)=[];  data_151(:,7)=floor(data_151(:,2)./10000);  data_151(:,8)=floor(mod(data_151(:,2),10000)./100);  data_151(:,9)=mod(data_151(:,2),100);
data_51(795334:795333+length(data_151),:)=data_151;
data_52=xlsread('����ʡ.xlsx');          data_52(:,2:4)=[];  data_52(:,7)=floor(data_52(:,2)./10000);  data_52(:,8)=floor(mod(data_52(:,2),10000)./100);  data_52(:,9)=mod(data_52(:,2),100);
data_53=xlsread('����ʡ.xlsx');          data_53(:,2:4)=[];  data_53(:,7)=floor(data_53(:,2)./10000);  data_53(:,8)=floor(mod(data_53(:,2),10000)./100);  data_53(:,9)=mod(data_53(:,2),100);
data_54=xlsread('����������.xlsx');      data_54(:,2:4)=[];  data_54(:,7)=floor(data_54(:,2)./10000);  data_54(:,8)=floor(mod(data_54(:,2),10000)./100);  data_54(:,9)=mod(data_54(:,2),100);
data_61=xlsread('����ʡ.xlsx');          data_61(:,2:4)=[];  data_61(:,7)=floor(data_61(:,2)./10000);  data_61(:,8)=floor(mod(data_61(:,2),10000)./100);  data_61(:,9)=mod(data_61(:,2),100);
data_62=xlsread('����ʡ.xlsx');          data_62(:,2:4)=[];  data_62(:,7)=floor(data_62(:,2)./10000);  data_62(:,8)=floor(mod(data_62(:,2),10000)./100);  data_62(:,9)=mod(data_62(:,2),100);
data_63=xlsread('�ຣʡ.xlsx');          data_63(:,2:4)=[];  data_63(:,7)=floor(data_63(:,2)./10000);  data_63(:,8)=floor(mod(data_63(:,2),10000)./100);  data_63(:,9)=mod(data_63(:,2),100);
data_64=xlsread('���Ļ���������.xlsx');   data_64(:,2:4)=[];  data_64(:,7)=floor(data_64(:,2)./10000);  data_64(:,8)=floor(mod(data_64(:,2),10000)./100);  data_64(:,9)=mod(data_64(:,2),100);
data_65=xlsread('�½�ά���������.xlsx'); data_65(:,2:4)=[];  data_65(:,7)=floor(data_65(:,2)./10000);  data_65(:,8)=floor(mod(data_65(:,2),10000)./100);  data_65(:,9)=mod(data_65(:,2),100);
data_71=xlsread('̨��ʡ.xlsx');          data_71(:,2:4)=[];  data_71(:,7)=floor(data_71(:,2)./10000);  data_71(:,8)=floor(mod(data_71(:,2),10000)./100);  data_71(:,9)=mod(data_71(:,2),100);
data_81=xlsread('����ر�������.xlsx');   data_81(:,2:4)=[];  data_81(:,7)=floor(data_81(:,2)./10000);  data_81(:,8)=floor(mod(data_81(:,2),10000)./100);  data_81(:,9)=mod(data_81(:,2),100);
data_82=xlsread('�����ر�������.xlsx');   data_82(:,2:4)=[];  data_82(:,7)=floor(data_82(:,2)./10000);  data_82(:,8)=floor(mod(data_82(:,2),10000)./100);  data_82(:,9)=mod(data_82(:,2),100);
clear data_131 data_151

%% 
% % % % % % % % % % %  ��ȡ��ƥ�����ݼ�Ԥ����  % % % % % % % % % % % %
[filename,filepath]=uigetfile('*.xlsx','��ѡ���ƥ���ļ�');
file=strcat(filepath,filename);
data=xlsread(file);
data(:,5:6)=[];
data(:,6)=floor(data(:,5)/10000);
data_end(:,1)=data(:,1);
data_end(:,2)=data(:,5);
data_end(:,3)=data(:,2);
data_end(:,4)=data(:,3);
data_end(:,5)=data(:,4);
len_data=length(data);
day_need=input('���������ȡ�¶ȵ�����������ǰ�����죩��   day=');
temp_type=input('��������Ҫ��ȡ���¶����͵���ţ�1-��ƽ���¶ȣ�2-������¶ȣ�3-������¶ȣ�4-��¶���¶ȣ���   type=');


%% 
% % % % % % % % % % %  ѭ��ƥ��  % % % % % % % % % % % %
for i=1:len_data
    data_temp=eval(strcat('data_',num2str(data(i,6))));
    for j=1:length(data_temp)/6573
        if data(i,5)==data_temp((j-1)*6573+1,1)
            row_a=floor((data(i,2)-2001)/4);
            row_1=row_a*1461;
            row_b=data(i,2)-(2001+row_a*4);
            row_2=row_b*365;
            if data(i,3)>2
                row_3=(data(i,3)-1)*30-floor(data(i,3)/2)*(floor(data(i,3)/9)-1)+ceil(data(i,3)/2)*floor(data(i,3)/9)-(2-floor(row_b/3));
            else
                row_3=(data(i,3)-1)*30-floor(data(i,3)/2)*(floor(data(i,3)/9)-1)+ceil(data(i,3)/2)*floor(data(i,3)/9);
            end
            row_4=data(i,4);
            row_ymd=row_1+row_2+row_3+row_4;
            row_data=(j-1)*6573+row_ymd;
            data_end(i,6:day_need+6)=data_temp(row_data:-1:row_data-day_need,temp_type+2)';
            clear row_a row_b row_1 row_2 row_3 row_4 row_ymd row_data data_temp
            break
        end
    end
end
name_pre = strtok(filename,'.');
name=strcat(name_pre,'_max_365.csv');
name_end=strcat(filepath,name);
csvwrite(name_end,data_end);
            
        
    
