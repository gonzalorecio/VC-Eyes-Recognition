csv = xlsread('Miram.xlsx');
observations = csv(:,5);
%tSize = 521;

%Creem un vector de uns i zeros per cada ull (el que ve donat es per cada foto)
observtrans = observations';
obscomb = [observtrans; observtrans];
obscomb=obscomb(:);
c = obscomb(1:2*(n-tSize));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
testu = zeros(64,64);
feat = feature_extraction_lookingdetection(testu);
%%%%%%%
sizeFeat = size(feat,2);
oUllsLook = zeros([2*(n-tSize),sizeFeat]);
%obs1 = zeros([]);
for i = 1 : size(ulls,3)%2*(n-tSize)%2400
    I = ulls(:,:,i);
    %obs1(i)
    oUllsLook(i,:) = feature_extraction_lookingdetection(I);
end

predictorLook = TreeBagger(200,oUllsLook,obsMiraTrain);%c);

oUllsLook2 = zeros([2*tSize,sizeFeat]);
for j = 1 : size(ullstest,3)%tSize*2
    In = ullstest(:,:,j);
    oUllsLook2(j,:) = feature_extraction_lookingdetection(In);
end

[C, scores] = predict(predictorLook,oUllsLook2);
%predictorLook.ClassNames

S = scores(:,1)-scores(:,2);
S(S<=0) = -1;
S(S>0) = 0;
S(S == -1) = 1;

% ccc = obscomb(2*(n-tSize)+1:end);
% kkk = (ccc == S);
% (sum(kkk)/size(kkk,1))*100

kkk = (obsMiraTest == S);
(sum(kkk)/size(kkk,1))*100
[sum((S == 0) .* (obsMiraTest == 0)) sum((S == 0) .* (obsMiraTest == 1)); sum((S == 1) .* (obsMiraTest == 0)) sum((S == 1) .* (obsMiraTest == 1))]
