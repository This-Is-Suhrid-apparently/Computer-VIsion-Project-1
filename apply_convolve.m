
function outarray = apply_convolve(inarray, filterbank, biasvals)
%% This function is called to convolve the given filter with the input array (2D convolution) and then add the already provided bias values
    % 'inarray' is NxMxD1, 'filterbank' is RxCxD1xD2,
    % 'biasvals' is a length D2 vector, and 'outarray' is NxMxD2
    [N, M, D1] = size(inarray);
    [~, ~, ~, D2] = size(filterbank);
    outarray = zeros(N, M, D2);
    for i = 1:D2
        for j = 1:D1
            outarray(:,:,i) = outarray(:,:,i) + imfilter(inarray(:, :, j), filterbank(:, :, j, i), 'same', 0, 'conv');
        end
        outarray(:,:,i) = outarray(:,:,i) + biasvals(i);
    end
end

