function outarray = apply_relu(inarray)
%% The RELU function is a popular activation function which is employed to provide non-linearity to the neural network which further helps in classifying objects
    % 'inarray' is of size NxMxD
    % 'outarray' is of size NxMxD with Relu function applied
    outarray = max(0, inarray);
end