%Creating mass for enumerate all node pairs in graph.

function [P] = making_pairs_func(nodes_number)
    count = 0;
    mass = zeros(nodes_number,2);
    for i = 1:nodes_number
       for j = 1:nodes_number
           if (i ~= j)
                count = count + 1;
                mass(count,1) = i;
                mass(count,2) = j;
           end
       end
    end
P = mass(1:count,:);
end