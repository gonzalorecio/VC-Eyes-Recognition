function [ features ] = feature_extraction_eyedetection( I )

%mitjana = sum(sum(I))/(64*64);
%sumacols = mean(I)- mitjana;
%sumafiles = mean(I,2)- mitjana;
%featuresSum = [sumacols sumafiles'];
features = extractHOGFeatures(I,'CellSize',[8,8],'NumBins',15);
%featuresLBP = extractLBPFeatures(I,'CellSize',[16,16]);
%features = [featuresLBP featuresHog];
end

