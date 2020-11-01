% 选择整个流程
screencapture;
special_situation;
temp_img=original_picture(370:450,400:600,:); % 提取特征区域
flag = 0;
tikuhao = 0;
for i=1:count
    if temp_img == tiku(:,:,:,i) % 题库中已有该题
        flag = 1;
        tikuhao = i;
        break;
    end
end
if flag % 题库已有该题目，只需要找到相应答案
    for i=1:5
        if daan(tikuhao,i) ~= 0
            click(287,daan(tikuhao,i));
        end
    end
    for i=500:1440
        if original_picture(i,300,:) == redflag
            click(300,i+10);% 点提交
            click(1,720);
            screencapture;
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
            else
                daan(tikuhao,:)=temp_xxx;
            end
            pause(0.1);
            break;
        end
    end
else % 题库中还没有该题
    count = count + 1;
    tiku=cat(4,tiku,temp_img);
    
    temp_xx=zeros(1,5);% 判断选项位置
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