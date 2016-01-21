function [mean_blocks]=groupedmeanOFcoloumns(A,framesize,blocks)
%blocks=3;

ele_after_blocks=(framesize-1-mod((framesize-1),blocks))/blocks;
mean_blocks=zeros(1,ele_after_blocks+1);
rowmean=zeros(1,framesize);
for i=1:framesize
    rowmean(1,i)=mean(A(i,:));
end

mean_blocks(1,1)=rowmean(1,1);
a=0;
for i=2:blocks:framesize-1-mod((framesize-1),blocks);
    a=a+1;
    mean_blocks(1,a+1)=mean(rowmean(i:i+blocks-1));
end

