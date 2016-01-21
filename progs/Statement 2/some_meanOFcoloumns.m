function [rowmean]=some_meanOFcoloumns(A,frames_limit)

rowmean=zeros(1,frames_limit);
for i=1:frames_limit;
    rowmean(1,i)=mean(A(i,:));
end

end