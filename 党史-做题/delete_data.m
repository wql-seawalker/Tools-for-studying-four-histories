for i=size(daan,1):-1:1
    if daan(i,:)==[0,0,0,0,0]
        daan(i,:)=[];
        tiku(:,:,:,i)=[];
        count=count-1;
    end
end
delete_num=[];
for i=size(daan2,1)-1:-1:1
    for j=size(daan2,1):-1:i+1
        if isequal(tiku2(:,:,:,i),tiku2(:,:,:,j))
            flagg=1;
            for k=1:size(delete_num,2)
                if delete_num(1,k)==j
                    flagg=0;
                    break;
                end
            end
            if flagg
                delete_num=[delete_num,j];
            end
        end
    end
end
delete_num=fliplr(sort(delete_num));
for i = 1:size(delete_num,2)
tiku2(:,:,:,delete_num(1,i))=[];
daan2(delete_num(1,i),:)=[];
end
save('count.mat','count');
save('tiku.mat','tiku');
save('daan.mat','daan');
save('daan2.mat','daan2');
save('tiku2.mat','tiku2');