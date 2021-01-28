load('counttt.mat');
load('flag.mat');
for i=1:1300
    flagg=1;
    pathname=strcat('.\total_tiku\new_china_history\',int2str(i),'.jpg');
    if exist(pathname,'file')
        im=imread(pathname);
        for j=1:size(im,1)
            if im(j,2,:)==capflag
                flagg=0;
                break
            end
        end
        if flagg
            delete(pathname);
        end
        pathname=strcat('.\total_tiku\new_china_history_answer\',int2str(i),'.jpg');
        if flagg && exist(pathname,'file')
            delete(pathname);
        end
    end
end