%% Description: Computing potential function for all net.
% Input:
% 1. net - information about network [node_o, node_d, time, flow]
% 2. mc - connectivity matrix
% 3. t - arc time vector
% 4. L - length of the max path
% 5. mu - constant of the model
% Output:
% 1. fun - value of the potential function
%% algo:
function [fun] = phi(t, d, L, mu, net, mc, pairs)
    value = 0; 
    for p = 1 : length(mc)

        [a, ah] = BFa(p, t, L, mu, net, mc);
        b = ah(:,L);
        for k = 1 : length(mc)
            if p ~= k
%                  p = p
%                  k = k
%                 corr = d(find_arc_by_nodes(pairs, p, k))
%                  a(k)
%% kostyl'
                if(b(k) ~= Inf)
                    d_comp = find_arc_by_nodes(pairs, p, k);
                    
                    %"If" for case when user input unappropriate "d" and
                    %"pairs"
                    if d_comp ~= -1
                        value = value + d(d_comp)*b(k);
                    end
                end
            end
        end
    end  
    fun =  - value;
end