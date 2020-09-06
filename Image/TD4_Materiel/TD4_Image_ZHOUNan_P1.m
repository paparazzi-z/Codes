%% TD4 Introduction a l'image ZHOU-NAN

%% 1ire partie: La couleur en imagerie numerique
%% Question 1:
clear; close all; clc

I0=double(imread('ImagesTD4/couleurs.png'))/255;
figure; imshow(I0);title('couleurs');colorbar;axis on 
whos I0 
%%
% La difference de format Matlab entre une image niveau de gris et une
% image couleur ...

%%
I0(30,120,:)
% I(:,:,1) correspond a ...

%% Question 2:
figure;
subplot(2,2,1);imshow(I0);title('Original')
subplot(2,2,2);imshow(I0(:,:,1));title('Canal Rouge')
subplot(2,2,3);imshow(I0(:,:,2));title('Canal Vert')
subplot(2,2,4);imshow(I0(:,:,3));title('Canal Bleu')

%%
% Interpretation : ...

%% Question 3:
I1=double(imread('ImagesTD4/TSE1.png'))/255;
figure; 
subplot(2,2,1); imshow(I1);title('Atrium')
I1R(:,:,1)=I1(:,:,1);
I1R(:,:,2)=0;
I1R(:,:,3)=0;
subplot(222); imshow(I1R);title('Atrium_R')
I1G(:,:,2)=I1(:,:,2);
I1G(:,:,1)=0;
I1G(:,:,3)=0;
subplot(2,2,3);imshow(I1G);title('Atrium_G')
I1B(:,:,3)=I1(:,:,3);
I1B(:,:,1)=0;
I1B(:,:,2)=0;
subplot(2,2,4);imshow(I1B);title('Atrium_B')

%%
% Si chaque couleur est codee sous 8 bits (format uint8) combien de couleurs peuvent etre codees?
% 256*256*256
%% Question 4
[Iq,map]=rgb2ind(I1,5,'nodither');
figure
subplot(1,2,1);imshow(Iq,[]);colorbar
subplot(1,2,2);imshow(Iq,map);colorbar

%% Question 5
[Id,map1]=rgb2ind(I1,5,'dither');
figure
imshow(Id,map1);colorbar

%% Question 6
I2=double(imread('ImagesTD4/TSE2.jpg'))/255;
I2a=I2(:,:,1)/3+I2(:,:,2)/3+I2(:,:,3)/3;
figure
imshow(I2a,[]);

%% Question 7
BW1=edge(I2a,'sobel');
BW2=edge(I2a,'prewitt');
BW3=edge(I2a,'canny',0.2);
figure
subplot(2,2,1);imshow(I2a);title('Original');
subplot(2,2,2);imshow(BW1);title('Sobel');
subplot(2,2,3);imshow(BW2);title('Prewitt');
subplot(2,2,4);imshow(BW3);title('Canny');

%% Question 8
sel1=strel('line',10,45);
BW1_c=1-imclose(BW1,sel1);
BW2_c=1-imclose(BW2,sel1);
BW3_c=1-imclose(BW3,sel1);
figure
subplot(2,2,1);imshow(BW1_c,[]);title('Sobel Close');
subplot(2,2,2);imshow(BW2_c,[]);title('Prewitt Close');
subplot(2,2,3);imshow(BW3_c,[]);title('Canny Close');

%% Question 9
I2a_noise=imnoise(I2a,'salt & pepper');
BW_noise=edge(I2a_noise,'canny');
BW_noise_c=imclose(I2a_noise,sel1);
figure
subplot(2,2,1);imshow(I2a_noise,[]);title('noise');
subplot(2,2,2);imshow(BW_noise,[]);title('Canny noise');
subplot(2,2,4);imshow(BW_noise_c,[]);title('Canny noise close');

density = 0.005;
sel1_pos = strel('line',10,45);
sel1_neg = strel('line',4,135);
img_imp_pos = imnoise(ones(size(I2,1),size(I2,2)),'salt & pepper',density);
img_imp_neg = imnoise(ones(size(I2,1),size(I2,2)),'salt & pepper',density);
img_crayon_pos = imdilate(1-img_imp_pos, sel1_pos);
img_crayon_neg = imdilate(1-img_imp_neg, sel1_neg);
img_crayon = ~(img_crayon_pos | img_crayon_neg);
img_crayon = double(img_crayon);
figure;
imshow(img_crayon,[]); title('Effet fusain complementaire','Interpreter','latex');

%% Question 10
[Iq2,map2]=rgb2ind(I2,5,'dither');
img_fusain = ~BW3_c + ~double(img_crayon);
img_Final=uint8(~img_fusain).*Iq2;
figure
imshow(~img_fusain,[]);
figure
imshow(BW3_c,[]);
%% 
figure
subplot(2,2,1);imshow(I2,[]);
subplot(2,2,2);imshow(Iq2,map2);
subplot(2,2,3);imshow(~img_fusain,[]);
subplot(2,2,4);imshow(img_Final,map2);
%% Question 12
I2_hsv=rgb2hsv(I2);
figure
imshow(I2_hsv);

%% Question 13
R = I0(1:8:end,1:8:end,1); % on prend 1 pixel sur 8 pour aller plus vite
G = I0(1:8:end,1:8:end,2); % on prend 1 pixel sur 8 pour aller plus vite
B = I0(1:8:end,1:8:end,3); % on prend 1 pixel sur 8 pour aller plus vite
figure;
scatter3(R(:),G(:),B(:),1000,[R(:),G(:),B(:)],'Marker','.');
xlabel('R'); ylabel('G'); zlabel('B');
axis vis3d;

I_hsv=rgb2hsv(I0); % conversion en HSV
H = I_hsv(1:8:end,1:8:end,1); % extraction du canal L
S = I_hsv(1:8:end,1:8:end,2); % extraction du canal a
V = I_hsv(1:8:end,1:8:end,3); % extraction du canal b
figure;
scatter3(H(:),S(:),V(:),1000,[R(:),G(:),B(:)],'Marker','.');
xlabel('H'); ylabel('S'); zlabel('V');
axis vis3d;

%% Question 14
I3=double(imread('ImagesTD4/peppers.png'))/255;
figure
imshow(I3,[]);
R3 = I3(1:end,1:end,1); 
G3 = I3(1:end,1:end,2); 
B3 = I3(1:end,1:end,3); 
I3_hsv=rgb2hsv(I3); % conversion en HSV
H3 = I3_hsv(1:end,1:end,1); 
S3 = I3_hsv(1:end,1:end,2); 
V3 = I3_hsv(1:end,1:end,3); 
%%
figure;
scatter3(H3(:),S3(:),V3(:),1000,[R3(:),G3(:),B3(:)],'Marker','.');
xlabel('H'); ylabel('S'); zlabel('V');
axis vis3d;
%%
I3s=(H3>0.6)&(S3<0.6)&(V3<0.8)|(V3<0.1);
figure
imshow(I3s,[])