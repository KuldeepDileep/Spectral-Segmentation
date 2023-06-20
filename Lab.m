close all, clear all, clc
%% Segmentation:
load('painting.mat')
[row, col, channel] = size(cube.DataCube);
mask = zeros(row,col);

for i = 1:row
    for j = 1:col
        if mean(reshape(cube.DataCube(i,j,:),[],1)) < 0.79
            mask(i,j) = 1;
        end
    end
end

seg_img = zeros(row,col,channel);
for k = 1:channel
    seg = cube.DataCube(:,:,k).*mask;
    seg_img(:,:,k) = seg;
end

blue = seg_img(:,:,14);     % 465 nm
green = seg_img(:,:,31);    % 550 nm
red = seg_img(:,:,44);      % 615 nm
rgbImg =  cat(3, red, green, blue);
figure,
imshow(rgbImg)
%% Blue:
RMSE_mask = zeros(row,col);
SAM_mask = zeros(row,col);
SCM_mask = zeros(row,col);
GFC_mask = zeros(row,col);
blue_spectral = reshape(cube.DataCube(1300,300,:),[],1); 
for i = 1:row
    for j = 1:col
        sp = reshape(cube.DataCube(i,j,:),[],1);
        rmse_val = RMSE(blue_spectral,sp);
        SAM_val = SAM(blue_spectral,sp);
        SCM_val = SCM(blue_spectral,sp);
        GFC_val = GFC(blue_spectral,sp);
        if rmse_val < 0.115
            RMSE_mask(i,j) = 1;
        end
        if SAM_val < 0.17
            SAM_mask(i,j) = 1;
        end
        if SCM_val > 0.93
            SCM_mask(i,j) = 1;
        end
        if GFC_val > 0.988
            GFC_mask(i,j) = 1;
        end
    end
end

blue_RMSE = zeros(row,col,3);
blue_RMSE(:,:,3) = cube.DataCube(:,:,14).*RMSE_mask;
blue_RMSE(:,:,2) = cube.DataCube(:,:,31).*RMSE_mask;
blue_RMSE(:,:,1) = cube.DataCube(:,:,44).*RMSE_mask;

blue_SAM = zeros(row,col,3);
blue_SAM(:,:,3) = cube.DataCube(:,:,14).*SAM_mask;
blue_SAM(:,:,2) = cube.DataCube(:,:,31).*SAM_mask;
blue_SAM(:,:,1) = cube.DataCube(:,:,44).*SAM_mask;

blue_SCM = zeros(row,col,3);
blue_SCM(:,:,3) = cube.DataCube(:,:,14).*SCM_mask;
blue_SCM(:,:,2) = cube.DataCube(:,:,31).*SCM_mask;
blue_SCM(:,:,1) = cube.DataCube(:,:,44).*SCM_mask;

blue_GFC = zeros(row,col,3);
blue_GFC(:,:,3) = cube.DataCube(:,:,14).*GFC_mask;
blue_GFC(:,:,2) = cube.DataCube(:,:,31).*GFC_mask;
blue_GFC(:,:,1) = cube.DataCube(:,:,44).*GFC_mask;

figure,
subplot(141)
imshow(blue_RMSE)
title('RMSE')
subplot(142)
imshow(blue_SAM)
title('SAM')
subplot(143)
imshow(blue_SCM)
title('SCM')
subplot(144)
imshow(blue_GFC)
title('GFC')

a = blue_RMSE;
b = blue_SAM;
c = blue_SCM;
d  = blue_GFC;

%% yellow:
RMSE_mask = zeros(row,col);
SAM_mask = zeros(row,col);
SCM_mask = zeros(row,col);
GFC_mask = zeros(row,col);
yellow_spectral = reshape(cube.DataCube(900,750,:),[],1); 
for i = 1:row
    for j = 1:col
        sp = reshape(cube.DataCube(i,j,:),[],1);
        rmse_val = RMSE(yellow_spectral,sp);
        SAM_val = SAM(yellow_spectral,sp);
        SCM_val = SCM(yellow_spectral,sp);
        GFC_val = GFC(yellow_spectral,sp);
        if rmse_val < 0.061
            RMSE_mask(i,j) = 1;
        end
        if SAM_val < 0.059
            SAM_mask(i,j) = 1;
        end
        if SCM_val > 0.9937
            SCM_mask(i,j) = 1;
        end
        if GFC_val > 0.998
            GFC_mask(i,j) = 1;
        end
    end
end

blue_RMSE = zeros(row,col,3);
blue_RMSE(:,:,3) = cube.DataCube(:,:,14).*RMSE_mask;
blue_RMSE(:,:,2) = cube.DataCube(:,:,31).*RMSE_mask;
blue_RMSE(:,:,1) = cube.DataCube(:,:,44).*RMSE_mask;

blue_SAM = zeros(row,col,3);
blue_SAM(:,:,3) = cube.DataCube(:,:,14).*SAM_mask;
blue_SAM(:,:,2) = cube.DataCube(:,:,31).*SAM_mask;
blue_SAM(:,:,1) = cube.DataCube(:,:,44).*SAM_mask;

blue_SCM = zeros(row,col,3);
blue_SCM(:,:,3) = cube.DataCube(:,:,14).*SCM_mask;
blue_SCM(:,:,2) = cube.DataCube(:,:,31).*SCM_mask;
blue_SCM(:,:,1) = cube.DataCube(:,:,44).*SCM_mask;

blue_GFC = zeros(row,col,3);
blue_GFC(:,:,3) = cube.DataCube(:,:,14).*GFC_mask;
blue_GFC(:,:,2) = cube.DataCube(:,:,31).*GFC_mask;
blue_GFC(:,:,1) = cube.DataCube(:,:,44).*GFC_mask;

figure,
subplot(141)
imshow(blue_RMSE)
title('RMSE')
subplot(142)
imshow(blue_SAM)
title('SAM')
subplot(143)
imshow(blue_SCM)
title('SCM')
subplot(144)
imshow(blue_GFC)
title('GFC')

e = blue_RMSE;
f = blue_SAM;
g = blue_SCM;
h  = blue_GFC;

%% Pink:
RMSE_mask = zeros(row,col);
SAM_mask = zeros(row,col);
SCM_mask = zeros(row,col);
GFC_mask = zeros(row,col);
pink_spectral = reshape(cube.DataCube(1100,500,:),[],1); 
for i = 1:row
    for j = 1:col
        sp = reshape(cube.DataCube(i,j,:),[],1);
        rmse_val = RMSE(pink_spectral,sp);
        SAM_val = SAM(pink_spectral,sp);
        SCM_val = SCM(pink_spectral,sp);
        GFC_val = GFC(pink_spectral,sp);
        if rmse_val < 0.055
            RMSE_mask(i,j) = 1;
        end
        if SAM_val < 0.06
            SAM_mask(i,j) = 1;
        end
        if SCM_val > 0.995
            SCM_mask(i,j) = 1;
        end
        if GFC_val > 0.999
            GFC_mask(i,j) = 1;
        end
    end
end

blue_RMSE = zeros(row,col,3);
blue_RMSE(:,:,3) = cube.DataCube(:,:,14).*RMSE_mask;
blue_RMSE(:,:,2) = cube.DataCube(:,:,31).*RMSE_mask;
blue_RMSE(:,:,1) = cube.DataCube(:,:,44).*RMSE_mask;

blue_SAM = zeros(row,col,3);
blue_SAM(:,:,3) = cube.DataCube(:,:,14).*SAM_mask;
blue_SAM(:,:,2) = cube.DataCube(:,:,31).*SAM_mask;
blue_SAM(:,:,1) = cube.DataCube(:,:,44).*SAM_mask;

blue_SCM = zeros(row,col,3);
blue_SCM(:,:,3) = cube.DataCube(:,:,14).*SCM_mask;
blue_SCM(:,:,2) = cube.DataCube(:,:,31).*SCM_mask;
blue_SCM(:,:,1) = cube.DataCube(:,:,44).*SCM_mask;

blue_GFC = zeros(row,col,3);
blue_GFC(:,:,3) = cube.DataCube(:,:,14).*GFC_mask;
blue_GFC(:,:,2) = cube.DataCube(:,:,31).*GFC_mask;
blue_GFC(:,:,1) = cube.DataCube(:,:,44).*GFC_mask;

figure,
subplot(141)
imshow(blue_RMSE)
title('RMSE')
subplot(142)
imshow(blue_SAM)
title('SAM')
subplot(143)
imshow(blue_SCM)
title('SCM')
subplot(144)
imshow(blue_GFC)
title('GFC')

i = blue_RMSE;
j = blue_SAM;
k = blue_SCM;
l  = blue_GFC;

%% 
figure,
subplot(3,4,1)
imshow(a)
title('RMSE')
subplot(3,4,2)
imshow(b)
title('SAM')
subplot(3,4,3)
imshow(c)
title('SCM')
subplot(3,4,4)
imshow(d)
title('GFC')


subplot(3,4,5)
imshow(e)
title('RMSE')
subplot(3,4,6)
imshow(f)
title('SAM')
subplot(3,4,7)
imshow(g)
title('SCM')
subplot(3,4,8)
imshow(h)
title('GFC')


subplot(3,4,9)
imshow(i)
title('RMSE')
subplot(3,4,10)
imshow(j)
title('SAM')
subplot(3,4,11)
imshow(k)
title('SCM')
subplot(3,4,12)
imshow(l)
title('GFC')

%%
figure,
subplot(1,4,1)
imshow(rgbImg)
title('Painting')
subplot(1,4,2)
imshow(b)
title('Blue pigment')
subplot(1,4,3)
imshow(h)
title('Yellow pigment')
subplot(1,4,4)
imshow(j)
title('Pink pigment')