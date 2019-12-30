% 注:  wp（或Wp）为通带截止频率   ws(或Ws)为阻带截止频率   Rp为通带衰减  As为阻带衰减
%butterworth低通滤波器原型设计函数  要求Ws>Wp>0    As>Rp>0 
function [b,a]=afd_butt(Wp,Ws,Rp,As)
N=ceil((log10((10^(Rp/10)-1)/(10^(As/10)-1)))/(2*log10(Wp/Ws)));
    %上条语句为求滤波器阶数      N为整数
    %ceil 朝正无穷大方向取整
fprintf('\n  Butterworth Filter Order=%2.0f\n',N)
OmegaC=Wp/((10^(Rp/10)-1)^(1/(2*N)))        %求对应于N的3db截止频率
[b,a]=u_buttap(N,OmegaC);
