t0=0.1; 
fs=12000; %采样频率
fc=1000;%载波频率
Vm=2;%载波振幅
A0=1;%直流分量
n=-t0/2:1/fs:t0/2;
x=cos(150*pi*n);%调制信号
y2=Vm*cos(2*pi*fc*n);%载波信号
N=length(x);
Y2=fft(y2);
figure(1);

%载波信号时域频域图
subplot(4,2,1);plot(n,y2);
axis([-0.01,0.01,-5,5]);
title('载波信号');
w=(-N/2:1:N/2-1);
subplot(4,2,2);
plot(w,abs(fftshift(Y2)));
title('载波信号频谱');

%调制信号时域频域图
%y=(A0+0.5*x).*cos(2*pi*fc*n);%调制
%y=(0.5*x).*cos(2*pi*fc*n);
y=cos(2*pi*fc*n+y);
subplot(4,2,3);plot(n,x);
title('调制信号');
X=fft(x);Y=fft(y);%傅立叶变换
subplot(4,2,4);plot(w,abs(fftshift(X)));
title('调制信号频谱');

%已调信号时域频域图
subplot(4,2,5);plot(n,y)
title('已调信号');
subplot(4,2,6);plot(w,abs(fftshift(Y)));
title('已调信号频谱');

%解调信号时域频域图
y2=y.*Vm.*cos(2*pi*fc*n);%解调，频谱搬移
wp=40/N*pi;ws=60/N*pi;Rp=1;As=15;T=1;%巴特沃斯滤波器
OmegaP=wp/T;OmegaS=ws/T;
[cs,ds]=afd_butt(OmegaP,OmegaS,Rp,As);
[b,a]=imp_invr(cs,ds,T);
y3=filter(b,a,y2);
y=y3-A0;%减去直流分量后得解调后信号
subplot(4,2,7);plot(n,y)
title('解调信号');
Y=fft(y);
subplot(4,2,8);plot(w,abs(fftshift(Y)));
% axis([0,pi/4,0,1000]);
title('解调信号频谱');
