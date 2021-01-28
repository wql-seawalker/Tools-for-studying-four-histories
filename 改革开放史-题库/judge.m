% 选择整个流程
click(1,720);% 防止鼠标位置影响下一次截图的选项位置
screencapture;
special_situation;
temp_img=original_picture(370:450,300:1300,:); % 提取特征区域
flag = 0;
tikuhao = 0;

% 输出图像部分
flag3=0;
temp_total_img=original_picture(370:450,300:1300,:);
for i=1:size(total_tiku,4)
    if isequal(temp_total_img,total_tiku(:,:,:,i)) % 题库中已有该题
        flag3 = 1;
        break;
    end
end
if flag3
else
    counttt=counttt+1;
    % 判断选项位置
    for i=1:1440
        if original_picture(i,274,:) == capflag
            xx=i;
        end
    end
    temp_total_img=original_picture(368:xx+20,273:1260,:);
    pathname=strcat('.\total_tiku\history_of_reforming_and_opening_up\',int2str(counttt),'.jpg');
    imwrite(temp_total_img,pathname,'jpg');
    total_tiku=cat(4,total_tiku,original_picture(368:1000,273:1260,:));
end

% 对已有题库的搜索
for i=1:count
    if temp_img == tiku(:,:,:,i) % 题库中已有该题
        flag = 1;
        tikuhao = i;
        break;
    end
end

% 搜索到该题目 进行点击操作
if flag % 题库已有该题目，只需要找到相应答案
    for i=1:5
        if daan(tikuhao,i) ~= 0
            click(287,daan(tikuhao,i));
        end
    end
    
    if flag3
    else
        click(1,720);
        screencapture;
        temp_total_img=original_picture(368:xx+20,273:1260,:);
        pathname=strcat('.\total_tiku\history_of_reforming_and_opening_up_answer\',int2str(counttt),'.jpg');
        imwrite(temp_total_img,pathname,'jpg');
    end
    % 点击提交
    for i=500:1440
        if original_picture(i,300,:) == redflag
            click(300,i+10);% 点提交
            temp_num=i+10;
            pause(1.5);
            break;
        end
    end
% 题库中没有该题目，则添加入题库
else % 题库中还没有该题
    count = count + 1;
    tiku=cat(4,tiku,temp_img);
    % 判断选项位置
    temp_xx=zeros(1,5);
    countt=1;
    for i=1:1440
        if original_picture(i,274,:) == capflag
            if countt==1
                temp_xx(1,countt) = i;
                countt = countt + 1;
                click(287,i);
            elseif i-temp_xx(1,countt-1) > 25
                temp_xx(1,countt) = i;
                countt = countt + 1;
            end
        end
    end
    % 点击提交
    for i=500:1440
        if original_picture(i,300,:) == redflag
            click(300,i+10);% 点提交
            temp_num=i+10;
            click(1,720);% 防止鼠标位置影响下一次截图的选项位置
            pause(1);
            screencapture;
            pause(0.5);
            break;
        end
    end
    % 判断正确选项位置
    temp_xxx=zeros(1,5);% 判断选项位置
    countt=1;
    for i=1:1440
        if original_picture(i,274,:) == trueflag
            if countt==1
                temp_xxx(1,countt) = i;
                countt = countt + 1;
            elseif i-temp_xxx(1,countt-1) > 25
                temp_xxx(1,countt) = i;
                countt = countt + 1;
            end
        end
    end
    if temp_xxx == [0,0,0,0,0]
        daan = [daan;temp_xx(1,1),0,0,0,0];
    else
        daan = [daan;temp_xxx];
        pause(0.5);
    end
end