t0=0.1; 
fs=12000; %����Ƶ��
fc=1000;%�ز�Ƶ��
Vm=2;%�ز����
A0=1;%ֱ������
n=-t0/2:1/fs:t0/2;
x=cos(150*pi*n);%�����ź�
y2=Vm*cos(2*pi*fc*n);%�ز��ź�
N=length(x);
Y2=fft(y2);
figure(1);

%�ز��ź�ʱ��Ƶ��ͼ
subplot(4,2,1);plot(n,y2);
axis([-0.01,0.01,-5,5]);
title('�ز��ź�');
w=(-N/2:1:N/2-1);
subplot(4,2,2);
plot(w,abs(fftshift(Y2)));
title('�ز��ź�Ƶ��');

%�����ź�ʱ��Ƶ��ͼ
%y=(A0+0.5*x).*cos(2*pi*fc*n);%����
%y=(0.5*x).*cos(2*pi*fc*n);
y=cos(2*pi*fc*n+y);
subplot(4,2,3);plot(n,x);
title('�����ź�');
X=fft(x);Y=fft(y);%����Ҷ�任
subplot(4,2,4);plot(w,abs(fftshift(X)));
title('�����ź�Ƶ��');

%�ѵ��ź�ʱ��Ƶ��ͼ
subplot(4,2,5);plot(n,y)
title('�ѵ��ź�');
subplot(4,2,6);plot(w,abs(fftshift(Y)));
title('�ѵ��ź�Ƶ��');

%����ź�ʱ��Ƶ��ͼ
y2=y.*Vm.*cos(2*pi*fc*n);%�����Ƶ�װ���
wp=40/N*pi;ws=60/N*pi;Rp=1;As=15;T=1;%������˹�˲���
OmegaP=wp/T;OmegaS=ws/T;
[cs,ds]=afd_butt(OmegaP,OmegaS,Rp,As);
[b,a]=imp_invr(cs,ds,T);
y3=filter(b,a,y2);
y=y3-A0;%��ȥֱ��������ý�����ź�
subplot(4,2,7);plot(n,y)
title('����ź�');
Y=fft(y);
subplot(4,2,8);plot(w,abs(fftshift(Y)));
% axis([0,pi/4,0,1000]);
title('����ź�Ƶ��');
