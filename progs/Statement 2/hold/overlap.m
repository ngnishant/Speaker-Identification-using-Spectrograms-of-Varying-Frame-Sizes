%function [reshapedmatrix]=overlap(mat_to_b_chnged,framesize,overlap_amt);
clear all
clc
overlap_amt=2;
framesize=8;
B=1:64;
t=1;
i=1;

loop_till=(overlap_amt*length(B))+(((-1)^(overlap_amt-1))*framesize);
while i<loop_till;
    if i==1;      
        for s=1:framesize;
            Q(s,t)=B(i); 
            i=i+1;
        end
        t=t+1;
        continue;

    else
        for s=1:framesize;
            Q(s,t)=B(i-overlap_amt*(t-1));
            i=i+1;
        end
        t=t+1;
    end   
end

reshapedmatrix=Q;

