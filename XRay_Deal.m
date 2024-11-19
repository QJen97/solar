% clear
% clc

% path = 'E:\01_ALL_THINGS\00_Me\01_TASK\000-MyPaper\09_Solar_Flare\05_����\01_ԭʼ����\01_X����ͨ������\G16\sci_xrsf-l2-flx1s_g16_d20240222_v2-2-0.nc';
% 
% ncdisp(path);
% 
% Data = ncread(path,'xrsb_flux');
% plot(Data)
% 
% hold on

% ����˵��
% ���Ƚ����ݵ��������һ���ļ���
% ���г���ѡ����һtxt���ɴ�����ļ�������������

clear
clc

[~,path,~]  = uigetfile('*.nc');              % ��������ʾ�Ի���,ѡȡ�����ļ�����ȡ�ļ�·��
filename    = dir(fullfile(path,'*.nc'));     % ��ȡ�ļ���ϸ��Ϣ
sum         = length(filename);                % �ļ������ļ�����ͳ��

for i = 1:sum
    i
    DATA_path = strcat(filename(i).folder,'\',filename(i).name)
    Data = ncread(DATA_path,'xrsb_flux');
    All_Data(:,i) = Data;
    Data = [];
end

xlswrite('filename11.xlsx', All_Data, 'Sheet1')
































