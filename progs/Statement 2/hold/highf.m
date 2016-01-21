function [ P2 ] = highf(hfile,framesize,len,no_of_frames,overlap_amt);
[Y1 Fs] = wavread(hfile,len);

for i=1:(no_of_frames*framesize);
    B(i)=Y1(i);
end

%Z=reshape(B,framesize,no_of_frames);
Z=overlap2(B,framesize,overlap_amt);
dft_of_Z=fft(Z);
C=abs(dft_of_Z);                        %C stores abs val of dft of matrix
a=1;
for s=1:no_of_frames;                   %find maximum value in one column
    maxC(a)=max(C(2:framesize,s));
    a=a+1;
end
P=zeros(1,no_of_frames);
for s=1:no_of_frames;                   %get index of maximum value disregarding 1st value(dc value)        
    for t=2:(framesize/2);
        if maxC(s)==C(t,s);
            P(s)=t;
        end
    end
end


P2=zeros(1,length(P));
for i=1:length(P);
    P2(1,i)=P(i)*Fs/framesize;
end