function [ features ] = feature_extraction_lookingdetection( I )

%      [centers,radii] = imfindcircles(I,[5 7], 'ObjectPolarity', 'dark', 'Sensitivity',0.90 );
%      for i = 1 : size(centers)
%         viscircles(centers(i,:), radii(i),'Color','b');
%      end
%     mira = 0;
%      for i = 1:size(centers,1)
%          if(centers(i,1) < 36.0 && centers(i,1)>31.0 && centers(i,2) < 36.0 && centers(i,2) > 31.0)
%              mira = 1;
%              break
%          end
%      end
    
    I = imadjust(I);
    mcols = mean(I);
    mrows = mean(I,2);
    featuresMean = [mcols mrows'];
    featuresMeanNorm = (featuresMean-min(featuresMean(:))) ./ (max(featuresMean(:)-min(featuresMean(:))));
    featuresHog = extractHOGFeatures(I,'CellSize',[9,9],'NumBins',15);
    featuresLBP = extractLBPFeatures(I,'CellSize',[9,9]);
    
    
%     mitjana = sum(sum(I))/(64*64);
%     sumacols = mean(I)- mitjana;
%     sumafiles = mean(I,2)- mitjana;
%     featuresSum = [sumacols sumafiles'];
%     
%     grad = imgradient(I);
%     grad = (grad-min(grad(:))) ./ (max(grad(:)-min(grad(:))));
%     imshow(grad);
%     grad(grad<max(max(grad))/5) = 0;
%     grad(grad>(4*max(max(grad)))/5) = 0;
%     grad(1:20,:) = 0;
%     grad(45:end,:) = 0;
%     grad(:,1:15) = 0;
%     grad(:,50:end) = 0;
%     
%     mitjana = sum(sum(grad))/(64*64);
%     sumacols = mean(grad)- mitjana;
%     sumafiles = mean(grad,2)- mitjana;
%     featuresSum = [sumacols sumafiles'];
%     %featuresHog = extractHOGFeatures(grad,'CellSize',[7,7],'NumBins',15);
%     %featuresLBP = extractLBPFeatures(grad,'CellSize',[7,7]);
%     
% %     corners = detectHarrisFeatures(I);
% %     [featuresHarris, valid_corners] = extractFeatures(I, corners);
%     
%     corners = detectHarrisFeatures(I,'MinQuality', 0.055,'FilterSize',7);
%     [features, valid_corners] = extractFeatures(I, corners);
%     %plot(valid_corners(1:5));
%     size(features);
% 
%     feats = zeros([5 64]);
%     for i = 1:min(size(features.Features), 5)
%        feats(i,:) = features.Features(i,:);
%     end
%     f = feats(:)';
%     f = (f-min(f(:))) ./ (max(f(:)-min(f(:))));
%     f(isnan(f))=0;
    
    features = [featuresHog featuresLBP ];
    
end

