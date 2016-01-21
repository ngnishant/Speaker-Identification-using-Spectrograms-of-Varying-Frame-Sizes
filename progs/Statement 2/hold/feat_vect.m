function [mean,variance2,kurtos2,skew2]= feat_vect(hfile,framesize);

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
    maxC(a)=max(C(2:framesize,s));        %BE CAREFUL WHICH VALUES U CONSIDER !!!!
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
P2=zeros(1,col);
%for i=1:col;                              
 %   Ptime(i)=framesize*P_thresh(i)/Fs;
%e1nd


for i=1:col;
    P2(i)=P_thresh(i)*Fs/framesize;
end


%~~~~~~~~~~~MEAN~~~~~~~~~~~~~~~~~~
sum=0;

for q=1:col;
    sum=sum+P2(q);
end

mean=sum/col;
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


%~~~~~~~~~~VARIANCE~~~~~~~~~~~~~~~
for w=1:col;
    X(w)=P2(w)*P2(w);
end

sum_VAR=0;

for e=1:col;
    sum_VAR=sum_VAR+X(e);
end
mean2=sum_VAR/col;
variance=mean2-(mean*mean);
variance2=var(P2);
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

std_dev=sqrt(variance);

%~~~~~~~SKEWNESS~~~~~~~~~~~~~~~~~~~~
sum_skew=0;
for i=1:col;
    skew_t=(P2(i)-mean)^3;
    sum_skew=sum_skew+skew_t;
end
skew=sum_skew/((std_dev^3)*(col-1));
skew2=skewness(P2);
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

%~~~~~~~KURTOSIS~~~~~~~~~~~~~~~~~~~~
sum_kurtos=0;
for i=1:col;
    kurtos_t=(P2(i)-mean)^4;
    sum_kurtos=sum_kurtos+kurtos_t;
end
kurtos=sum_kurtos/((std_dev^4)*(col-1));
kurtos2=kurtosis(P2);
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~