%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                      %
%      Returns absolute of fft of each coloumn of A                    %
%                                                                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ normalised ]=coloumnfft(A)

[row col]=size(A);
transformed=zeros(row,col);

for i=1:col;
    transformed(:,i)=fft(A(:,i));
end

transformed=abs(transformed);

 largest=max(max(transformed));

 normalised=uint8(255*(transformed./largest));


end
