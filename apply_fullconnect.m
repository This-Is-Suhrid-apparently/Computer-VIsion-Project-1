
function outarray = apply_fullconnect(inarray, filterbank, biasvals)
%% This function is called to vectorise all the values of the matrix and then obtain final scalar values for each image
    % inarray is NxMxD1, filterbank is NxMxD1xD2, 
    % biasvals is a length D2 vector, and outarray is 1x1xD2
    [~, ~, ~, D2] = size(filterbank);
    outarray = zeros(1, 1, D2);
    for i = 1:D2
        outarray(:,:,i) = sum(inarray .* filterbank(:, :, :, i), 'all') +  biasvals(i);
    end
end