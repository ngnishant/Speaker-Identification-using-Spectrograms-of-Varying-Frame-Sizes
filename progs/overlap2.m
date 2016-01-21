function [reshapedmatrix]=overlap2(DD,framesiz,overlap_amt)

%overlap_amt=4;
%framesize=8;
%B=1:64;
%t=1;
%i=1:

overlapby=framesiz-overlap_amt;
count=floor((length(DD)-framesiz)/overlapby);
Q=zeros(count+1,framesiz);
Q(1,1:framesiz)=hamming_window(DD(1:framesiz));

for i=1:count;
    for j=1:framesiz;
        Q(i+1,j)=DD(overlapby*i+j);
    end
end
for a=2:count+1
    Q(a,1:framesiz)=hamming_window(Q(a,1:framesiz));
end

reshapedmatrix=Q';