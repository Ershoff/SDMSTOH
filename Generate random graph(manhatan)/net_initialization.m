%%
% Description:
% Input:
% 1. path - path to loading(load_flag == 1) or to saving(save_flag == 1)
% note: load_flag, save_flag can't be equales to 0 simultaneously.
% 2. len, high - size of graph.
% Output:
% 1. net_full_information - num_arc, origin, destination, flow, time

%%
function [net_full_information, MC] = net_initialization(path, len, high, load_flag, save_flag)
    
    if(load_flag == 1)
        vars = {'net_full_information', 'MC'};
        load(path, vars{:});
    else
        MC = graph_construct_func(len, high);
        net_full_information = net_data_input(MC); %1 - random generation of data
    end
    
    if(save_flag == 1)
        save(path, 'net_full_information', 'MC');
    end
    
end