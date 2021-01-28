% special situatioin
if original_picture(950:1050,1030:1130,:)==bandageflag
    if ia<=19
        ia=0;
    end
    click(1080,1000);
    pause(1.5);
    click(1080,1000);
    pause(1.5);
    click(1270,1150);
    pause(1.5);
    screencapture;
end
if original_picture(950:1050,1030:1130,:)==finishflag
    if ia<=19
        ia=0;
    end
    click(1080,1000);
    pause(1.5);
    click(1270,1150);
    pause(1.5);
    screencapture;
end
if original_picture(950:1050,1030:1130,:)==startflag
    click(1270,1150);
    pause(1.5);
    screencapture;
end
if original_picture(950:1050,1030:1130,:)==exitflag
    delete_data;
    quit;
end