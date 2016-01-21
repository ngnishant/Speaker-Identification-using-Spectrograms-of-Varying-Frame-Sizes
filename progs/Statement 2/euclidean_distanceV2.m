function [euclid_distance]=euclidean_distanceV2(feature,test)

[rtst ctst]=size(test);
[rfet cfet]=size(feature);

eu_square=zeros(rfet,rtst);

for j=1:rtst;
    for i=1:rfet
        temp=(test(j,:)-feature(i,:)).^2;
        eu_square(i,j)=sum(temp);
    end
end

euclid_distance=sqrt(eu_square);