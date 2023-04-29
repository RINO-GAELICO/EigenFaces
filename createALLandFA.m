function [ALL, FA] = createALLandFA(imagesFiles,FAdir)

ALL = [];

folder = "ALL";
superFolder = "FaceRecognition_Data";

for i = 5:length(imagesFiles)
    img = imread("../"+"FaceRecognition_Data"+'/'+"ALL"+'/'+imagesFiles(i).name);
    imgVector = reshape(img,32*32,1);
    ALL = [ALL imgVector];
end;

FA = [];
for i=4:15
    img = imread("../"+"FaceRecognition_Data"+'/'+"FA"+'/'+FAdir(i).name);
    imgVector = reshape(img,32*32,1);
    FA = [FA imgVector];
end;