function [Eigenfaces, meanImages] = CreateEigenFaces(ALL)


meanImages = mean(ALL,2);

A = []; 
for i=1:35
    y = double(ALL(:,i))- meanImages;
    A = [A y];
end; 

L = A'*A;

[Vec Diag] = eig(L);

K_eig_vec = [];

for i = size(Vec,2) :-1: 20 
        K_eig_vec = [K_eig_vec Vec(:,i)];
end;

disp(size(L));

Eigenfaces = A * K_eig_vec;

disp(size(Eigenfaces));



