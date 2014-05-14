% Describe: Bellman-Ford algorythm(bfa.mat). 
% Input: 
% p - fixed node
% t - time vector
% L - path length
% mu - parameter with unnknown meaning
% net - mass with fields: [origin, destination, time, flow]
% mc - correspondence matrix
% n - number of nodes
%Output:
%result - Function value

function [a, ah] = BFa(p, t, L, mu, net, mc)

    inf_const = 1000000000; %for imitate infinitely big quantity
  
    a = zeros(size(mc,1), L);
    ah = zeros(size(mc,1), L);

    a_prev = zeros(size(mc,1), 1);

%% Find neith arc to node p.
    for k = 1:size(mc,1)
        arc = find_arc_by_nodes(net, p, k);
        if  arc ~= -1
            a(k,1) = t(arc); 
            ah(k,1) = t(arc);
        end
       
        if  arc == -1               %if such arc doesn't exist make inf.
            a(k,1) = inf_const*max(t); 
            ah(k,1) = inf_const*max(t); 
        end
    end
    
  
    for l = 2:L
        a_prev = a(:,l-1);
        for k = 1 : size(mc,1)
            neigh_nodes = neigh_search(mc,k); % right place
            g = 0;
            for i = 1:length(neigh_nodes)                    
                arc = find_arc_by_nodes(net, neigh_nodes(i), k);
                g = g + exp(-(a_prev(neigh_nodes(i)) + t(arc)/mu));
            end
            a(k,l) =  -mu*log(g);
            ah(k,l) =  -mu*log(exp(-ah(k,l-1)/mu) + g);
        end       
    end
    
end
