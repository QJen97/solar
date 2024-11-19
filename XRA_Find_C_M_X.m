% 程序说明
% 首先将数据单独存放至一个文件夹
% 运行程序选中任一txt即可处理该文件夹下所有数据

clear
clc

[~,path,~]  = uigetfile('*.txt');              % 创建并显示对话框,选取所有文件，获取文件路径
filename    = dir(fullfile(path,'*.txt'));     % 获取文件详细信息
sum         = length(filename);                % 文件夹内文件个数统计
SAVE_path   = strcat('E:\01_ALL_THINGS\00_Me\01_TASK\000-MyPaper\09_Solar_Flare\XRA事件CMX结果统计.txt');   % 设置整合结果文件路径--------------------可修改
SAVE_fid    = fopen(SAVE_path,'wt');           % 创建整合结果文件，并打开准备写入

% 开始整合文件
for i = 1:sum
    DATA_path = strcat(filename(i).folder,'\',filename(i).name);
    FID_file = fopen(DATA_path,'rt');                               
   
    if FID_file==-1
        msgbox('文件选取出错，读取程序无法运行','warning','warn');
        return;
    end
    
    % 开始读取文件每一行数据
    while (1)
        line = fgets(FID_file); 
        % 读文件结束判断
        if (line==-1)
            break;
        end
        % 根据需要查找文件内容
        % 写入日期
        if(findstr(line,'Date')~=0)  
            data_line = line(1,:);
            fprintf(SAVE_fid, data_line);      % 将结果写入新建txt
        end         
        % 写入耀斑事件信息
        if(findstr(line,'XRA  1-8A      C')~=0) 
            if str2num(line(12:15)) <= 900 && str2num(line(12:15)) >= 100
                data_line = line(1,:);
                fprintf(SAVE_fid, data_line);      % 将结果写入新建txt
            end
        end 
        if(findstr(line,'XRA  1-8A      M')~=0)        
            if str2num(line(12:15)) <= 900 && str2num(line(12:15)) >= 100
                data_line = line(1,:);
                fprintf(SAVE_fid, data_line);      % 将结果写入新建txt
            end
        end         
        if(findstr(line,'XRA  1-8A      X')~=0)
            if str2num(line(12:15)) <= 900 && str2num(line(12:15)) >= 100
                data_line = line(1,:);
                fprintf(SAVE_fid, data_line);      % 将结果写入新建txt
            end
        end         
    end
    fclose(FID_file);
end








