%滤波器函数生成函数

function h= fir(fb ,L)
%输入：fb为滤波器中心频率，L为取样长度
%输出：h为输出的滤波器函数采样值

fs=8000;   %采样频率
n=0:L;      
h=cos(2*pi*fb*n/fs)/L;

%画出各个滤波器的图像
[a,b]=freqz(h);
plot(b,abs(a));
end

