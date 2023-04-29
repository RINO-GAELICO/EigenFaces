
clear all
clc
close all
FAdir = dir('/Users/duccio/Documents/MATLAB/FaceRecognition_Data/FA');
imagesFiles = dir('/Users/duccio/Documents/MATLAB/FaceRecognition_Data/ALL');
[ALL, FA] = createALLandFA(imagesFiles,FAdir);

[Eigenfaces, meanImages] = CreateEigenFaces(ALL);

[B, DB_FA] = createBandDBFA(Eigenfaces,meanImages, FA);

FBdir = dir('/Users/duccio/Documents/MATLAB/FaceRecognition_Data/FB');

% there are 23 images in the FB folder
prompt = {'Enter test image name (a number between 1 to 23):'};

title = 'Input';
num_lines= 1;
def = {'1'};
numberImage  = inputdlg(prompt,title,num_lines,def);
n = str2num(char(numberImage));
n = n+3;

ImageTest = imread("../"+"FaceRecognition_Data"+'/'+"FB"+'/'+FBdir(n).name);
imgTestVector = reshape(ImageTest,32*32,1);
diff = double(imgTestVector)-meanImages;
TestProj = Eigenfaces'*diff;

dist = [];

for i=1:12
    singleImg = DB_FA(:,i);
    temp = ( norm( TestProj - singleImg ) )^2;
    dist = [dist temp];
end;
clear min clear index
[min, index] = min(dist);

[sortedValues, sortedIndices] = sort(dist);
topIndices = sortedIndices(1:5);
disp("THESE ARE THE TOP 5 INDICES:");
disp(topIndices);
output = strcat(int2str(index));

disp("THIS IS THE TOP MATCH: "+output) 
DIS = [];

count =0;

for i=1:length(topIndices)
        DIS = [DIS,("../"+"FaceRecognition_Data"+'/'+"FA"+'/'+(FAdir(topIndices(i)+3).name))];
end;

 [X1,map1]=imread("../"+"FaceRecognition_Data"+'/'+"FB"+'/'+FBdir(n).name);
 [X2,map2]=imread(DIS(1));
 [X3,map3]=imread(DIS(2));
 [X4,map4]=imread(DIS(3));
 [X5,map5]=imread(DIS(4));
 [X6,map6]=imread(DIS(5));


 subplot(2,3,1), imshow(X1,map1);
 subplot(2,3,2), imshow(X2,map2);
 subplot(2,3,3), imshow(X3,map3);
 subplot(2,3,4), imshow(X4,map4);
 subplot(2,3,5), imshow(X5,map5);
 subplot(2,3,6), imshow(X6,map6);


t = sgtitle('Top left TEST image. From left to right in order of vicinity');
t.FontSize = 20;

