


function [ index_match, min_val, indexof_min_val ] = try3_2_out_of_5(some_matrix)                       %some_matrix is matrix of distances. b is 2d matrix. parse through 
[r,c]=size(some_matrix);                                                              %col or row wise and find min top 5 values
nof=5;                                      %best 2 out of 5
b=zeros(r,c);
min_val=zeros(1,nof);
indexof_min_val=zeros(1,nof);
   
for k=1:c;
    
    b(1:r,k)=some_matrix(1:r,k);     
    a=1;                                                       

    for i=1:nof;
        sort_b_elem=sort(b(1:r,k));
        min_val(a,k)=sort_b_elem(1);
        for j=1:r;
            if min_val(a,k)==b(j,k);
                indexof_min_val(a,k)=j;
                b(j,k)=max(b(1:r,k))+1;
            end
        end
        a=a+1;
    end
end

index_match=zeros(1,c);
y=0;

for i=1:c;
    count=0;   
    y=y+4;
    
    for j=1:nof;  
        
        comparison_mat=(indexof_min_val(j,i)==[y-3:y,i]);
        for i1=1:length(comparison_mat);
        if comparison_mat(i1);
           count=count+1;
        end
        end
        
    end
    
    if count>=2
            index_match(i)=count;
    end
end


        

