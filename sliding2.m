i = 1520;
ii = 10;
name = imf(i).name;

namec = coordf(i). name;
Im = imread(strcat(DIR, name));
DIR2 = '/home/gonzalo/Pictures/Webcam/';
imf2 = dir([DIR2 '*.jpg']);
name = imf2(ii).name;
Im = imread(strcat(DIR2, name));
Im = rgb2gray(Im);
Im = imresize(Im, [286 384]);

imshow(Im);

[F, C] = size(Im);
    nf = 0;
    i = 100;
    j = 1;
    while i < F-64
        while j < C-64
            coords = [j i 63 63];
            Ic = imcrop(Im,coords);
            %imshow(Ic)
            o = feature_extraction_eyedetection(Ic);
            [c, scores] = predict(predictor,o);
            n = scores(:,1) <= scores (:,2);
            if (n == 1)
               center = [j+32 i+32];
               viscircles(center, 10,'Color','r');
               i+32
               j+32
            end
            nf = nf+n;
            j = j +5;
        end
        j = 1;
        i = i+5;
    end