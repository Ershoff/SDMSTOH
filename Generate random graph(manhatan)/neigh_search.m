%Finding neighborhoods which follows to given node
% Input:
% mc - conectivity matrix
% node - given node
% Output:
% neigh - node numbers

function [neigh_nodes] = neigh_search(mc,node)
    c1 = 0;
    neigh_nodes = zeros(0,1);
    for i = 1:size(mc,1)
        if((mc(i, node) == 1) && (node ~= i))
            c1 = c1 + 1;
            neigh_nodes(c1) = i;    %need to preallocate memmory, but don't know how, cause can't predict the size of vector
        end  
    end
   
end