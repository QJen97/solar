% 程序说明
% 首先将数据单独存放至一个文件夹
% 运行程序选中任一txt即可处理该文件夹下所有数据

clear
clc

[~,path,~]  = uigetfile('*.txt');              % 创建并显示对话框,选取所有文件，获取文件路径
filename    = dir(fullfile(path,'*.txt'));     % 获取文件详细信息
sum         = length(filename);                % 文件夹内文件个数统计
SAVE_path   = strcat('E:\01_ALL_THINGS\00_Me\01_TASK\000-MyPaper\09_Solar_Flare\XRA事件结果统计.txt');   % 设置整合结果文件路径--------------------可修改
SAVE_fid    = fopen(SAVE_path,'wt');           % 创建整合结果文件，并打开准备写入

num = 0;                                % 统计整合结果文件行数
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
        if(findstr(line,'Date')~=0)  
            num = num + 1;
            data_line = line(1,:);
            fprintf(SAVE_fid, data_line);      % 将结果写入新建txt
        end         
        if(findstr(line,'XRA')~=0)  
            num = num + 1;
%             data_line1 = line(1,43);
%             data_line2 = line(56,end);
%             data_line  = strcat(data_line1,data_line2);
            
            data_line = line(1,:);
            fprintf(SAVE_fid, data_line);      % 将结果写入新建txt
        end 
    end
    fclose(FID_file);
end

fclose(SAVE_fid);

DATA_path = strcat('E:\01_ALL_THINGS\00_Me\01_TASK\000-MyPaper\09_Solar_Flare\XRA事件结果统计.txt');
FID_file2 = fopen(DATA_path,'rt'); 

SAVE_path2   = strcat('E:\01_ALL_THINGS\00_Me\01_TASK\000-MyPaper\09_Solar_Flare\XRA_X级别耀斑事件结果统计.txt');   % 设置整合结果文件路径--------------------可修改
SAVE_fid2    = fopen(SAVE_path2,'wt');           % 创建整合结果文件，并打开准备写入

num = 0;

while (1)
    line = fgets(FID_file2); 
    % 读文件结束判断
    if (line==-1)
        break;
    end
    % 根据需要查找文件内容
    
    if(findstr(line,'Date')~=0)  
        num = num + 1;
        data_line = line(1,:);
        fprintf(SAVE_fid2, data_line);      % 将结果写入新建txt
    end
    if(findstr(line,'XRA  1-8A      X')~=0)  
        num = num + 1;
        data_line = line(1,:);
        fprintf(SAVE_fid2, data_line);      % 将结果写入新建txt
    end         
    num
end








