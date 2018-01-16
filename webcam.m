DIR2 = '/home/gonzalo/Pictures/Webcam/';
imf2 = dir([DIR2 '*.jpg']);  % llista d'imatges amb extensio bmp
%coordf = dir([DIR '*.eye']);
n2 = uint8(length(imf2)); % nombre d'imatges en el directori
coords = [ 153 193 145 248;
           138 183 133 243;
           138 193 133 248;
           158 198 153 253;
           158 178 152 233;
           142 199 142 240;
           164 193 162 238;
           182 178 177 233;
           168 168 162 223;
           132 179 132 220;
           ];
obss = zeros(2*n2,size(feat,2));
expected = [0 1 0 0 1 1 0 0 1 1]';
expected2 = [0 0 1 1 0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1]';
ullscam = uint8(zeros([64,64,2*(n2)]));
j = 1;
for i = 1 : 10
     name2 = imf2(i).name;

       
     
     im2 = imread(strcat(DIR2, name2));
     s = size(im2);
     l = length(s);
     if l == 3 
         im2 = rgb2gray(im2);
     end
     Im = imresize(im2, [286 384]);
     imshow(Im)
     %Extracció de coordenades
     %[c1,c2,c3,c4] = textread(strcat(DIR, namec),'%s %s %s %s');
     lx = coords(i,2);
     ly = coords(i,1);
     rx = coords(i,4);
     ry = coords(i,3);
     
     leftE = [lx-32 ly-32 63 63];
     rightE = [rx-32 ry-32 63 63];
     Il = imcrop(Im,leftE);
     Ir = imcrop(Im,rightE);

     Ilr = imresize(Il, [64 64]);
     Irr = imresize(Ir, [64 64]);

     obss(j,:) = feature_extraction_lookingdetection(Ilr);
     obss(j+1,:) = feature_extraction_lookingdetection(Irr);
     ullscam(:,:,j) = Ilr;
     ullscam(:,:,j+1) = Irr;
     j = j+2;
end

% ullsuns = ones(2*(n-tSize),1);
% noullszeros = zeros(18*(n-tSize),1);
% c = [ullsuns ; noullszeros];
% o = [oUlls ; oNoUlls];
%predictor = TreeBagger(100,o,c);



%Aprenentatge
%c es correcte
%o cal obtenir-lo a partir de la feature extraction dels ulls i no ulls 
%predictor = TreeBagger(100,o,c);

%Test
%o cal obtenir-lo del 30% dels ulls que no hem passat (també podem passar
%nous no-ulls)
[C, scores] = predict(predictorLook,obss);
%predictor.ClassNames
scores

S = scores(:,1)-scores(:,2);
S(S<=0) = -1;
S(S>0) = 0;
S(S == -1) = 1;


kkk = (expected2 == S);
(sum(kkk)/size(kkk,1))*100
[sum((S == 0) .* (expected2 == 0)) sum((S == 0) .* (expected2 == 1)); sum((S == 1) .* (expected2 == 0)) sum((S == 1) .* (expected2 == 1))]

i = 1;
while i < 20
    max(S(i),S(i+1));
    i = i+2;
end

figure;
for k = 1:2*n2
    subplot(5,4,double(k));
    imshow(ullscam(:,:,k));
    if(scores(k,1)>scores(k,2))
        viscircles([32 32], 15,'Color','r');
    else
        viscircles([32 32], 15,'Color','g');
    end
end


% for k = 1:10
%     subplot(2,5,double(k));
%     name2 = imf2(uint8(k)).name;
%     im2 = imread(strcat(DIR2, name2)); 
%     s = size(im2);
%      l = length(s);
%      if l == 3 
%          im2 = rgb2gray(im2);
%      end
%      Im = imresize(im2, [286 384]);
%     imshow(Im);
% end


%numss = scores(:,1) <= scores (:,2);
%percentatge d'ulls encertats
%res = (sum(numss)/size(numss,1))*100
%[0 sum(numss == 0); 0 sum(numss==1)]