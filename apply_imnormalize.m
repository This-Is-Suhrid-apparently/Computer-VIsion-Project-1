function outarray = apply_imnormalize(inarray)
    %% This function is called to normalise all the values of the input array
    % 'inarray' is of size NxMx3 uint8 image
    % 'outarray' is of size NxMx3 which is normalized
    outarray = double(inarray) ./ 255.0 - 0.5; 
end
