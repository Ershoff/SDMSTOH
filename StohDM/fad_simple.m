            

            neigh_nodes = neigh_search(mc,k);
            m = length(neigh_nodes);
            alpha = zeros(m,1);
            a_mass = zeros(m,1);
            for i = 1:m
                alpha(i) = find_arc_by_nodes(net, neigh_nodes(i),k);
                a = a(neigh_nodes(i),l-1);
            end
            
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

            