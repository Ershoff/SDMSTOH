function [coordinates] = make_coordinates(len, high)
    i = 1;
    j = 1;
    while(i<= high && j <=len)
            temp(i+j,:) = [i j];
            
            
    end
    coordinates = temp

end