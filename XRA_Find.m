% ����˵��
% ���Ƚ����ݵ��������һ���ļ���
% ���г���ѡ����һtxt���ɴ�����ļ�������������

clear
clc

[~,path,~]  = uigetfile('*.txt');              % ��������ʾ�Ի���,ѡȡ�����ļ�����ȡ�ļ�·��
filename    = dir(fullfile(path,'*.txt'));     % ��ȡ�ļ���ϸ��Ϣ
sum         = length(filename);                % �ļ������ļ�����ͳ��
SAVE_path   = strcat('E:\01_ALL_THINGS\00_Me\01_TASK\000-MyPaper\09_Solar_Flare\XRA�¼����ͳ��.txt');   % �������Ͻ���ļ�·��--------------------���޸�
SAVE_fid    = fopen(SAVE_path,'wt');           % �������Ͻ���ļ�������׼��д��

num = 0;                                % ͳ�����Ͻ���ļ�����
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
        if(findstr(line,'Date')~=0)  
            num = num + 1;
            data_line = line(1,:);
            fprintf(SAVE_fid, data_line);      % �����д���½�txt
        end         
        if(findstr(line,'XRA')~=0)  
            num = num + 1;
%             data_line1 = line(1,43);
%             data_line2 = line(56,end);
%             data_line  = strcat(data_line1,data_line2);
            
            data_line = line(1,:);
            fprintf(SAVE_fid, data_line);      % �����д���½�txt
        end 
    end
    fclose(FID_file);
end

fclose(SAVE_fid);

DATA_path = strcat('E:\01_ALL_THINGS\00_Me\01_TASK\000-MyPaper\09_Solar_Flare\XRA�¼����ͳ��.txt');
FID_file2 = fopen(DATA_path,'rt'); 

SAVE_path2   = strcat('E:\01_ALL_THINGS\00_Me\01_TASK\000-MyPaper\09_Solar_Flare\XRA_X����ҫ���¼����ͳ��.txt');   % �������Ͻ���ļ�·��--------------------���޸�
SAVE_fid2    = fopen(SAVE_path2,'wt');           % �������Ͻ���ļ�������׼��д��

num = 0;

while (1)
    line = fgets(FID_file2); 
    % ���ļ������ж�
    if (line==-1)
        break;
    end
    % ������Ҫ�����ļ�����
    
    if(findstr(line,'Date')~=0)  
        num = num + 1;
        data_line = line(1,:);
        fprintf(SAVE_fid2, data_line);      % �����д���½�txt
    end
    if(findstr(line,'XRA  1-8A      X')~=0)  
        num = num + 1;
        data_line = line(1,:);
        fprintf(SAVE_fid2, data_line);      % �����д���½�txt
    end         
    num
end








