%DD=wavread('D:\Nishant\notes\MAJOR PROJECT\backup\Nishant\samples\sentence1\aditi1.wav');
%framesiz=544;overlap_amt=50;

function [reshapedmatrix]=overlap3(DD,framesiz,overlap_amt)
overlapby=framesiz-overlap_amt;
count=floor((length(DD)-framesiz)/overlapby);
Q=zeros(count+1,framesiz);
Q(1,1:framesiz)=DD(1:framesiz);

for i=1:count;
    for j=1:framesiz;
        Q(i+1,j)=DD(overlapby*i+j);
    end
end
N=framesiz;
w=ones(1,N);
%a=0.16;                         %w.r.t. Blackman window
%a0=(1-a)/2; a1=1/2; a2=a/2;     %w.r.t. Blackman window
%for n=1:N;
        %w(n)=0.54-0.46*cos(2*pi*n/(N-1));                      %HAMMING WINDOW
        %w(n)=a0-a1*cos(2*pi*n/(N-1))+a2*cos(4*pi*n/(N-1));     %BLACKMAN WINDOWS
        %w(n)=(2/(N-1))*(((N-1)/2)-abs(n-((N-1)/2)));           %Bartlett Window(Triangular)
        %w(n)=exp(-1/2*((n-(N-1)/2)/(0.3*(N-1)/2))^2);           %Gaussian Window 
%end
for a=1:count+1
    frame=Q(a,1:framesiz);
    
    frame=frame.*w;
    Q(a,1:framesiz)=frame;
    %Q(a,1:framesiz)=hamming_window1(Q(a,1:framesiz));
end

reshapedmatrix=Q';