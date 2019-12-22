%载入音频
load message.dat

%定义变量
syms alph deta ...

%定义采样频率
Ts=1/22000;
fs=1/Ts;
%播放干扰音频
soundsc(message,fs);
%画频率响应图
[freq_response,freq_index]=freqz(message,1,5000,fs);
plot(freq_index,abs(freq_response));

m=max(abs(freq_response));   
N=length(message);

w=800*pi;

%正弦噪声
k=1:N;
noise=alph*cos(w*k*Ts)+deta*sin(w*k*Ts);

%最小二乘法去除噪声，求解变量
distance=(message'-noise).^2;
y=sum(distance.*distance);
[alph,deta]=solve([diff(y,alph)==0],[diff(y,deta)==0],[alph],[deta]);

%小数化
vpa(alph)
vpa(deta)
