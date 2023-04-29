function [B, DB_FA] = createBandDBFA(Eigenfaces,meanImages, FA)

B=[];
for i=1:12
    y = double(FA(:,i))- meanImages;
    B = [B y];
end;

DB_FA = [];

for i=1:12
    x = Eigenfaces'*B(:,i);
    DB_FA = [DB_FA x]; 
end;