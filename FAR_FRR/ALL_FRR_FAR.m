clear all
clc

curr_dir=pwd;
framesize=32*(5:25);
threshold_range=1:10:130;        %put this range in the m files also!!
FRR_TOTAL=zeros(length(threshold_range),3*length(framesize));
FAR_TOTAL=zeros(length(threshold_range),3*length(framesize));
t=1;

for frame_index=1:length(framesize)
    
    
    tic
    copy_to=strcat(curr_dir,'\',num2str(framesize(frame_index)),'\');
    copyfile('meanOFcoloumns.m',copy_to);
    copyfile('eudist_V3.m',copy_to);
    copyfile('FAR_FRR_EER_part1.m',copy_to);
    copyfile('bfore_FRR.m',copy_to);
    copyfile('FAR_FRR_EER_part2.m',copy_to);
    copyfile('after_FRR_b4_FAR.m',copy_to);
    copyfile('FAR_FRR_EER_part3.m',copy_to);
    
    save('ALL_FRR_FAR_workspace_1');
    cd(copy_to);
    FAR_FRR_EER_part1
    for i=1:100000
        for j=1:3900
        end
    end
    bfore_FRR
    for i=1:100000
        for j=1:3900
        end
    end
    FAR_FRR_EER_part2
    cd ..
    load('ALL_FRR_FAR_workspace_1');
    FRR_TOTAL(:,t:t+2)=FRR_all3';
    save('ALL_FRR_FAR_workspace_2');
    cd(copy_to);
    after_FRR_b4_FAR
    for i=1:100000
        for j=1:3900
        end
    end
    FAR_FRR_EER_part3
    for i=1:100000
        for j=1:3900
        end
    end
    cd ..
    load('ALL_FRR_FAR_workspace_2');
    FAR_TOTAL(:,t:t+2)=FAR_all3';
    cd(curr_dir);
    t=t+3;
    toc
end

