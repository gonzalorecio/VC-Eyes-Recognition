function [ features ] = feature_extraction_eyedetection( I )

%mitjana = sum(sum(I))/(64*64);
%sumacols = mean(I)- mitjana;
%sumafiles = mean(I,2)- mitjana;
%featuresSum = [sumacols sumafiles'];
featuresHog = extractHOGFeatures(I,'CellSize',[11,11],'NumBins',15);
featuresLBP = extractLBPFeatures(I,'CellSize',[11,11]);
features = [featuresLBP featuresHog];
end

