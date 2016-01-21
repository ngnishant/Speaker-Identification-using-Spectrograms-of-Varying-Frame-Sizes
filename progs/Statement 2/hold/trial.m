clear all
clc
hfile='ankitd11.wav';
framesize=1024;
[Y1, Fs, nbits] = wavread(hfile);

len_Y1=length(Y1);
col=floor(len_Y1/framesize);

for i=1:(col*framesize);
    B(i)=Y1(i);
end

Z=reshape(B,framesize,col);
dft_of_Z=fft(Z);
%dct_of_Z=dct(Z);
C=abs(dft_of_Z);                          %C stores abs val of dft of matrix
P=zeros(1,col);
a=1;
for s=1:col;
    maxC(a)=max(C(:,s));
    a=a+1;
end

for s=1:col;
    for t=2:(framesize/2);
        if maxC(s)==C(t,s);
            P(s)=t;
        end
    end
end

thresh_val=max(P)/10;
n=1;
for i=1:length(P);
    if P(i)<=thresh_val
        continue;
    else
        P_thresh(n)=P(i);
        n=n+1;
    end
end

col=length(P_thresh);
P2=zeros(1,col);

for i=1:col;
    P2(i)=P_thresh(i)*Fs/framesize;
end


