% ����˵��
% ���Ƚ����ݵ��������һ���ļ���
% ���г���ѡ����һtxt���ɴ�����ļ�������������

clear
clc

[~,path,~]  = uigetfile('*.txt');              % ��������ʾ�Ի���,ѡȡ�����ļ�����ȡ�ļ�·��
filename    = dir(fullfile(path,'*.txt'));     % ��ȡ�ļ���ϸ��Ϣ
sum         = length(filename);                % �ļ������ļ�����ͳ��
SAVE_path   = strcat('E:\01_ALL_THINGS\00_Me\01_TASK\000-MyPaper\09_Solar_Flare\XRA�¼�CMX���ͳ��.txt');   % �������Ͻ���ļ�·��--------------------���޸�
SAVE_fid    = fopen(SAVE_path,'wt');           % �������Ͻ���ļ�������׼��д��

% ��ʼ�����ļ�
for i = 1:sum
    DATA_path = strcat(filename(i).folder,'\',filename(i).name);
    FID_file = fopen(DATA_path,'rt');                               
   
    if FID_file==-1
        msgbox('�ļ�ѡȡ������ȡ�����޷�����','warning','warn');
        return;
    end
    
    % ��ʼ��ȡ�ļ�ÿһ������
    while (1)
        line = fgets(FID_file); 
        % ���ļ������ж�
        if (line==-1)
            break;
        end
        % ������Ҫ�����ļ�����
        % д������
        if(findstr(line,'Date')~=0)  
            data_line = line(1,:);
            fprintf(SAVE_fid, data_line);      % �����д���½�txt
        end         
        % д��ҫ���¼���Ϣ
        if(findstr(line,'XRA  1-8A      C')~=0) 
            if str2num(line(12:15)) <= 900 && str2num(line(12:15)) >= 100
                data_line = line(1,:);
                fprintf(SAVE_fid, data_line);      % �����д���½�txt
            end
        end 
        if(findstr(line,'XRA  1-8A      M')~=0)        
            if str2num(line(12:15)) <= 900 && str2num(line(12:15)) >= 100
                data_line = line(1,:);
                fprintf(SAVE_fid, data_line);      % �����д���½�txt
            end
        end         
        if(findstr(line,'XRA  1-8A      X')~=0)
            if str2num(line(12:15)) <= 900 && str2num(line(12:15)) >= 100
                data_line = line(1,:);
                fprintf(SAVE_fid, data_line);      % �����д���½�txt
            end
        end         
    end
    fclose(FID_file);
end








