filelist=ls('*.wav');
len_flist=length(filelist);
count=0;
for i=1:5:len_flist;
    
    speakerid=filelist(i,1:4);
    if (filelist(i,1)==speakerid(1) &&  filelist(i,2)==speakerid(2) && filelist(i,3)==speakerid(3) && filelist(i,4)==speakerid(4));
        disp('OK');count=count+1;
    else
        disp('problem at ', i);
    end
    
end

if count==(len_flist/5);
    disp('ALL OK');
end
