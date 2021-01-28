for j=1:size(mark,2)
i=mark(1,j);
pathname=strcat('.\total_tiku\new_china_history\',int2str(i),'.jpg');
delete(pathname);
pathname=strcat('.\total_tiku\new_china_history_answer\',int2str(i),'.jpg');
delete(pathname);
end