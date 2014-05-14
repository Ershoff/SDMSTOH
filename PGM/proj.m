% Argument projection

function [t_proj] = proj(net, t)

    t_proj = t;
    
    for i = 1:size(t,1)
        if t(i) < net(i,3)
            t_proj(i) = net(i,3);
        end
    end
end