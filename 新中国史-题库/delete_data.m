for i=size(daan,1):-1:1
    if daan(i,:)==[0,0,0,0,0]
        daan(i,:)=[];
        tiku(:,:,:,i)=[];
        count=count-1;
    end
end
save('count_chi.mat','count');
save('tiku_chi.mat','tiku');
save('daan_chi.mat','daan');
save('counttt.mat','counttt');
save('total_tiku.mat','total_tiku');