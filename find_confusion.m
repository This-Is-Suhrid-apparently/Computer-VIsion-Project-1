function [confused, accuracy] = find_confusion(truelabels, predictedlabels)
%% This function is a part of post-processing and is used to calculate the accuracy of the created model by 
%% essentially finding the number of rightly and wrongly classifies images.
    confused = confusionchart(truelabels, predictedlabels, 'Title', 'CONFUSION MATRIX','ColumnSummary',...
        'column-normalized','RowSummary','row-normalized');

    tp = 0;
    for index  = 1:length(truelabels)
        if truelabels(index) == predictedlabels(index)
            tp = tp + 1;
        end
    end
    accuracy = tp/length(truelabels);
end