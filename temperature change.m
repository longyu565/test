clc
clear
close all
filename='�¶�.gif';          %���·��+������ļ���.gif
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
%[c,pos]=sort(b);%posΪ�������±�,cΪ��һ�е�������;
%B(2,:)=B(2,pos);%�ڶ��а��յ�һ��������±��Ӧ
%B(1,:)=c;%��һ�н�����¸���a �ĵ�һ��

%sizeMarker = linspace(1, 100, length(x));    % ��0��ֵԽ����Խ��
%colorMarker = y;   % ��ɫ����
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
xlabel('γ�ȣ��㣩')
ylabel('���ȣ��㣩')
xlim([0 10]) %X,Y��ȡֵ��Χ
ylim([0  10])
grid on
%h = colorbar;%�Ҳ���ɫ��
%set(get(h,'label'),'string','����۸� (Ԫ)');%���Ҳ���ɫ������
fmat(:,w)=getframe;
frame = getframe(gcf); 
    im = frame2im(frame);     %��ӰƬ����ת��Ϊ��ַͼ��,��Ϊͼ�������index����ͼ��
  
    [I,map] = rgb2ind(im,20); %�����ɫͼ��ת��Ϊ����ͼ��
    if w==1
        imwrite(I,map,filename,'gif','Loopcount',inf,'DelayTime',0.3);     %Loopcountֻ����i==1��ʱ�������
    else
        imwrite(I,map,filename,'gif','WriteMode','append','DelayTime',0.3);%DelayTime:֡��֮֡���ʱ����
    end


end
movie(fmat,10,1)