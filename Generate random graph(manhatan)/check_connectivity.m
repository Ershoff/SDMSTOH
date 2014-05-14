%check for connectivity for directed graph
%13.10.2013 Ershov Egor (Ershoff)

%Description information about graph is in connectivity 
%matrix. Scale of the matrix is doesn't matter.

 function [bitwise_answer] = check_connectivity(G)
    
n = length(G);

I = zeros(1,n);
I(1) = 1;
count = 1;
while ( sum(I) < n && count < n )
    for i = 1 : n 
        if I(i) == 1 
            for j = 1:n 
                if G(i,j) == 1 
                    G(j,:) = G(j,:)+G(i,:); 
                    G(j,j) = 0; 
                    I(j) = 1;
                end
            end
        end
    end
    count
    count = count+1;
end

if sum(I)==n 
    bitwise_answer=1; 
else
    bitwise_answer=0; 
end
    