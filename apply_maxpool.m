function outarray = apply_maxpool(inarray)
%% This function essentially down-samples the input array by taking the value with the highest magnitude within a sub-matrix of the original matrix
    % inarray is 2Nx2MxD and outarray is size NxMxD
    [N, M, D] = size(inarray);
    N = N/2;
    M = M/2;
    outarray = -1*Inf(N, M, D);
    for chan = 1:D
        for i=1:2
            for j=1:2
                outarray(:, :,chan) = max(outarray(:, :,chan), inarray(i:2:end, j:2:end, chan));
            end
        end
    end

end