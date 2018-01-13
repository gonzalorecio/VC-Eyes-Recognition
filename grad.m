I = ulls(:,:,145); %141 114
I = imadjust(I);
imshow(I); hold on
%I  = (I-min(I(:))) ./ (max(I(:)-min(I(:))));
imshow(I); hold on
grad = imgradient(I);
grad = (grad-min(grad(:))) ./ (max(grad(:)-min(grad(:))));
%imshow(grad);
grad(grad<max(max(grad))/5) = 0;
grad(grad>(4*max(max(grad)))/5) = 0;
grad(1:25,:) = 0;
grad(45:end,:) = 0;
grad(:,1:15) = 0;
grad(:,50:end) = 0;
%imshow(grad); hold on
corners = detectHarrisFeatures(I,'MinQuality', 0.055,'FilterSize',7);
[featuress, valid_corners] = extractFeatures(I, corners);
plot(valid_corners);
size(featuress)

feats = zeros([5 64]);
for i = 1:size(featuress.Features)
   feats(i,:) = featuress.Features(i,:) 
end


% points = detectSURFFeatures(I);
% [features, valid_points] = extractFeatures(I, points);
% plot(valid_points.selectStrongest(5),'showOrientation',false);
% 
 regions = detectMSERFeatures(I);
[features, valid_points] = extractFeatures(I,regions,'Upright',false);
 % bag = (features)
 
 region = detectKAZEFeatures(I);
 [features, valid_pointss] = extractFeatures(I,region,'Upright',false);
%  plot(valid_pointss(1:10))



%I = grad;

%bag = bagOfFeatures(imageDatastore(ulls(:,:,1:2400)));
%imshow(uint8(I))

%imshow(imgradient(grad),[])


