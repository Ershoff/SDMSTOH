%Enumerating function
%Purpose: Function enumerate arcs in the net using connectivity matrix
%Input: G - connectivity matrix
%Output: mass(count, origin, destination)

function [result_net, last_num] = enumerating_function (G_matrix)
    nodes_number = length(G_matrix);
    count = 0;
    mass = zeros(nodes_number,2);
    for i = 1:nodes_number
       for j = 1:nodes_number
           if (G_matrix(i,j) == 1 && i ~= j)
                count = count + 1;
                mass(count,1) = i;
                mass(count,2) = j;
           end
       end
    end
result_net = mass;
last_num = count;
end