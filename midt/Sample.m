function [s, flopcount] = Sample(n)
    s = 0;
    flopcount = 0;
    for k = 1:n
        for j = k:n
            s = s + k + 2*j + 12 - k * k;
            flopcount = flopcount + 6;
        end
    end
end
    
