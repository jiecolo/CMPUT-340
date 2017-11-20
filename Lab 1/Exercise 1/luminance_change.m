function J = luminance_change(I, option, value)
    if option == 'c'
        J = I * value;
    elseif option == 'b'
        J = I + value;
    end
end