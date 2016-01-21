function [mean,variance2,kurtos2,skew2]= feat_vect_inbuilt(hfile,framesize);

[Y1, Fs, nbits] = wavread(hfile);

len_Y1=length(Y1);
col_ch=floor(len_Y1/framesize);

for i=1:(col_ch*framesize);
    B(i)=Y1(i);
end

Z=reshape(B,framesize,col_ch);
dft_of_Z=fft(Z);
C=abs(dft_of_Z);                          %C stores abs val of dft of matrix
P=zeros(1,col_ch);
a=1;
for s=1:col_ch;                           %find maximum value in one column
    maxC(a)=max(C(:,s));
    a=a+1;
end

for s=1:col_ch;                           %get index of maximum value disregarding 1st value(dc value)        
    for t=2:(framesize/2);
        if maxC(s)==C(t,s);
            P(s)=t;
        end
    end
end

thresh_val=max(P)/10;                     % set threshold on min value(of index)
n=1;                                      % to be considered
for i=1:length(P);                        % if for one sample, min index is 2 and 
    if P(i)<=thresh_val                   % and max is 144. i want threshold at 1/10th
        continue;                         % of max value. then only index > 14.4
    else                                  % will be considered
        P_thresh(n)=P(i);
        n=n+1;
    end
end

col=length(P_thresh);
Ptime=zeros(1,col);
for i=1:col;                              
    Ptime(i)=P_thresh(i)/Fs;
end


for i=1:col;
    P2(i)=1/Ptime(i);
end


%~~~~~~~~~~~MEAN~~~~~~~~~~~~~~~~~~
sum=0;
for q=1:col;
    sum=sum+P2(q);
end
mean=sum/col;
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


%~~~~~~~~~~VARIANCE~~~~~~~~~~~~~~~
variance2=var(P2);
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

std_dev=sqrt(variance2);


%~~~~~~~SKEWNESS~~~~~~~~~~~~~~~~~~~~
skew2=skewness(P2);
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



%~~~~~~~KURTOSIS~~~~~~~~~~~~~~~~~~~~
kurtos2=kurtosis(P2);
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~