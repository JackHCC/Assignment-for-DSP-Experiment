%����������Ƶ
load message.dat
%message;
%soundsc(message',22000)

%����Ƶ��
Ts=1/22000;
fs=1/Ts;
w=800*pi;

%��õ�����ϵ��
alph= -68.631441115695561223018841498542;
deta=76.802381838364497370868236926918;

%ȥ����������Ƶ���
k=1:length(message);
s=message'-alph*cos(w*k*Ts)-deta*sin(w*k*Ts)
soundsc(s,fs)