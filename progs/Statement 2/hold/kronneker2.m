H2=[1,1;1,-1];
[m,n]=size(H2);
H2_n=reshape(H2,1,(m*n));
a=(m^2)*(n^2);
H4_n=zeros(1,a);
j=1;
for i=1:11
    if i==1 || i==3 || i==9 || i==11
        k=1;
        H4_n(i)=H2_n(k)*H2_n(j);
        H4_n(i+1)=H2_n(k)*H2_n(j+1);
        H4_n(i+4)=H2_n(k)*H2_n(j+2);
        H4_n(i+5)=H2_n(k)*H2_n(j+3);
        k=k+1;
    else
        continue
    end
end
%H4_n=(-1)*H4_n;
H4=reshape(H4_n,4,4);
