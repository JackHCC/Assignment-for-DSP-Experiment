%���ź���
function xx = dtmfdial( keyName )
%���룺��ֵ
%��� DTMF������κ�������ֵ

%DTMF��ֵ��
dtmf.keys=['1','2','3';
    '4','5','6';
    '7','8','9';
    '*','0','#'];

%��ֵ��ӦƵ�����
ff_cols=[1209,1336,1477];
ff_rows=[697;770;852;941];
dtmf.colTones=ones(4,1)*ff_cols;
dtmf.rowTones=ff_rows*ones(1,4);

%����Ƶ�ʺ�����
fs=8000;
Ts=1/fs;

%�жϼ�ֵ��Ƶ�ʲ���ֵ��f1��f2
[ii,jj]=find(keyName==dtmf.keys);
f1=ff_cols(jj);
f2=ff_rows(ii);

%���ɳ���0.2����������β����
t=[0:Ts:0.2];
xx=cos(2*pi*f1*t)+cos(2*pi*f2*t);
soundsc(xx,fs);

end

