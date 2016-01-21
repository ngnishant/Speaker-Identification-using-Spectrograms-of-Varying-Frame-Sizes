%DD=wavread('D:\Nishant\notes\MAJOR PROJECT\backup\Nishant\samples\sentence1\aditi1.wav');
%framesiz=544;overlap_amt=50;

function [reshapedmatrix]=overlap3(DD,framesiz,overlap_amt))
overlapby=framesiz-overlap_amt;
count=floor((length(DD)-framesiz)/overlapby);
Q=zeros(count+1,framesiz);
Q(1,1:framesiz)=DD(1:framesiz);

for i=1:count;
    for j=1:framesiz;
        Q(i+1,j)=DD(overlapby*i+j);
    end
end
for a=1:count+1
    frame=Q(a,1:framesiz);
    N=length(frame);
    w=zeros(1,N);
    for n=1:N;
        w(n)=0.54-0.46*cos(2*pi*n/(N-1));
    end
    frame=abs(ifft(fft(frame).*fft(w)));
    %Q(a,1:framesiz)=hamming_window1(Q(a,1:framesiz));
end

reshapedmatrix=Q';

%function [windowed]=hamming_window1(frame)

%N=length(frame);
%w=zeros(1,N);
%for n=1:N;
%    w(n)=0.54-0.46*cos(2*pi*n/(N-1));
%end
%windowed=abs(ifft(fft(frame).*fft(w)));
%end