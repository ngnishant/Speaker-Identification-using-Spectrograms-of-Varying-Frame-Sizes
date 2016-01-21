tic
clear all
clc

B = [1 2 3 0 0 0 0.001 0 0 0  3 4 0 0 5 6 0 0 0 0 0.0025 0 7  0 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 9 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0  ];
B_orig=B;
nof_consec_zeros=5;
noise_threshold=0.01;



for i=1:length(B);
    if abs(B(i)) < noise_threshold;
        B(i)=0;
    end
end
t=1;
count_zeros=0;
for i=1:length(B);    
    length(B)
    if B(i)==0
        count_zeros=count_zeros+1;
    end
    
    if B(i)~=0
        count_zeros=0;
    end
    
    
    if count_zeros==nof_consec_zeros;      
        %consec_zeros_end_at(t+1)=i;
        ind=[i-nof_consec_zeros+1:i];
        B(ind)=[];
        count_zeros=0;
    end
end



toc



        
        

    
