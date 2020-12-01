% 选择整个流程
screencapture;
special_situation;
temp_img=original_picture(370:450,400:600,:); % 提取特征区域
flag = 0;
flag2 = 1;
tikuhao = 0;

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
    % 对于第二题库优先搜索
    for i=1:size(daan2,1)
        if tikuhao == daan2(i,1)
            if original_picture(360:430,300:1300,:) == tiku2(:,:,:,i)
                flag2=0;% 搜索到该题目
                for j=2:6
                    if daan2(i,j) ~= 0
                        click(287,daan2(i,j));
                    end
                end
                break;
            end
        end
    end
    
    % 在第二题库没有搜索到该题目，在第一题库进行操作
    if flag2
        for i=1:5
            if daan(tikuhao,i) ~= 0
                click(287,daan(tikuhao,i));
            end
        end
    end
    % 提交 并反馈是否正确
    for i=500:1440
        if original_picture(i,300,:) == redflag
            click(300,i+10);% 点提交
            % 判断答案是否正确，以确定是否加入第二题库
            click(1,720);
            screencapture2;
            temp_xxx=zeros(1,5);% 判断选项位置
            countt=1;
            for i=1:1440
                if original_picture2(i,274,:) == trueflag
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
            else
                tiku2=cat(4,tiku2,original_picture(360:430,300:1300,:));
                daan2=[daan2;tikuhao,temp_xxx];
                pause(0.1);
            end
            pause(0.1);
            break;
        end
    end
% 题库中没有该题目，则添加入第一题库
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
            screencapture;
            pause(1.5);
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
        % click(300,temp_num);% 下一题
        pause(0.5);
    end
end

click(1,720);% 防止鼠标位置影响下一次截图的选项位置