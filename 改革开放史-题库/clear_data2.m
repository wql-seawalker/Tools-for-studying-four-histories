load('counttt.mat');
load('flag.mat');
for i=1:1000
    flagg=1;
    pathname=strcat('.\total_tiku\history_of_reforming_and_opening_up\',int2str(i),'.jpg');
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
        pathname=strcat('.\total_tiku\history_of_reforming_and_opening_up_answer\',int2str(i),'.jpg');
        if flagg && exist(pathname,'file')
            delete(pathname);
        end
    end
end