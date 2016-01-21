clear all
clc
A=1:16;
framesize=4;
n=length(A)/framesize;
for i=1:n*framesize
    if i<=framesize
        B(i)=A(i);
        continue
    end
    if (i>=framesize)
        B(i)=A(i-(framesize/4));
    end
end