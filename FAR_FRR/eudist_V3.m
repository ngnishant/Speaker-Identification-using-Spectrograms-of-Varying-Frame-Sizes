function [dist] = eudist_V3(TS,DS)

%disti=zeros(1,framesize);

    
disti =(TS-DS).^2;            

disti=sum(disti);	
dist=disti^0.5;