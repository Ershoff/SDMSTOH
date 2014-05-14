%This part is about graph constructing

%Input:
%length - count of horisontal nodes
%high - count of vertical nodes
%save_flag - to save random generated flag
%load_flag - to load graph from somewhere. 
%path_to_file - physical path to the place where file is placed.
%Output
%net_data_all - view of one row: 
%[origin node, destination node, arc flow, arc time]
%MC - matrix connectivity


function [net_data_all, MC] = generate_manhatan(len, high, save_flag, load_flag, path_to_file)

%constructing random manhattan matrix connectivity (MC)

[net_data_all, MC] = net_initialization(path_to_file, len, high, load_flag, save_flag);


%%
% todo:
% 1. Method of visualization.
% 2. Method saving in file. - done
% 3. Struct all module. - done
% 4. Randomize graph.
% 5. Check for connectivity.
% 6. Way to redact information in the table;
% 7. Matrix connectivity is not show when to nodes are aonnexted by two
% arcs!! That's fail! - solved, but not nessesary to fix.


end

%%
%%Made by Ershoff, 2013