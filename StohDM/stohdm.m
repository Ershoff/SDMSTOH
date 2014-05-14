%% Description: This function compute model values: phi and its gradient.
% Input:
% 1. net - information about network [node_o, node_d, time, flow]
% 2. mc - connectivity matrix
% 3. t - arc time vector
% 4. L - length of the max path
% 5. mu - constant of the model
% Output:
% 1. fun - value of the functional 
% 2. grad - gradient of the functional

function [fun, grad] = stohdm(t, d, L, mu, net, mc, pairs)
    scal = net(:,4)'*t;
    phi_show = mu*phi(t/mu, d, L, mu, net, mc, pairs);
    fun = net(:,4)'*t + mu*phi(t/mu, d, L, mu, net, mc, pairs); 
    grad = net(:,4) + phi_grad(t/mu, d, L, mu, net, mc, pairs);
end