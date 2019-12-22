%������Ƶ
load message.dat

%�������
syms alph deta ...

%�������Ƶ��
Ts=1/22000;
fs=1/Ts;
%���Ÿ�����Ƶ
soundsc(message,fs);
%��Ƶ����Ӧͼ
[freq_response,freq_index]=freqz(message,1,5000,fs);
plot(freq_index,abs(freq_response));

m=max(abs(freq_response));   
N=length(message);

w=800*pi;

%��������
k=1:N;
noise=alph*cos(w*k*Ts)+deta*sin(w*k*Ts);

%��С���˷�ȥ��������������
distance=(message'-noise).^2;
y=sum(distance.*distance);
[alph,deta]=solve([diff(y,alph)==0],[diff(y,deta)==0],[alph],[deta]);

%С����
vpa(alph)
vpa(deta)
