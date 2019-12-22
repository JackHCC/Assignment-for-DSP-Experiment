%加噪声解码函数
function decodeKey= dtmfdetect( keyName,L,noise )
%输入：keyName为键值，L滤波器采样值，noise为噪声方差
%输出：decodeKey为译码出的键值

%获取输入键值的的采样函数
xx=dtmfdial(keyName);

%生成随机噪声
Noise=sqrt(noise)*randn(1,length(xx));

%叠加噪声的信号
xx_Noise=xx+Noise;

%滤波器中心频率数组
fb=[697,770,852,941,1209,1336,1477];

%初始化能量和需要获取的能量的两个最大值及其索引
emergy=0;
index=0;
index2=0;
max=0;
max2=0;

%获取第一频率最大能量值
for i=1:4
    h=fir(fb(i),L);
    y=conv(xx_Noise,h);    %卷积
    energy=sum(y.*y);      %计算能量
    if(energy>=max)        %获取最大值及其索引
        max=energy;
        index=i;
    end
end
%输出最大值及其索引
%max
%index

%获取第二频率最大能量值
for i=5:7
    h=fir(fb(i),L);
    y=conv(xx_Noise,h);
    energy=sum(y.*y);
    if(energy>=max2)
        max2=energy;
        index2=i;
    end
end
%输出最大值及其索引
%max2
%index2

%原始码表
dtmf.keys=['1','2','3';
    '4','5','6';
    '7','8','9';
    '*','0','#'];


%对应的译码值
decodeKey=dtmf.keys(index,index2-4);%解码值
end

