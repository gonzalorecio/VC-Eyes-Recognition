I = ulls(:,:,281); %141

imshow(uint8(I))

grad = imgradient(I);
grad(grad<max(max(grad))/5) = 0;
grad(grad>(4*max(max(grad)))/5) = 0;
imshow(uint8(grad))

I = grad;
imshow(uint8(I))

[centers,radii] = imfindcircles(I,[5 7], 'ObjectPolarity', 'bright', 'Sensitivity',0.98 )
%imshow(Ilr)
for i = 1 : size(centers)
    viscircles(centers(i,:), radii(i),'Color','b');
end



I = ulls(:,:,482); %141 291  %691
%1291 1691 21
%891 ulls tancats

%problems: 106, 

imshow(uint8(I))

grad = imgradient(I);
grad(grad<max(max(grad))/5) = 0;
grad(grad>(4*max(max(grad)))/5) = 0;
imshow(uint8(grad))

%I = grad;
imshow(uint8(I))

[centers,radii] = imfindcircles(I,[5 7], 'ObjectPolarity', 'dark', 'Sensitivity',0.90 )
%imshow(Ilr)
for i = 1 : size(centers)
    viscircles(centers(i,:), radii(i),'Color','b');
end

mira = false;
for i = 1:size(centers,1)
    if(centers(i,1) < 35.0 && centers(i,1)>31.0 && centers(i,2) < 35.0 && centers(i,2) > 31.0)
        mira = true;
        break
    end
end

mira


J = uint8(imgradient(I));
%J(J<max(max(J))/5) = 0;
%J(J>(4*max(max(J)))/5) = 0;
imshow((I))
I = imadjust(I)
I = medfilt2(I)
%I = (I-min(I(:))) ./ (max(I(:)-min(I(:))));
[centers,radii] = imfindcircles(I,[5 7], 'ObjectPolarity', 'dark', 'Sensitivity',0.975 )
%imshow(Ilr)
for i = 1 : size(centers)
    viscircles(centers(i,:), radii(i),'Color','b');
end

mira = false;
for i = 1:size(centers,1)
    if(centers(i,1) < 35.5 && centers(i,1)>31.0 && centers(i,2) < 35.5 && centers(i,2) > 31.0)
        mira = true;
        break
    end
end
%imshow(I)

mira
