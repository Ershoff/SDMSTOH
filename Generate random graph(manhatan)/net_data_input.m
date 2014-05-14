% Purpose of this function is to organaze data about net. 
% Main assumption - there is only one arc between any two nodes.
% Input: 
% G_matrix: matrix of connectivity
% Output: number of each arc in the shortest path in right order, time sum

function [net_full_information] = net_data_input(G_matrix)

   [mass_information, arc_number_all] = enumerating_function(G_matrix);

   arcs_time = rand(arc_number_all, 1);
   arcs_flow = rand(arc_number_all, 1);

   net_full_information = horzcat(mass_information, arcs_time,arcs_flow);

end


