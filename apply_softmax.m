function outarray = apply_softmax(inarray)
%% Softmax is a type of normalizing function which is called to assign probability values for each image.
    % 'inarray' is 1x1xD and 'outarray' is 1x1xD
    % outarray has softmax function applied to it.
    alpha = max(inarray(:));
    denom = sum(exp(inarray - alpha), 3);
    denom = denom(:);
    outarray = exp(inarray - alpha) ./ denom;
end