match=0;
sizeq=size(q);
sizeq=sizeq(1);
for i=1:sizeq
    minimum=min(q(i,:));
    if (q(i,i)==minimum)||(q(i,i+42)==minimum)||(q(i,i+84)==minimum)||(q(i,i+126)==minimum)
        match=match+1;
    end
    if (q(i,i)~=minimum)&&(q(i,i+42)~=minimum)&&(q(i,i+84)~=minimum)&&(q(i,i+126)~=minimum)
        i 
    end
end
match
accuracy=(match*100)/42