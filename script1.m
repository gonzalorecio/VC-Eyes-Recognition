%APRENENTATGE%
% script per llegir les imatges d'un carpeta
imf = dir('I:\vc\Short Project\*.pgm'); % llista d'imatges amb extensio bmp
coordf = dir('I:\vc\Short Project\*.eye');
n = length(imf); % nombre d'imatges en el directori
%images = zeros([n,100,100]); % array n imatges de mida 100 x 100
%Treballem amb un 70% (aprox) dels ulls
j = 1;
k = 0;
sizeFeat = 2940;
oUlls = zeros([2*(n-521),sizeFeat]);
oNoUlls = zeros([18*(n-521),sizeFeat]);
for i = 1 : n-521
     name = imf(i). name;
     namec = coordf(i). name;
     im = imread(strcat('I:\vc\Short Project\', name));
     s = size(im);
     l = length(s);
     if l == 3 
         im = rgb2gray(im);
     end
     %Extracció de coordenades
     [c1,c2,c3,c4] = textread(strcat('I:\vc\Short Project\', namec),'%s %s %s %s');
     lx = str2double(cell2mat(c1(2)));
     ly = str2double(cell2mat(c2(2)));
     rx = str2double(cell2mat(c3(2)));
     ry = str2double(cell2mat(c4(2)));
     
     leftE = [lx-32 ly-32 63 63];
     rightE = [rx-32 ry-32 63 63];
     Il = imcrop(im,leftE);
     Ir = imcrop(im,rightE);

     %Ara toca generar les 18 imatges no-ull
     for index = 1 : 18
         correcte = 0;
        %Comprovem si les coordenades són bones
        while correcte == 0
            correcte = 1;
            coordfila = randi(286-64);
            coordcolumna = randi(384-64);
            %Comprovem que estigui lluny de l'ull dret
            if (coordfila > ry-64) && (coordfila < ry+64)
                if (coordcolumna > rx-64) && (coordcolumna < rx+64)
                    correcte = 0;
                end
            end
            %Comprovem que estigui lluny de l'ull esquerre
            if (coordfila > ly-64) && (coordfila < ly+64)
                if (coordcolumna > lx-64) && (coordcolumna < lx+64)
                    correcte = 0;
                end
            end
        end
        %Les coordenades són bones un cop aquí
        coordsret = [coordcolumna coordfila 63 63];
        InoUll = imcrop(im,coordsret);
        InoUllr = imresize(InoUll, [64 64]);
        oNoUlls(k+index,:) = feature_extraction_eyedetection(InoUllr);
     end 
     %
     Ilr = imresize(Il, [64 64]);
     Irr = imresize(Ir, [64 64]);

     oUlls(j,:) = feature_extraction_eyedetection(Ilr);
     oUlls(j+1,:) = feature_extraction_eyedetection(Irr);
     
     j = j+2;
     k = k+18;
end

ullsuns = ones(2*(n-521),1);
noullszeros = zeros(18*(n-521),1);
c = [ullsuns ; noullszeros];
o = [oUlls ; oNoUlls];
predictor = TreeBagger(100,o,c);


%TEST%
j = 1;
o2 = zeros([2*521,sizeFeat]);
for i = 1001 : n
     name = imf(i). name;
     namec = coordf(i). name;
     im = imread(strcat('I:\vc\Short Project\', name));
     s = size(im);
     l = length(s);
     if l == 3 
         im = rgb2gray(im);
     end
     [c1,c2,c3,c4] = textread(strcat('I:\vc\Short Project\', namec),'%s %s %s %s');
     lx = str2double(cell2mat(c1(2)));
     ly = str2double(cell2mat(c2(2)));
     rx = str2double(cell2mat(c3(2)));
     ry = str2double(cell2mat(c4(2)));
     
     leftE = [lx-32 ly-32 63 63];
     rightE = [rx-32 ry-32 63 63];
     Il = imcrop(im,leftE);
     Ir = imcrop(im,rightE);
     Ilr = imresize(Il, [64 64]);
     Irr = imresize(Ir, [64 64]);
     o2(j,:) = feature_extraction_eyedetection(Ilr);
     o2(j+1,:) = feature_extraction_eyedetection(Irr);
     j = j+2;
end

%Aprenentatge
%c es correcte
%o cal obtenir-lo a partir de la feature extraction dels ulls i no ulls 
%predictor = TreeBagger(100,o,c);

%Test
%o cal obtenir-lo del 30% dels ulls que no hem passat (també podem passar
%nous no-ulls)
[C, scores] = predict(predictor,o2);
predictor.ClassNames

n = scores(:,1) <= scores (:,2);
%percentatge d'ulls encertats
res = (sum(n)/1042)*100
