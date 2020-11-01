function click(x,y)
    robot = java.awt.Robot;
    for k=1:10
        robot.mouseMove(x,y); %移动鼠标到指定位置
    end
    robot.mousePress  (java.awt.event.InputEvent.BUTTON1_MASK);%鼠标左键按
    robot.mouseRelease(java.awt.event.InputEvent.BUTTON1_MASK);%鼠标左键放
    pause(0.1);
end