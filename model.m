classdef model < handle
    %% This is the main function used to call all other functions as per requirement 

    %% We have defined a parent class named 'handle' and a child class named 'model', which inherits all the characteristics from the former...
     % The class definition consists of 2 attributes:
     % (i)_properties & (ii)_methods

     % 'properties' contains information about all the different layertypes
     % that will be used to proicess each image, It also holds the bias
     % values and the weight values for each filter.

     % 'methods' consists of all the function calls. First, it loads the
     % image files and then stores the information regarding layertypes,
     % filterbanks and bias values into its own object for convinience of
     % implementation.

    properties
        parameters_file = 'CNNparameters.mat'
        layertypes 
        filterbanks
        biasvectors
        layerresults
    end

    methods
        function obj = model()
        %MODEL Construct an instance of this class
        x = load(obj.parameters_file);  
        obj.layertypes = x.layertypes;
        obj.filterbanks = x.filterbanks;
        obj.biasvectors = x.biasvectors;
        % obj.layerresults = {}; % cell(1, length(x.layertypes));
        end

        function outputArg = forward(obj,x)
        % Here we check the layertype as mentioned in the CNNparameters.mat
        % file and compare it to all possible set of layers used in the
        % model, then call the corresponding function when a match is
        % found.
        for d = 1:length(obj.layertypes)
            %fprintf('layer %d is of type %s\n',d,obj.layertypes{d});
            if strcmp(obj.layertypes{d}, 'imnormalize')
                x = apply_imnormalize(x);
            elseif strcmp(obj.layertypes{d}, 'convolve')
                x = apply_convolve(x, obj.filterbanks{d}, obj.biasvectors{d});
            elseif strcmp(obj.layertypes{d}, 'relu')
                x = apply_relu(x);
            elseif strcmp(obj.layertypes{d}, 'softmax')
                x = apply_softmax(x);
            elseif strcmp(obj.layertypes{d}, 'maxpool')
                x = apply_maxpool(x);
            elseif strcmp(obj.layertypes{d}, 'fullconnect')
                x = apply_fullconnect(x, obj.filterbanks{d}, obj.biasvectors{d});
            end
            obj.layerresults{d} = x;
        end
        outputArg = x;
        end
    end
end