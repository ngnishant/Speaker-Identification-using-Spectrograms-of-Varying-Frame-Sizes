clear all
clc
framesize=1024;
filelist=ls('*.wav');
len_flist=length(filelist);
feature_s=zeros(len_flist,4);                         
test_feature=zeros(9,4);
euclidist=zeros(len_flist,1);
%sum=zeros(len_flist,1);
pseudo=zeros(9,36);
final=zeros(9,36);
featuretwo=zeros(36,4);

for i=1:len_flist;
    hfile=filelist(i,:);
    [ms vrnce krt skw]=feat_vect(hfile,framesize);
    feature_s(i,1)=ms;
    feature_s(i,2)=vrnce;
    feature_s(i,3)=krt;
    feature_s(i,4)=skw;
end


for i=1:len_flist;
    for j=1:4;
        if mod(i,5)==0
        test_feature(i/5,j)=feature_s(i,j);
        end
    end
end    

count=0;
for i=1:len_flist;
    if mod(i,5)==0
            count=count+1;
            continue
    else
        for j=1:4;
           featuretwo(i-count,j)=feature_s(i,j);
        end
    end
end
            
%euclidist=(test_feature-feature_s).^2;

%for i=1:len_flist;
%     for j=1:4;
%         sum(i)=sum(i)+euclidist(i,j);
%     end
%     sum(i)=sqrt(sum(i));
%end

for i=1:9
    for a=1:36
        for j=1:4
            pseudo(i,a)=pseudo(i,a)+((test_feature(i,j)-featuretwo(a,j)).^2);
        end
        final(i,a)=sqrt(pseudo(i,a));
    end
end
