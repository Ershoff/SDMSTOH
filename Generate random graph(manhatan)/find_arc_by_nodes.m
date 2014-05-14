% function which finding number of arc by number of OD nodes
%input: 
% 1. Net_data - information about time on each arc. (num_arc, origin, destination, time, flow)
% 2. node_o - number of origin node
% 3. node_d - number of destination node
% Output: number of arc, or -1 in case when there is no such arc

function [num_arc] = find_arc_by_nodes(Net_data, node_o, node_d)
%%
%constants
node_o_num = 1;
node_d_num = 2;
%%

i = 1;
stop_signal = 1;
while stop_signal
    if ((Net_data(i,node_o_num) == node_o) && (Net_data(i,node_d_num) == node_d))
        num_arc = i;
        break;
    end

    if(i == size((Net_data(:,1)),1))
        num_arc = -1;
        break
    end
    
    i = i + 1;
end
