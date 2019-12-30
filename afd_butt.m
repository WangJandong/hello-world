% ע:  wp����Wp��Ϊͨ����ֹƵ��   ws(��Ws)Ϊ�����ֹƵ��   RpΪͨ��˥��  AsΪ���˥��
%butterworth��ͨ�˲���ԭ����ƺ���  Ҫ��Ws>Wp>0    As>Rp>0 
function [b,a]=afd_butt(Wp,Ws,Rp,As)
N=ceil((log10((10^(Rp/10)-1)/(10^(As/10)-1)))/(2*log10(Wp/Ws)));
    %�������Ϊ���˲�������      NΪ����
    %ceil �����������ȡ��
fprintf('\n  Butterworth Filter Order=%2.0f\n',N)
OmegaC=Wp/((10^(Rp/10)-1)^(1/(2*N)))        %���Ӧ��N��3db��ֹƵ��
[b,a]=u_buttap(N,OmegaC);
