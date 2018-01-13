function [ features ] = feature_extraction_eyedetection( I )
I = imadjust(I);
%mitjana = sum(sum(I))/(64*64);
%sumacols = mean(I)- mitjana;
%sumafiles = mean(I,2)- mitjana;
%featuresSum = [sumacols sumafiles'];
%I = (I-min(grad(:))) ./ (max(I(:)-min(I(:))))
mcols = mean(I);
mrows = mean(I,2);
featuresMean = [mcols mrows'];
featuresMean = (featuresMean-min(featuresMean(:))) ./ (max(featuresMean(:)-min(featuresMean(:))));

featuresHog = extractHOGFeatures(I,'CellSize',[11,11],'NumBins',15);
featuresLBP = extractLBPFeatures(I,'CellSize',[11,11]);
features = [featuresLBP featuresHog featuresMean];
end

