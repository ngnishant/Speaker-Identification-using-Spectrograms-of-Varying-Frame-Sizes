clear all
clc
a=1:45;
b=zeros(36,1);
n=1;
for k=1:45;
    if mod(k,5)==0
        k=k+1;
        if k>45
            break
        end        
        b(n)=a(k);    
    else
        b(n)=a(k);n=n+1;
    end
  
end
