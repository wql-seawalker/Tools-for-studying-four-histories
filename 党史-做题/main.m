% import java.awt.Robot;
robot = java.awt.Robot;
% load data
load('flag.mat');
load('count.mat');
load('tiku.mat');
load('daan.mat');
load('daan2.mat');
load('tiku2.mat');
pause(5);% 等待界面调至答题界面
delay_time = 1.5;

for ia=8000:-1:1
    judge;
end
delete_data;
% save('flag.mat','capflag','redflag','trueflag','falseflag','bandageflag','finishflag','startflag','exitflag');