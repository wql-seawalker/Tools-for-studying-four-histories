for j=1:size(mark,2)
i=mark(1,j);
pathname=strcat('.\total_tiku\history_of_reforming_and_opening_up\',int2str(i),'.jpg');
delete(pathname);
pathname=strcat('.\total_tiku\history_of_reforming_and_opening_up_answer\',int2str(i),'.jpg');
delete(pathname);
end