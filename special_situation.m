% special situatioin
if original_picture(950:1050,1030:1130,:)==bandageflag
    click(1080,1000);
    pause(2);
    click(1080,1000);
    pause(2);
    click(300,1150);
    pause(2);
    screencapture;
end
if original_picture(950:1050,1030:1130,:)==finishflag
    click(1080,1000);
    pause(2);
    click(300,1150);
    pause(2);
    screencapture;
end
if original_picture(950:1050,1030:1130,:)==startflag
    click(300,1150);
    pause(2);
    screencapture;
end
if original_picture(950:1050,1030:1130,:)==exitflag
    delete_data;
    quit;
end