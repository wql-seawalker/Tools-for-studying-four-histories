t = java.awt.Toolkit.getDefaultToolkit();
rec = java.awt.Rectangle(t.getScreenSize());
robo = java.awt.Robot;
% t = java.awt.Toolkit.getDefaultToolkit();
rec = java.awt.Rectangle(t.getScreenSize());
image = robo.createScreenCapture(rec);
filehandle = java.io.File('xxx.png');
javax.imageio.ImageIO.write(image,'png',filehandle);
original_picture=imread('xxx.png');