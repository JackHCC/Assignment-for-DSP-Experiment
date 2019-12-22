%���������뺯��
function decodeKey= dtmfdetect( keyName,L,noise )
%���룺keyNameΪ��ֵ��L�˲�������ֵ��noiseΪ��������
%�����decodeKeyΪ������ļ�ֵ

%��ȡ�����ֵ�ĵĲ�������
xx=dtmfdial(keyName);

%�����������
Noise=sqrt(noise)*randn(1,length(xx));

%�����������ź�
xx_Noise=xx+Noise;

%�˲�������Ƶ������
fb=[697,770,852,941,1209,1336,1477];

%��ʼ����������Ҫ��ȡ���������������ֵ��������
emergy=0;
index=0;
index2=0;
max=0;
max2=0;

%��ȡ��һƵ���������ֵ
for i=1:4
    h=fir(fb(i),L);
    y=conv(xx_Noise,h);    %���
    energy=sum(y.*y);      %��������
    if(energy>=max)        %��ȡ���ֵ��������
        max=energy;
        index=i;
    end
end
%������ֵ��������
%max
%index

%��ȡ�ڶ�Ƶ���������ֵ
for i=5:7
    h=fir(fb(i),L);
    y=conv(xx_Noise,h);
    energy=sum(y.*y);
    if(energy>=max2)
        max2=energy;
        index2=i;
    end
end
%������ֵ��������
%max2
%index2

%ԭʼ���
dtmf.keys=['1','2','3';
    '4','5','6';
    '7','8','9';
    '*','0','#'];


%��Ӧ������ֵ
decodeKey=dtmf.keys(index,index2-4);%����ֵ
end

