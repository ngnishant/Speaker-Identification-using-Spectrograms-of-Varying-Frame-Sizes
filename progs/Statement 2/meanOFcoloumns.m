function [rowmean]=meanOFcoloumns(A,framesize)

rowmean=zeros(1,framesize);
for i=1:framesize
    rowmean(1,i)=mean(A(i,:));
end

end