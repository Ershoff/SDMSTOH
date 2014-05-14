%% Fast automatic differentiation

function [grad] = fad(p, a, ah, L, d, t, net, mc, pairs, mu)
% Initial setting
    n = size(a,1);
    dt = zeros(size(t,1),1);
    da = zeros(n,1);
    dah = zeros(n,1);
    
    p;
    for k = 1:n
        if k ~= p;
            k;
            dah(k) = d(find_arc_by_nodes(pairs, p, k));
        end
    end
    
    da_temp = da;
    dah_temp = dah;
% Iteration        
 
    for l = L:-1:2
        l;
        for k = 1:n
            k;
            tau = 1/(1 + exp((-a(k,l) + ah(k,l-1))./mu) );
            dah_temp(k) = dah(k) * tau;
            da_temp(k) = (1 - tau) * dah(k) + da(k);

%            if (p == 1 && k == 1)
%                 AH = ah;
%                 A = a;
%                 expo = exp((ah(k,l-1) - a(k,l))/mu)
%                 TAU = tau
%                 DA_TEMP = da_temp
%                 DAH_TEMP = dah_temp
%           end
        end
        da = da_temp;
        dah = dah_temp;
        for k = 1:n
            
%% Trick part.      
            neigh_nodes = neigh_search(mc,k);
            if size(neigh_nodes,2) == 1
                    alpha1 = find_arc_by_nodes(net, neigh_nodes(1),k);
                    psi = 1;
                    dt(alpha1) = dt(alpha1) + psi * da(k);
                    da_temp(neigh_nodes(1)) = da(k) * psi;
            end
            
            if size(neigh_nodes,2) == 2
                    alpha1 = find_arc_by_nodes(net, neigh_nodes(1),k);
                    alpha2 = find_arc_by_nodes(net, neigh_nodes(2),k);

                    a1 = a(neigh_nodes(1),l-1);
                    a2 = a(neigh_nodes(2),l-1);
                    
                    psi = 1/(1+exp( -(a2 + t(alpha2) ...
                                    - a1 - t(alpha1) )/mu));
                    
                    dt(alpha1) = dt(alpha1) + psi * da(k);
                    da_temp(neigh_nodes(1)) = da(k)*psi;
                    
                    psi = 1/(1+exp( -(a1 + t(alpha1) ...
                                    - a2 - t(alpha2) )/mu));
                                
                    dt(alpha2) = dt(alpha2) + psi * da(k);
                    da_temp(neigh_nodes(2)) = da(k)*psi;
%                     if (alpha1 == 2)
%                         show_alpha = alpha1
%                         DA = da(k)
%                         PSI = psi
%                     end
%                     if (alpha2 == 2)
%                         show_alpha = alpha2
%                         DA = da(k)
%                         PSI = psi
%                     end
            end
            
            if size(neigh_nodes,2) == 3
                    alpha1 = find_arc_by_nodes(net, neigh_nodes(1),k);
                    alpha2 = find_arc_by_nodes(net, neigh_nodes(2),k);
                    alpha3 = find_arc_by_nodes(net, neigh_nodes(3),k);
                    
                    a1 = a(neigh_nodes(1),l-1);
                    a2 = a(neigh_nodes(2),l-1);
                    a3 = a(neigh_nodes(3),l-1);
                    
                    psi = 1/(1+exp( -(a2 + t(alpha2) - ...
                                      a1 - t(alpha1) )/mu) + ...
                               exp( -(a3 + t(alpha3) - ...
                                      a1 - t(alpha1) )/mu));
                    dt(alpha1) = dt(alpha1) + psi * da(k);
                    da_temp(neigh_nodes(1)) = da(k) * psi;
                    
                    psi = 1/(1+exp( -(a1 + t(alpha1) - ...
                                      a2 - t(alpha2) )/mu) + ...
                               exp( -(a3 + t(alpha3) - ...
                                      a2 - t(alpha2) )/mu));
                    dt(alpha2) = dt(alpha2) + psi * da(k);
                    da_temp(neigh_nodes(2)) = da(k)*psi;
                    
                    psi = 1/(1+exp( -(a1 + t(alpha1) - ...
                                      a3 - t(alpha3) )/mu) + ...
                               exp( -(a2 + t(alpha2) - ...
                                      a3 - t(alpha3) )/mu));
                    dt(alpha3) = dt(alpha3) + psi * da(k);
                    da_temp(neigh_nodes(3)) = da(k)*psi;
                    
%                     if (alpha1 == 2)
%                         show_alpha = alpha1
%                         DA = da(k)
%                         PSI = psi
%                     end
%                     if (alpha2 == 2)
%                         show_alpha = alpha2
%                         DA = da(k)
%                         PSI = psi
%                     end
%                     if (alpha3 == 2)
%                         show_alpha = alpha2
%                         DA = da(k)
%                         PSI = psi
%                     end
%                     
                    
            end
            
            if size(neigh_nodes,2) == 4
                    alpha1 = find_arc_by_nodes(net, neigh_nodes(1),k);
                    alpha2 = find_arc_by_nodes(net, neigh_nodes(2),k);
                    alpha3 = find_arc_by_nodes(net, neigh_nodes(3),k);
                    alpha4 = find_arc_by_nodes(net, neigh_nodes(4),k);
                    a1 = a(neigh_nodes(1),l-1);
                    a2 = a(neigh_nodes(2),l-1);
                    a3 = a(neigh_nodes(3),l-1);
                    a4 = a(neigh_nodes(4),l-1);
                    
                    psi = 1/(1+exp( -(a2 + t(alpha2) - ...
                                      a1 - t(alpha1) )/mu) + ...
                               exp( -(a3 + t(alpha3) - ...
                                      a1 - t(alpha1) )/mu) + ...
                               exp( -(a4 + t(alpha4) - ...
                                      a1 - t(alpha1) )/mu));
                                  
                    dt(alpha1) = dt(alpha1) + psi * da(k);
                    da_temp(neigh_nodes(1)) = da(k)*psi;
                    
                    
                    psi = 1/(1+exp( -(a1 + t(alpha1) - ...
                                      a2 - t(alpha2) )/mu) + ...
                               exp( -(a3 + t(alpha3) - ...
                                      a2 - t(alpha2) )/mu) + ...
                               exp( -(a4 + t(alpha4) - ...
                                      a2 - t(alpha2) )/mu));
                                  
                    dt(alpha2) = dt(alpha2) + psi * da(k);
                    da_temp(neigh_nodes(2)) = da(k)*psi;
                    
                    
                    psi = 1/(1+exp( -(a1 + t(alpha1) - ...
                                      a3 - t(alpha3) )/mu) + ...
                               exp( -(a2 + t(alpha2) - ...
                                      a3 - t(alpha3) )/mu) + ...
                               exp( -(a4 + t(alpha4) - ...
                                      a3 - t(alpha3) )/mu));
                                  
                    dt(alpha3) = dt(alpha3) + psi * da(k);
                    da_temp(neigh_nodes(3)) = da(k)*psi;
                    
                    
                    psi = 1/(1+exp( -(a1 + t(alpha1) - ...
                                      a4 - t(alpha4) )/mu) + ...
                               exp( -(a2 + t(alpha2) - ...
                                      a4 - t(alpha4) )/mu) + ...
                               exp( -(a3 + t(alpha3) - ...
                                      a4 - t(alpha4) )/mu));
                                  
                    dt(alpha4) = dt(alpha4) + psi * da(k);
                    da_temp(neigh_nodes(4)) = da(k)*psi;                   
            end

        end
        da = da_temp;
    end

% Termination    
    for k = 1:n
        alpha = find_arc_by_nodes(net, p, k);
        if alpha ~= -1
            dt(alpha) = dt(alpha) + da(k); % tetta = 1 always in our graph.
        end 
    end
    
    grad = - dt;
end