for i=size(daan,1):-1:1
    if daan(i,:)==[0,0,0,0,0]
        daan(i,:)=[];
        tiku(:,:,:,i)=[];
        count=count-1;
    end
end
save('count.mat','count');
save('tiku.mat','tiku');
save('daan.mat','daan');
save('total_tiku.mat','total_tiku');
save('counttt.mat','counttt');