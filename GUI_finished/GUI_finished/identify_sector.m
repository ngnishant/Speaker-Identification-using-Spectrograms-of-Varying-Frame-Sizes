framesize=704; sectorsize=2; overlap=0.50; threshold=37000;
no_of_sectors=framesize/sectorsize;

DS_path='D:\project\GUI_finished\GUI_finished\features\database_features\sector\';
TS_path='D:\project\GUI_finished\GUI_finished\features\test_feature\sector\';

DS=dir(strcat(DS_path,'*.jpg'));
TS=dir(strcat(TS_path,'*.jpg'));

number_of_TS=length(TS);
number_of_DS=length(DS);

min_distance_table=zeros(number_of_TS,number_of_DS);
distance_table=zeros(number_of_TS,number_of_DS);

original_index_table=zeros(number_of_TS,number_of_DS);

TS_featvec=zeros(no_of_sectors,number_of_TS);
DS_featvec=zeros(no_of_sectors,number_of_DS);

for i=1:number_of_TS;
    img=imread(strcat(TS_path,TS(i).name));
    [r c]=size(img);
    img=img.^2;
    space=1;
    k=1;
    flag=0;
    while(flag==0);
        img2=img(space:space+sectorsize-1,1:c);
        TS_featvec(k,i)=sum(sum(img2));
        k=k+1;
        space=space+sectorsize;
        if (space>r)
            flag=1;
        end
    end
end
for i=1:number_of_DS;
    img=imread(strcat(DS_path,DS(i).name));
    [r c]=size(img);
    img=img.^2;
    space=1;
    k=1;
    flag=0;
    while(flag==0);
        img2=img(space:space+sectorsize-1,1:c);
        DS_featvec(k,i)=sum(sum(img2));
        k=k+1;
        space=space+sectorsize;
        if (space>r)
            flag=1;
        end
    end
end

[testrow testcol]=size(TS_featvec);
[featrow featcol]=size(DS_featvec);

euclid=zeros(featcol,testcol);

for x=1:testcol
    for y=1:featcol
        euclid(y,x)=sqrt(sum((TS_featvec(:,x)-DS_featvec(:,y)).^2));
    end
end

[sorted_dist,orig_index]=sort(euclid,'ascend');

if (min(sorted_dist)<threshold)
    DS_index=orig_index(1);
    user_name=DS(DS_index).name(1:length(DS(DS_index).name)-4);
    count=0;
    for i=1:length(user_name)
        if user_name(i)~='1'
            count=count+1;
        end
    end
    identified_user_name=user_name(1:count);
    msgbox(strcat('Welcome ',' ',identified_user_name,' !!!'));
else
    errordlg('Unidentified Speaker');
end



