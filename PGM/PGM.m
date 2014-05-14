function [t, F] = PGM(Num, len, mu, d, e, net, mc, pairs)
    
    L = 1;
    t = ones(size(net,1),1);
    [fun, grad] = stohdm(t, d, len, mu, net, mc, pairs);
    
    counter = 0;
    for k = 1:Num
        i = 0;
        k
        while true
            k
            M = (2^i) * L;
            t_new = Beta(t, grad, M);
            t_new = proj(net, t_new);
            [f_new, grad_new] = stohdm(t, d, len, mu, net, mc, pairs); 
            if f_new <= fun + ...
                    grad' * (t_new - t) + ...
                    (M / 2) * (t_new - t)' * (t_new - t) + ...
                    (1/2) * e
                break;
            end
           
%             counter = counter + 1;
%             if(counter == 10)
%                 break
%             end
            
            i = i + 1;
        end
        grad = grad_new;
        fun = f_new;
        t = t_new;
        L = (2^(i-1)) * L; 
        
    end
    
    F = fun;
end

