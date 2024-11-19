% clear
% clc

% path = 'E:\01_ALL_THINGS\00_Me\01_TASK\000-MyPaper\09_Solar_Flare\05_数据\01_原始数据\01_X射线通量数据\G16\sci_xrsf-l2-flx1s_g16_d20240222_v2-2-0.nc';
% 
% ncdisp(path);
% 
% Data = ncread(path,'xrsb_flux');
% plot(Data)
% 
% hold on

% 程序说明
% 首先将数据单独存放至一个文件夹
% 运行程序选中任一txt即可处理该文件夹下所有数据

clear
clc

[~,path,~]  = uigetfile('*.nc');              % 创建并显示对话框,选取所有文件，获取文件路径
filename    = dir(fullfile(path,'*.nc'));     % 获取文件详细信息
sum         = length(filename);                % 文件夹内文件个数统计

for i = 1:sum
    i
    DATA_path = strcat(filename(i).folder,'\',filename(i).name)
    Data = ncread(DATA_path,'xrsb_flux');
    All_Data(:,i) = Data;
    Data = [];
end

xlswrite('filename11.xlsx', All_Data, 'Sheet1')
































