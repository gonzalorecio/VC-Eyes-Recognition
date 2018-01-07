 [F, C] = size(Ik);
    nf = 0;
    i = 1;
    j = 1;
    while i < F-64
        while j < C-64
            coords = [j i 63 63];
            Ic = imcrop(Ik,coords);
            %imshow(Ic)
            o = feature_extraction_eyedetection(Ic);
            [c, scores] = predict(predictor,o);
            n = scores(:,1) <= scores (:,2);
            if (n == 1)
               i+32
               j+32
            end
            nf = nf+n;
            j = j +10;
        end
        j = 1;
        i = i+10;
    end
    nf