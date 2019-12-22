%拨号函数
function xx = dtmfdial( keyName )
%输入：键值
%输出 DTMF输出波形函数采样值

%DTMF键值表
dtmf.keys=['1','2','3';
    '4','5','6';
    '7','8','9';
    '*','0','#'];

%键值对应频率组成
ff_cols=[1209,1336,1477];
ff_rows=[697;770;852;941];
dtmf.colTones=ones(4,1)*ff_cols;
dtmf.rowTones=ff_rows*ones(1,4);

%采样频率和周期
fs=8000;
Ts=1/fs;

%判断键值的频率并赋值给f1和f2
[ii,jj]=find(keyName==dtmf.keys);
f1=ff_cols(jj);
f2=ff_rows(ii);

%生成持续0.2秒的声音波形并输出
t=[0:Ts:0.2];
xx=cos(2*pi*f1*t)+cos(2*pi*f2*t);
soundsc(xx,fs);

end

