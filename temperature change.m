clc
clear
close all
filename='温度.gif';          %输出路径+保存的文件名.gif
data=xlsread('D:\file\Test_001.xls');
fmat=moviein(10);
for w=1:10
 x=data(3*w-2,:);
y=data(3*w-1,:);
z=data(3*w,:);
%[xx yy]=meshgrid(x.y);

%B=repmat(x(1:end),y(1:end),1);
%meshgrid
%b=B(1,:);
%[c,pos]=sort(b);%pos为排序后的下标,c为第一行的排序结果;
%B(2,:)=B(2,pos);%第二行按照第一行排序的下标对应
%B(1,:)=c;%第一行结果重新赋给a 的第一行

%sizeMarker = linspace(1, 100, length(x));    % 比0大，值越大标记越大
%colorMarker = y;   % 颜色渐变
%subplot(1,2,1)
%plot(x,y,'-o')
gscatter(x,y,z)
%scatter(x, y, sizeMarker, colorMarker, 'o', 'filled')
%subplot(1,2,2)
%patch([x NaN],[y NaN],[colorMarker NaN],'Marker','o','EdgeColor','interp','MarkerFaceColor','flat')
%xx=linspace(1,50);
%yy=spline(x,y,xx);
%hold on
%plot(xx,yy,'r')
%patch(x,y,y,'EdgeColor','flat','LineWidth',1,'MarkerFaceColor','flat','FaceColor','none')
%set(a, 'CLim', [0 1]);

colorbar
%m=linspace(0,1,length(x))
%for i=1:length(x)
 % plot(x(i),y(i),'-o','color',[m(i) 0 0])
  %hold on
%end
xlabel('纬度（°）')
ylabel('经度（°）')
xlim([0 10]) %X,Y轴取值范围
ylim([0  10])
grid on
%h = colorbar;%右侧颜色栏
%set(get(h,'label'),'string','任务价格 (元)');%给右侧颜色栏命名
fmat(:,w)=getframe;
frame = getframe(gcf); 
    im = frame2im(frame);     %将影片动画转换为编址图像,因为图像必须是index索引图像
  
    [I,map] = rgb2ind(im,20); %将真彩色图像转化为索引图像
    if w==1
        imwrite(I,map,filename,'gif','Loopcount',inf,'DelayTime',0.3);     %Loopcount只是在i==1的时候才有用
    else
        imwrite(I,map,filename,'gif','WriteMode','append','DelayTime',0.3);%DelayTime:帧与帧之间的时间间隔
    end


end
movie(fmat,10,1)