load message.dat
syms alph deta ...

Ts=1/22000;
fs=1/Ts;
soundsc(message,fs);

figure(1)
plot(message),axis([1,2,-200,200])

[freq_response,freq_index]=freqz(message,1,5000,fs);
figure(2)
plot(freq_index,abs(freq_response));

m=max(abs(freq_response));


    
N=length(message)

w=800*pi;

k=1:N;
noise=alph*cos(w*k*Ts)+deta*sin(w*k*Ts);
distance=(message'-noise).^2;
y=sum(distance.*distance);
vpa(y,4)
y1=diff(y,alph);
y2=diff(y,deta);

[alph,deta]=dsolve([Dy/Dalph==0],[Dy/Ddeta==0],[alph],[deta]);
vpa(alph)
vpa(deta)