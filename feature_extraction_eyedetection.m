function [ features ] = feature_extraction_eyedetection( I )
I = imadjust(I);
I = medfilt2(I);
%mitjana = sum(sum(I))/(64*64);
%sumacols = mean(I)- mitjana;
%sumafiles = mean(I,2)- mitjana;
%featuresSum = [sumacols sumafiles'];
%I = (I-min(grad(:))) ./ (max(I(:)-min(I(:))))
mcols = mean(I);
mrows = mean(I,2);
featuresMean = [mcols mrows'];
featuresMean = (featuresMean-min(featuresMean(:))) ./ (max(featuresMean(:)-min(featuresMean(:))));

%featuresHog = extractHOGFeatures(I,'CellSize',[11,11],'NumBins',15);
featuresHog = extractHOGFeatures(I,'CellSize',[12 12],'NumBins',15,'BlockSize',[2 2], 'UseSignedOrientation',true);
%featuresLBP = extractLBPFeatures(I,'CellSize',[11,11]);
featuresLBP = extractLBPFeatures(I, 'NumNeighbors', 12,'Radius', 2,'Upright', false,'CellSize', [12 12]);

features = [featuresLBP featuresHog ];
end

