clear all
clc
b= [ 181 222 352 4 57 614 7 8 90 6 11 12 13 14 15 16 17 ];
a=1;
count=0;
nof=5;
for i=1:nof
    c=sort(b);
    c2(a)=c(1);
    for i=1:length(b);
        if c2(a)==b(i);
            c3(a)=i;
            b(i)=max(b)+1;
        end
    end
    a=a+1;
    count=1;
    if count==1
        if length(c2)==5
            break;
        end
    end
end